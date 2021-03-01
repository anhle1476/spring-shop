package com.codegym.springshop.service;

import java.util.List;
import java.util.Map;

import com.codegym.springshop.model.Order;
import com.codegym.springshop.model.PaymentStatus;

public interface IPaymentService {
	boolean addPayment(Order bill);

	List<Order> showAllPayments();

	List<Order> showAllPayments(PaymentStatus status);

	Order showPaymentById(int id);

	boolean changePaymentStatus(int id);

	boolean editPaymentInfo(Order bill);

	boolean deletePayment(int id);
	
	Map<String, Long> getStatistic();
}
