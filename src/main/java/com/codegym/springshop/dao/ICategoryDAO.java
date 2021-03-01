package com.codegym.springshop.dao;

import com.codegym.springshop.model.Category;
import com.codegym.springshop.model.dto.CategoryStatisticDTO;

public interface ICategoryDAO extends IBaseDAO<Category> {
	CategoryStatisticDTO getCategoryStatistic();
}
