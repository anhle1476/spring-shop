package com.codegym.springshop.dao;

import com.codegym.springshop.model.User;

public interface IUserDAO {
	boolean register(String username, String password);
	
	User login(String username, String password);
	
	boolean changePassword(User user);
}
