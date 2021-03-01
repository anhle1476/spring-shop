package com.codegym.springshop.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.codegym.springshop.dao.extractor.CategoryStatisticExtractor;
import com.codegym.springshop.model.Category;
import com.codegym.springshop.model.dto.CategoryStatisticDTO;

@Repository
public class CategoryDAO implements ICategoryDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;
		
	@Override
	public List<Category> getAllObjs() {
		String query = "SELECT * FROM categories";
		return jdbcTemplate.query(query, new BeanPropertyRowMapper<Category>(Category.class));
	}
	
	@Override
	public List<Category> getNthFirstObjs(int size) {
		String query = "SELECT * FROM v_categoryStats "
				+ "ORDER BY numberOfProducts DESC LIMIT ?";
		return jdbcTemplate.query(query, new BeanPropertyRowMapper<Category>(Category.class), size);
	}
	
	@Override
	public Category getObjById(int id) {
		String query = "SELECT * FROM categories WHERE id=?";
		return jdbcTemplate.queryForObject(query, new BeanPropertyRowMapper<Category>(Category.class), id);
	}

	@Override
	public boolean addObj(Category obj) {
		String sql = "INSERT INTO `categories` (`name`) VALUES (?)";
		return jdbcTemplate.update(sql, obj.getName()) == 1;
	}

	@Override
	public boolean updateObj(Category obj) {
		String sql = "UPDATE `categories` SET `name` = ? WHERE (`id` = ?)";
		return jdbcTemplate.update(sql, obj.getName(), obj.getId()) == 1;
	}
	
	@Transactional
	@Override
	public boolean deleteObj(int id) {
		String deleteRelatedProductSql = "DELETE FROM products WHERE idCategory = ?";
		String deleteCategorySql = "DELETE FROM categories WHERE id = ?";
		
		jdbcTemplate.update(deleteRelatedProductSql, id);
		return jdbcTemplate.update(deleteCategorySql, id) > 0;
	}

	@Override
	public CategoryStatisticDTO getCategoryStatistic() {
		String sql = "SELECT * FROM v_categoryStats";
		return jdbcTemplate.query(sql, new CategoryStatisticExtractor());
	}

}
