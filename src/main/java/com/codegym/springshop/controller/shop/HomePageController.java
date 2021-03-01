package com.codegym.springshop.controller.shop;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import com.codegym.springshop.model.Category;
import com.codegym.springshop.model.Product;
import com.codegym.springshop.service.ICategoryService;
import com.codegym.springshop.service.IMetaDataService;
import com.codegym.springshop.service.IProductService;

@Controller
public class HomePageController {
	
	@Autowired
	IProductService productService;
	@Autowired
	IMetaDataService metaDataService;
	@Autowired
	ICategoryService categoryService;
	
	@GetMapping("/")
	public String showHomePage(Model model) {
		model.addAttribute("meta", metaDataService.getMetaData());
		
		List<Product> lastedProducts = productService.getNthFirstObjs(9);
		model.addAttribute("lastedProducts", lastedProducts);
		
		List<Category> topCategories = categoryService.getNthFirstObjs(4);
		model.addAttribute("topCategories", topCategories);
		
		return "shop/index";
	}

	
}
