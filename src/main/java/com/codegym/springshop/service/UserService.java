package com.codegym.springshop.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codegym.springshop.dao.IUserDAO;
import com.codegym.springshop.model.User;

@Service
public class UserService implements IUserService {

	@Autowired
	IUserDAO userDAO;
	
	@Override
	public boolean register(String username, String password) {
		try {
			return userDAO.register(username, password);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public User login(String username, String password) {
		try {
			return userDAO.login(username, password);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean changePassword(User user) {
		try {
			return userDAO.changePassword(user);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

}
