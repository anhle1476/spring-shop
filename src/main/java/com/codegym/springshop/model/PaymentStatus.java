package com.codegym.springshop.model;

public enum PaymentStatus {
	UNCONFIRMED(1), PROCESSING(2), PAID(3);

	int code;

	PaymentStatus(int code) {
		this.code = code;
	}

	public int getCode() {
		return code;
	}

	public static PaymentStatus getPaymentStatus(Order order) {
		boolean isConfirmed = order.getConfirmedTime() != null;
		boolean isPaid = order.getPaidTime() != null;
		
		if (isConfirmed && isPaid)
			return PAID;
		else if (isConfirmed)
			return PROCESSING;
		else
			return UNCONFIRMED;
	}

	public static PaymentStatus getPaymentStatus(int paymentCode) {
		switch (paymentCode) {
		case 1:
			return UNCONFIRMED;
		case 2:
			return PROCESSING;
		case 3:
			return PAID;
		default:
			throw new IllegalArgumentException("Payment Code invalid: " + paymentCode);
		}
	}
	
	public static PaymentStatus getNextStatus(PaymentStatus status) {
		switch (status) {
		case UNCONFIRMED:
			return PROCESSING;
		case PROCESSING:
		case PAID:
			return PAID;
		default:
			throw new IllegalArgumentException("Payment status invalid");
		}
	}
}
