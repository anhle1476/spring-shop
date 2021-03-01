package com.codegym.springshop.model.dto;

import java.util.ArrayList;
import java.util.List;

import com.codegym.springshop.model.Category;

public class CategoryListDTO {
	List<Category> categories = new ArrayList<>();

	public CategoryListDTO() {

	}

	public CategoryListDTO(List<Category> categories) {
		this.categories = categories;
	}

	public List<Category> getCategories() {
		return categories;
	}

	public void setCategories(List<Category> categories) {
		this.categories = categories;
	}

	@Override
	public String toString() {
		return "CategoryListDTO [categories=" + categories + "]";
	}
}
