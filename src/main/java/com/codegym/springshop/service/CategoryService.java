package com.codegym.springshop.service;

import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codegym.springshop.dao.ICategoryDAO;
import com.codegym.springshop.model.Category;
import com.codegym.springshop.model.dto.CategoryStatisticDTO;

@Service
public class CategoryService implements ICategoryService {

	@Autowired
	private ICategoryDAO categoryDAO;
	
	@Override
	public List<Category> getAllObjs() {
		try {
			return categoryDAO.getAllObjs();
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}
	
	@Override
	public List<Category> getNthFirstObjs(int size) {
		try {
			return categoryDAO.getNthFirstObjs(size);
		} catch (Exception e) {
			e.printStackTrace();
			return Collections.emptyList();
		}
	}

	@Override
	public Category getObjById(int id) {
		try {
			return categoryDAO.getObjById(id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean addObj(Category category) {
		try {
			return categoryDAO.addObj(category);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean updateObj(Category obj) {
		try {
			return categoryDAO.updateObj(obj);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public boolean deleteObj(int id) {
		try {
			return categoryDAO.deleteObj(id);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public CategoryStatisticDTO getCategoryStatistic() {
		try {
			return categoryDAO.getCategoryStatistic();
		} catch (Exception e) {			
			return new CategoryStatisticDTO();
		}
	}
}
