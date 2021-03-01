package com.codegym.springshop.service;

import com.codegym.springshop.model.Category;
import com.codegym.springshop.model.dto.CategoryStatisticDTO;

public interface ICategoryService extends IBaseService<Category> {
	CategoryStatisticDTO getCategoryStatistic();
}
