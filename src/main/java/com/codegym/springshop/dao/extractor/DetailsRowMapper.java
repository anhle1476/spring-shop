package com.codegym.springshop.dao.extractor;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.codegym.springshop.model.Category;
import com.codegym.springshop.model.Detail;
import com.codegym.springshop.model.Product;

public class DetailsRowMapper implements RowMapper<Detail> {

	@Override
	public Detail mapRow(ResultSet rs, int rowNum) throws SQLException {
		Category category = new Category(rs.getInt("idCategory"), rs.getString("nameCategory"));
		
		Product product = new Product();
		product.setId(rs.getInt("idProduct"));
		product.setPrice(rs.getInt("price"));
		product.setName(rs.getString("nameProduct"));
		product.setCategory(category);
		
		return new Detail(product, rs.getInt("quantity"));
	}

}
