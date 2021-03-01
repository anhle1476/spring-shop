package com.codegym.springshop.service;

import com.codegym.springshop.model.User;

public interface IUserService {
	boolean register(String username, String password);
	
	User login(String username, String password);
	
	boolean changePassword(User user);
}
