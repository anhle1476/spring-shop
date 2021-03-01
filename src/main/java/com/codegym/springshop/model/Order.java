package com.codegym.springshop.model;

import java.util.Date;

public class Order {
	private int id;
	private PaymentInfo paymentInfo;
	private OrderDetail orderDetail;
	private Date createdTime;
	private Date confirmedTime;
	private Date paidTime;
	private long totalPrice;

	public Order() {

	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public PaymentInfo getPaymentInfo() {
		return paymentInfo;
	}

	public void setPaymentInfo(PaymentInfo paymentInfo) {
		this.paymentInfo = paymentInfo;
	}

	public OrderDetail getOrderDetail() {
		return orderDetail;
	}

	public void setOrderDetail(OrderDetail orderDetail) {
		this.orderDetail = orderDetail;
	}

	public Date getCreatedTime() {
		return createdTime;
	}

	public void setCreatedTime(Date createdTime) {
		this.createdTime = createdTime;
	}

	public Date getConfirmedTime() {
		return confirmedTime;
	}

	public void setConfirmedTime(Date confirmedTime) {
		this.confirmedTime = confirmedTime;
	}

	public Date getPaidTime() {
		return paidTime;
	}

	public void setPaidTime(Date paidTime) {
		this.paidTime = paidTime;
	}

	public long getTotalPrice() {
		return totalPrice;
	}

	public void setTotalPrice(long totalPrice) {
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "Order [id=" + id + ", paymentInfo=" + paymentInfo + ", orderDetail=" + orderDetail + ", createdTime="
				+ createdTime + ", confirmedTime=" + confirmedTime + ", paidTime=" + paidTime + ", totalPrice="
				+ totalPrice + "]";
	}

}
