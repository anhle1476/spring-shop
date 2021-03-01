package com.codegym.springshop.dao;

import java.sql.PreparedStatement;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.codegym.springshop.dao.extractor.DetailsRowMapper;
import com.codegym.springshop.dao.extractor.OrderTableRowMapper;
import com.codegym.springshop.dao.extractor.PaymentStatisticExtractor;
import com.codegym.springshop.model.Detail;
import com.codegym.springshop.model.Order;
import com.codegym.springshop.model.OrderDetail;
import com.codegym.springshop.model.PaymentInfo;
import com.codegym.springshop.model.PaymentStatus;

@Repository
public class PaymentDAO implements IPaymentDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	@Transactional
	public boolean addPayment(Order order) {
		if (order.getOrderDetail().getDetails().size() == 0)
			throw new RuntimeException("Can't add an order without any products.");
		
		int orderId = addPaymentInfo(order);
		return addPaymentDetails(order, orderId);
	}

	private int addPaymentInfo(Order order) {
		String addPaymentInfoSql = "INSERT INTO `orders`(`name`, `email`, `phone`, `address`) " 
				+ "VALUES (?, ?, ?, ?)";

		PaymentInfo info = order.getPaymentInfo();

		KeyHolder keyHolder = new GeneratedKeyHolder();
		int infoRowAffected = jdbcTemplate.update(connection -> {
			PreparedStatement ps = connection.prepareStatement(addPaymentInfoSql, new String[] { "id" });
			ps.setString(1, info.getName());
			ps.setString(2, info.getEmail());
			ps.setString(3, info.getPhone());
			ps.setString(4, info.getAddress());
			return ps;
		}, keyHolder);

		if (infoRowAffected != 1)
			throw new RuntimeException("Invalid payment info rows get affected.");

		return keyHolder.getKey().intValue();
	}

	private boolean addPaymentDetails(Order order, int orderId) {
		String insertDetailsSql = "INSERT INTO `orderDetails`(`idOrder`, `idProduct`, `price`, `quantity`) "
				+ "VALUES (?, ?, ?, ?)";

		List<Detail> details = order.getOrderDetail().getDetails();

		List<Object[]> batchArgs = new ArrayList<>();
		for (Detail detail : details) {
			batchArgs
					.add(new Object[] { 
							orderId, 
							detail.getProduct().getId(), 
							detail.getPrice(), 
							detail.getQuantity() 
						});
		}

		int[] rowsAffected = jdbcTemplate.batchUpdate(insertDetailsSql, batchArgs);
		for (int row : rowsAffected) {
			if (row != 1)
				throw new RuntimeException("Invalid row affected number " + Arrays.toString(rowsAffected));
		}
		return true;
	}

	@Override
	public List<Order> showAllPayments() {
		String sql = "SELECT * FROM v_orderAndTotalPrice";
		return jdbcTemplate.query(sql, new OrderTableRowMapper());
	}

	@Override
	public List<Order> showAllPayments(PaymentStatus status) {
		String template = "SELECT * FROM v_orderAndTotalPrice %s";
		String condition = getPaymentSqlCondition(status);
		
		String sql = String.format(template, condition);
		return jdbcTemplate.query(sql, new OrderTableRowMapper());
	}

	private String getPaymentSqlCondition(PaymentStatus status) {
		String condition = "";
		switch(status) {
		case UNCONFIRMED:
			condition = "WHERE confirmTime IS NULL AND paidTime IS NULL";
			break;
		case PROCESSING:
			condition = "WHERE confirmTime IS NOT NULL AND paidTime IS NULL";
			break;
		case PAID:
			condition = "WHERE confirmTime IS NOT NULL AND paidTime IS NOT NULL";
			break;
		}
		return condition;
	}

	@Override
	public Order showPaymentById(int id) {
		Order order = getOrderBasicInfoById(id);
		
		String orderDetailsSql = "SELECT * FROM v_orderDetailsWithProductInfo WHERE idOrder = ?";
		List<Detail> details = jdbcTemplate.query(orderDetailsSql, new DetailsRowMapper(), id);
		
		OrderDetail orderDetail = new OrderDetail();
		for (Detail detail : details) {
			orderDetail.addDetail(detail);
		}
		order.setOrderDetail(orderDetail);
		
		return order;
	}

	@Override
	public boolean changePaymentStatus(int id) {
		Order order = getOrderBasicInfoById(id);
		PaymentStatus status = PaymentStatus.getPaymentStatus(order);
		
		if (status == PaymentStatus.PAID)
			return false;
		
		String template = "UPDATE orders SET %s = now() WHERE id = ?";
		String column = status == PaymentStatus.UNCONFIRMED ? "confirmTime" : "paidTime";
		String sql = String.format(template, column);
		
		return jdbcTemplate.update(sql, id) == 1;
	}
	
	private Order getOrderBasicInfoById(int id) {
		String orderInfoSql = "SELECT * FROM v_orderAndTotalPrice WHERE id = ?";
		Order order = jdbcTemplate.queryForObject(orderInfoSql, new OrderTableRowMapper(), id);
		return order;
	}

	@Override
	public boolean editPaymentInfo(Order order) {
		String sql = "UPDATE `orders` "
				+ "SET `name` = ?, `email` = ?, `phone` = ?, `address` = ? "
				+ "WHERE `id` = ?";
		PaymentInfo info = order.getPaymentInfo();
		return jdbcTemplate.update(sql, info.getName(), info.getEmail(), 
				info.getPhone(), info.getAddress(), order.getId()) == 1;
	}

	@Override
	@Transactional
	public boolean deletePayment(int id) {
		String deleteDetailsSql = "DELETE FROM `orderDetails` WHERE `idOrder` = ?";
		int deleteDetailsRowsAffected = jdbcTemplate.update(deleteDetailsSql, id);
		if (deleteDetailsRowsAffected == 0)
			throw new RuntimeException("Invalid number of deleted details.");
		
		String deleteOrderSql = "DELETE FROM `orders` WHERE `id` = ?";
		int deleteOrderRowAffected = jdbcTemplate.update(deleteOrderSql, id);
		if (deleteOrderRowAffected != 1)
			throw new RuntimeException("Invalid number of deleted order.");
		
		return true;
	}

	@Override
	public Map<String, Long> getStatistic() {
		String sql = "SELECT * FROM v_shopStatistic";
		return jdbcTemplate.query(sql, new PaymentStatisticExtractor());
	}

}
