package com.codegym.springshop.controller.admin;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.codegym.springshop.model.Category;
import com.codegym.springshop.model.Product;
import com.codegym.springshop.service.ICategoryService;
import com.codegym.springshop.service.IProductService;

@Controller
public class AdminProductsController {
	
	private static final String ADMIN_PRODUCTS_TABLE = "admin/admin-products";
	private static final String ADMIN_PRODUCT_EDITOR = "admin/admin-editor";
	private static final String REDIRECT_ADMIN_PRODUCTS = "redirect:/admin/products";
	@Autowired
	IProductService productService;
	@Autowired
	ICategoryService categoryService;
	
	/* LISTING */
	
	@GetMapping("/admin/products")
	public String showProductsPage(Model model) {
		List<Product> products = productService.getAllObjs();
		model.addAttribute("products", products);
		return ADMIN_PRODUCTS_TABLE;
	}
	
	/* ADD */
	
	@GetMapping("/admin/products/add")
	public String showAddProduct(@ModelAttribute("product") Product product, Model model) {
		bindCategoryList(model);
		return ADMIN_PRODUCT_EDITOR;
	}
	
	@PostMapping("/admin/products/add")
	public String processAddProduct(@ModelAttribute("product") Product product, Model model) {
		boolean result = productService.addObj(product);
		if (result) 
			return REDIRECT_ADMIN_PRODUCTS;

		bindCategoryList(model);
		return ADMIN_PRODUCT_EDITOR;
	}
	
	/* EDIT */ 

	@GetMapping("/admin/products/edit")
	public String showEditProduct(@RequestParam(name = "id", defaultValue = "-1") int id, Model model) {
		if (id <= 0)
			return REDIRECT_ADMIN_PRODUCTS;

		Product product = productService.getObjById(id);
		model.addAttribute("product", product);

		bindCategoryList(model);
		return ADMIN_PRODUCT_EDITOR;
	}

	@PostMapping("/admin/products/edit")
	public String processEditProduct(@ModelAttribute("product") Product product, Model model) {
		boolean result = productService.updateObj(product);
		if (result)
			return REDIRECT_ADMIN_PRODUCTS;

		bindCategoryList(model);
		return ADMIN_PRODUCT_EDITOR;
	}
	
	public void bindCategoryList(Model model) {
		List<Category> categories = categoryService.getAllObjs();
		model.addAttribute("categories", categories);
	}

}
