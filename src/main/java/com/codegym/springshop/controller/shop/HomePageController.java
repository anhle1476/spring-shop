package com.codegym.springshop.controller.shop;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomePageController {
	
	@GetMapping("/")
	public String showHomePage() {
		return "shop/index";
	}
	
	@GetMapping("/test")
	public String showTestPage() {
		
		return "shop/data-test";
	}

}
