package com.codegym.springshop.model;

import java.util.List;

public class Bill {
	private PaymentInfo paymentInfo;
	private List<BillDetail> billDetails;

	public Bill() {
	}

	public Bill(PaymentInfo paymentInfo, List<BillDetail> billDetails) {
		this.paymentInfo = paymentInfo;
		this.billDetails = billDetails;
	}

	public PaymentInfo getPaymentInfo() {
		return paymentInfo;
	}

	public void setPaymentInfo(PaymentInfo paymentInfo) {
		this.paymentInfo = paymentInfo;
	}

	public List<BillDetail> getBillDetails() {
		return billDetails;
	}

	public void setBillDetails(List<BillDetail> billDetails) {
		this.billDetails = billDetails;
	}

	public void addBillDetail(BillDetail billDetail) {
		this.billDetails.add(billDetail);
	}

	@Override
	public String toString() {
		return "Bill [paymentInfo=" + paymentInfo + ", billDetails=" + billDetails + "]";
	}

}
