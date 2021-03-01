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
import com.codegym.springshop.model.dto.CategoryStatisticDTO;
import com.codegym.springshop.service.ICategoryService;

@Controller
public class AdminCategoriesController {

	private static final String REDIRECT_ADMIN_CATEGORIES = "redirect:/admin/categories";
	private static final String ADMIN_CATEGORY_EDITOR = "admin/admin-category-editor";
	private static final String ADMIN_CATEGORIES_TABLE = "admin/admin-categories";
	
	@Autowired
	ICategoryService categoryService;
	
	/* LISTING */
	
	@GetMapping("/admin/categories")
	public String showCategoryPage(Model model) {
		CategoryStatisticDTO categoryStatisticDTO = categoryService.getCategoryStatistic();
		model.addAttribute("categoryStats", categoryStatisticDTO);
		return ADMIN_CATEGORIES_TABLE;
	}
	
	/* ADD */
	
	@GetMapping("/admin/categories/add")
	public String showAddCategory(@ModelAttribute("category") Category category) {
		return ADMIN_CATEGORY_EDITOR;
	}
	
	@PostMapping("/admin/categories/add")
	public String processAddCategory(@ModelAttribute("category") Category category) {
		boolean result = categoryService.addObj(category);
		if (result) 
			return REDIRECT_ADMIN_CATEGORIES;

		return ADMIN_CATEGORY_EDITOR;
	}
	
	
	/* EDIT */
	
	@GetMapping("/admin/categories/edit")
	public String showEditCategory(@RequestParam(name = "id", defaultValue = "-1") int id, Model model) {
		if (id <= 0)
			return REDIRECT_ADMIN_CATEGORIES;

		Category category = categoryService.getObjById(id);
		model.addAttribute("category", category);
		return ADMIN_CATEGORY_EDITOR;
	}
	
	@PostMapping("/admin/categories/edit")
	public String processEditCategory(@ModelAttribute("product") Category category, Model model) {
		boolean result = categoryService.updateObj(category);
		if (result)
			return REDIRECT_ADMIN_CATEGORIES;

		List<Category> categories = categoryService.getAllObjs();
		model.addAttribute("categories", categories);
		return ADMIN_CATEGORY_EDITOR;
	}
	
	
}
