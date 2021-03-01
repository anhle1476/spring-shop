package com.codegym.springshop.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.codegym.springshop.dao.extractor.ProductRowMapper;
import com.codegym.springshop.model.Product;
import com.codegym.springshop.model.SortType;

@Repository
public class ProductDAO implements IProductDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;

	@Override
	public List<Product> getAllObjs() {
		String sql = "SELECT * FROM v_productDetails ORDER BY createdDate DESC";
		return jdbcTemplate.query(sql, new ProductRowMapper());
	}

	@Override
	public List<Product> getNthFirstObjs(int size) {
		String sql = "SELECT * FROM v_productDetails ORDER BY createdDate DESC LIMIT ?";
		return jdbcTemplate.query(sql, new ProductRowMapper(), size);
	}

	@Override
	public Product getObjById(int id) {
		String sql = "SELECT * FROM v_productDetails WHERE id = ?";
		return jdbcTemplate.queryForObject(sql, new ProductRowMapper(), id);
	}

	@Override
	public boolean addObj(Product product) {
		String sql = "INSERT INTO `products`(`name`,`price`,`imgUrl`,`details`,`idCategory`)" + "VALUES(?,?,?,?,?)";
		int affected = jdbcTemplate.update(sql, product.getName(), product.getPrice(), product.getImgUrl(),
				product.getDetails(), product.getCategory().getId());
		return affected == 1;
	}

	@Override
	public boolean updateObj(Product product) {
		String sql = "UPDATE `products` SET " + "`name` = ?, " + "`price` = ?, " + "`imgUrl` = ?, " + "`details` = ?, "
				+ "idCategory = ? " + "WHERE (`id` = ?)";
		int affectedRow = jdbcTemplate.update(sql, product.getName(), product.getPrice(), product.getImgUrl(),
				product.getDetails(), product.getCategory().getId(), product.getId());
		return affectedRow == 1;
	}

	@Override
	public boolean deleteObj(int id) {
		String sql = "DELETE FROM `products` WHERE id = ?";
		return jdbcTemplate.update(sql, id) == 1;
	}

	@Override
	public List<Product> getObjsWithPagination(int size, int page, SortType sort, Object... args) {
		String sqlTemplate = "SELECT * FROM v_productDetails WHERE idCategory = ? "
				+ "ORDER BY %s LIMIT %d OFFSET %d";
		String sql = preparePaginationSqlFormat(size, page, sort, sqlTemplate);
		return jdbcTemplate.query(sql, new ProductRowMapper(), args);
	}

	@Override
	public List<Product> getObjsWithPagination(int size, int page, SortType sort) {
		String sqlTemplate = "SELECT * FROM v_productDetails ORDER BY %s LIMIT %d OFFSET %d";
		String sql = preparePaginationSqlFormat(size, page, sort, sqlTemplate);
		return jdbcTemplate.query(sql, new ProductRowMapper());
	}

	@Override
	public int getMaxPages(int size, Object... args) {
		String sql = "SELECT COUNT(id) FROM products WHERE idCategory = ?";
		int total = jdbcTemplate.queryForObject(sql, Integer.class, args);
		return getNumberOfPage(total, size);
	}

	@Override
	public int getMaxPages(int size) {
		String sql = "SELECT COUNT(id) FROM products";
		int total = jdbcTemplate.queryForObject(sql, Integer.class);
		return getNumberOfPage(total, size);
	}
	
	@Override
	public List<Product> getProductsIn(String productIds) {
		String template = "SELECT * FROM spring_shop.v_productDetails WHERE id IN (%s)";
		String sql = String.format(template, productIds);
		return jdbcTemplate.query(sql, new ProductRowMapper());
	}

	private int getNumberOfPage(int total, int size) {
		return (int) Math.ceil(total / (float) size);
	}

	private String preparePaginationSqlFormat(int size, int page, SortType sort, String sqlTemplate) {
		int offset = getOffset(size, page);
		String condition = getSortCondition(sort);
		return String.format(sqlTemplate, condition, size, offset);
	}

	private String getSortCondition(SortType type) {
		switch (type) {
		case BY_PRICE_ASC:
			return "price ASC";
		case BY_PRICE_DESC:
			return "price DESC";
		default:
			return "createdDate DESC";
		}
	}

	private int getOffset(int size, int page) {
		return size * (page - 1);
	}

	

}
