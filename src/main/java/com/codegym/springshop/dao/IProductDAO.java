package com.codegym.springshop.dao;

import java.util.List;

import com.codegym.springshop.model.Product;

public interface IProductDAO extends IBasePageableDAO<Product> {
	List<Product> getProductsIn(String productIds);
}
