package com.codegym.springshop.service;

import java.util.List;

import com.codegym.springshop.model.Product;

public interface IProductService extends IBasePageableService<Product> {
	
	List<Product> getProductsIn(String productIds);

}
