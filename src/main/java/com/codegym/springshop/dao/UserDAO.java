package com.codegym.springshop.dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.codegym.springshop.model.User;

@Repository
public class UserDAO implements IUserDAO {

	@Autowired
	JdbcTemplate jdbcTemplate;
	
	@Override
	public boolean register(String username, String password) {
		String sql = "INSERT INTO `users`(`username`,`password`) VALUES (?, sha1(?))";
		return jdbcTemplate.update(sql, username, password) == 1;
	}

	@Override
	public User login(String username, String password) {
		String sql = "SELECT id, username FROM `users` WHERE username = ? AND password = sha1(?)";
		
		return jdbcTemplate.queryForObject(
				sql, 
				(rs, i) -> new User(rs.getInt("id"), rs.getString("username")), 
				username, 
				password
		);
	}

	@Override
	public boolean changePassword(User user) {
		String sql = "UPDATE `users` SET password = sha1(?) WHERE id = ? AND password = sha1(?)";
		return jdbcTemplate.update(sql, user.getNewPassword(), user.getId(), user.getCurrentPassword()) == 1;
	}

}
