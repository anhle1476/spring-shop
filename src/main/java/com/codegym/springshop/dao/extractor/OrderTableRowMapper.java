package com.codegym.springshop.dao.extractor;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.codegym.springshop.model.Order;
import com.codegym.springshop.model.PaymentInfo;

public class OrderTableRowMapper implements RowMapper<Order> {

	@Override
	public Order mapRow(ResultSet rs, int rowNum) throws SQLException {
		PaymentInfo info = new PaymentInfo();
		info.setName(rs.getString("name"));
		info.setEmail(rs.getString("email"));
		info.setPhone(rs.getString("phone"));
		info.setAddress(rs.getString("address"));

		Order bill = new Order();
		bill.setId(rs.getInt("id"));
		bill.setCreatedTime(rs.getTimestamp("createdTime"));
		bill.setConfirmedTime(rs.getTimestamp("confirmTime"));
		bill.setPaidTime(rs.getTimestamp("paidTime"));
		bill.setTotalPrice(rs.getLong("totalPrice"));
		bill.setPaymentInfo(info);

		return bill;
	}

}
