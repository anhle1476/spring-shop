package com.codegym.springshop.model;

public class Product {
	private long id;
	private String name;
	private String imgUrl;
	private float discount;
	private long price;
	private String details;
	private Category category;
	private boolean isNew;

	public Product() {
	}

	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getImgUrl() {
		return imgUrl;
	}

	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}

	public float getDiscount() {
		return discount;
	}

	public void setDiscount(float discount) {
		this.discount = discount;
	}

	public long getPrice() {
		return price;
	}

	public void setPrice(long price) {
		this.price = price;
	}

	public String getDetails() {
		return details;
	}

	public void setDetails(String details) {
		this.details = details;
	}

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public boolean isNew() {
		return isNew;
	}

	public void setNew(boolean isNew) {
		this.isNew = isNew;
	}

	@Override
	public String toString() {
		return "Product [id=" + id + ", name=" + name + ", imgUrl=" + imgUrl + ", discount=" + discount + ", price="
				+ price + ", details=" + details + ", category=" + category + ", isNew=" + isNew + "]";
	}
	
	

}
