package com.codegym.springshop.dao.extractor;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.ResultSetExtractor;

import com.codegym.springshop.model.Category;
import com.codegym.springshop.model.dto.CategoryStatisticDTO;

public class CategoryStatisticExtractor implements ResultSetExtractor<CategoryStatisticDTO> {

	@Override
	public CategoryStatisticDTO extractData(ResultSet rs) throws SQLException, DataAccessException {
		CategoryStatisticDTO dto = new CategoryStatisticDTO();
		while (rs.next()) {
			int id = rs.getInt("id");
			String name = rs.getString("name");
			Category category = new Category(id, name);
			int numberOfProducts = rs.getInt("numberOfProducts");
			dto.addStatistic(category, numberOfProducts);
		}
		return dto;
	}

}
