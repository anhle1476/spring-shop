package com.codegym.springshop.controller.shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;

import com.codegym.springshop.model.Product;
import com.codegym.springshop.service.IProductService;

@Controller
public class ProductDetailsPage {
	@Autowired
	IProductService productService;
	
	@GetMapping("/product/{id}")
	public String showProductPage(@PathVariable("id") int id,
			Model model
			) {
		Product product = productService.getObjById(id);
		model.addAttribute("product", product);
		return "shop/detail";
	}
}
