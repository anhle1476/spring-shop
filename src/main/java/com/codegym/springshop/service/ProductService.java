package com.codegym.springshop.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codegym.springshop.dao.IProductDAO;
import com.codegym.springshop.model.Product;
import com.codegym.springshop.model.SortType;

@Service
public class ProductService implements IProductService {
	
	@Autowired
	private IProductDAO productDAO;

	@Override
	public List<Product> getAllObjs() {
		try {
			return productDAO.getAllObjs();
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}

	@Override
	public List<Product> getNthFirstObjs(int size) {
		try {
			return productDAO.getNthFirstObjs(size);
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}

	@Override
	public Product getObjById(int id) {
		try {
			return productDAO.getObjById(id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean addObj(Product product) {
		try {
			return productDAO.addObj(product);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateObj(Product product) {
		try {
			return productDAO.updateObj(product);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean deleteObj(int id) {
		try {
			return productDAO.deleteObj(id);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public List<Product> getObjsWithPagination(int size, int page, SortType sort, Object... args) {
		try {
			return productDAO.getObjsWithPagination(size, page, sort, args);
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}

	@Override
	public List<Product> getObjsWithPagination(int size, int page, SortType sort) {
		try {
			return productDAO.getObjsWithPagination(size, page, sort);
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}

	@Override
	public int getMaxPages(int size, Object... args) {
		try {
			return productDAO.getMaxPages(size, args);
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		}
	}

	@Override
	public int getMaxPages(int size) {
		try {
			return productDAO.getMaxPages(size);
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		}
	}

	@Override
	public List<Product> getProductsIn(String productIds) {
		try {
			return productDAO.getProductsIn(productIds);
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
}
