package com.codegym.springshop.dao;

import java.util.List;
import java.util.Map;

import com.codegym.springshop.model.Order;
import com.codegym.springshop.model.PaymentStatus;

public interface IPaymentDAO {
	boolean addPayment(Order order);

	List<Order> showAllPayments();

	List<Order> showAllPayments(PaymentStatus status);

	Order showPaymentById(int id);

	boolean changePaymentStatus(int id);

	boolean editPaymentInfo(Order order);

	boolean deletePayment(int id);
	
	Map<String, Long> getStatistic();
}
