package com.codegym.springshop.model.dto;

import java.util.HashMap;
import java.util.Map;

import com.codegym.springshop.model.Category;

public class CategoryStatisticDTO {
	private Map<Category, Integer> statisticMap;
	
	public CategoryStatisticDTO() {
		this.statisticMap = new HashMap<>();
	}

	public Map<Category, Integer> getStatisticMap() {
		return statisticMap;
	}

	public void setStatisticMap(Map<Category, Integer> statisticMap) {
		this.statisticMap = statisticMap;
	}
	
	public void addStatistic(Category category, int numberOfProducts) {
		statisticMap.put(category, numberOfProducts);
	}

	@Override
	public String toString() {
		return "CategoryStatisticDTO [" + statisticMap + "]";
	}
}
