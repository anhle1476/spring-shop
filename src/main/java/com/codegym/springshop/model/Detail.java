package com.codegym.springshop.model;

public class Detail {
	private Product product;
	private long price;
	private int quantity;

	public Detail() {
	}

	public Detail(Product product, int quantity) {
		setProductWithPrice(product);
		this.quantity = quantity;
	}
	
	public Detail(Product product, long price, int quantity) {
		this.product = product;
		this.price = price;
		this.quantity = quantity;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}
	
	public void setProductWithPrice(Product product) {
		this.product = product;
		this.price = product.getPrice();
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	@Override
	public String toString() {
		return "Detail [product=" + product + ", price=" + price + ", quantity=" + quantity + "]";
	}
}
