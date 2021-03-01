package com.codegym.springshop.service;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codegym.springshop.dao.IPaymentDAO;
import com.codegym.springshop.model.Order;
import com.codegym.springshop.model.PaymentStatus;

@Service
public class PaymentService implements IPaymentService {
	
	@Autowired
	IPaymentDAO paymentDAO;

	@Override
	public boolean addPayment(Order order) {
		try {
			return paymentDAO.addPayment(order);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Order> showAllPayments() {
		try {
			return paymentDAO.showAllPayments();
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}

	@Override
	public List<Order> showAllPayments(PaymentStatus status) {
		try {
			return paymentDAO.showAllPayments(status);
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}

	@Override
	public Order showPaymentById(int id) {
		try {
			return paymentDAO.showPaymentById(id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean changePaymentStatus(int id) {
		try {
			return paymentDAO.changePaymentStatus(id);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean editPaymentInfo(Order order) {
		try {
			return paymentDAO.editPaymentInfo(order);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean deletePayment(int id) {
		try {
			return paymentDAO.deletePayment(id);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public Map<String, Long> getStatistic() {
		try {
			return paymentDAO.getStatistic();
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyMap();
		}
	}

}
