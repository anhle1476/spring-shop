package com.codegym.springshop.controller.admin;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

import com.codegym.springshop.model.User;
import com.codegym.springshop.service.IUserService;

@Controller
public class AdminLoginController {

	@Autowired
	IUserService userService;
	
	@GetMapping("/login")
	public String showLoginPage(@ModelAttribute("user") User user) {
		return "admin/admin-login";
	}
	
	@PostMapping("/login")
	public String processLogin(@ModelAttribute("user") User user, HttpSession session) {
		User login = userService.login(user.getUsername(), user.getCurrentPassword());
		if (login == null) {
			session.setAttribute("login-failed", true);
			return "admin/admin-login";
		} else {
			session.setAttribute("user", login);
			return "redirect:/admin";
		}
	}
	
	@GetMapping("/admin/logout")
	public String showLoginPage(HttpSession session) {
		session.removeAttribute("user");
		session.invalidate();
		return "redirect:/login";
	}
}
