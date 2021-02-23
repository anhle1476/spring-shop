package com.codegym.springshop.model;

public class BillDetail {
	private Product product;
	private long price;
	private int amount;
	private int discount;

	public BillDetail() {
	}

	public BillDetail(Product product, long price, int amount, int discount) {
		this.product = product;
		this.price = price;
		this.amount = amount;
		this.discount = discount;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public int getAmount() {
		return amount;
	}

	public void setAmount(int amount) {
		this.amount = amount;
	}

	public int getDiscount() {
		return discount;
	}

	public void setDiscount(int discount) {
		this.discount = discount;
	}

	@Override
	public String toString() {
		return "BillDetail [product=" + product + ", price=" + price + ", amount=" + amount + ", discount=" + discount
				+ "]";
	}
}
