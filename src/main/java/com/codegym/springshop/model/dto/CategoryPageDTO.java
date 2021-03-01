package com.codegym.springshop.model.dto;

import java.util.ArrayList;
import java.util.List;

import com.codegym.springshop.model.Product;
import com.codegym.springshop.model.SortType;

public class CategoryPageDTO {

	private List<Product> products = new ArrayList<>();
	private SortType sortType = SortType.DEFAULT;
	private int categoryId;
	private int maxPage;
	private int page;
	private int size = 12;

	public CategoryPageDTO() {
	}

	public List<Product> getProducts() {
		return products;
	}

	public void setProducts(List<Product> products) {
		this.products = products;
	}

	public SortType getSortType() {
		return sortType;
	}

	public void setSortType(SortType sortType) {
		this.sortType = sortType;
	}

	public int getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(int categoryId) {
		this.categoryId = categoryId;
	}

	public int getMaxPage() {
		return maxPage;
	}

	public void setMaxPage(int maxPage) {
		this.maxPage = maxPage;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}

	public int getSize() {
		return size;
	}

	public void setSize(int size) {
		this.size = size;
	}

	@Override
	public String toString() {
		return "CategoryPageDTO [products=" + products + ", sortType=" + sortType + ", categoryId=" + categoryId
				+ ", maxPage=" + maxPage + ", page=" + page + ", size=" + size + "]";
	}
}
