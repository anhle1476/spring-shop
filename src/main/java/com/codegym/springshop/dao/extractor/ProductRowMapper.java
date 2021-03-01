package com.codegym.springshop.dao.extractor;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.codegym.springshop.model.Category;
import com.codegym.springshop.model.Product;

public class ProductRowMapper implements RowMapper<Product> {

	@Override
	public Product mapRow(ResultSet rs, int rowNum) throws SQLException {
		Product product = new Product();
		product.setId(rs.getInt("id"));
		product.setName(rs.getString("name"));
		product.setPrice(rs.getInt("price"));
		product.setImgUrl(rs.getString("imgUrl"));
		product.setDetails(rs.getString("details"));
		product.setCreatedDate(rs.getTimestamp("createdDate"));
		
		Category category = new Category(rs.getInt("idCategory"), rs.getString("nameCategory"));
		product.setCategory(category);
		
		return product;
	}

}
