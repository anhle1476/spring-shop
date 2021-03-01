package com.codegym.springshop.controller.shop;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.codegym.springshop.model.SortType;
import com.codegym.springshop.model.dto.CategoryListDTO;
import com.codegym.springshop.model.dto.CategoryPageDTO;
import com.codegym.springshop.service.ICategoryPageDTOService;
import com.codegym.springshop.service.ICategoryService;

@Controller
@ControllerAdvice(basePackages = { "com.codegym.springshop.controller.shop" })
public class CategoryPageController {

	private static final String CATEGORY_PAGE = "shop/shop";
	@Autowired
	ICategoryPageDTOService dtoService;
	@Autowired
	ICategoryService categoryService;

	@ModelAttribute("catDto")
	public CategoryListDTO getCategoryListDTO() {
		return new CategoryListDTO(categoryService.getAllObjs());
	}

	@GetMapping("/categories")
	public String showAllProducts(
			@ModelAttribute("dto") CategoryPageDTO dto,
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "sort", defaultValue = "default") String sort
	) {
		dto.setPage(page);
		dto.setSortType(SortType.parseValue(sort));
		dtoService.fillDTO(dto);
		return CATEGORY_PAGE;
	}

	@GetMapping("/categories/{catId}")
	public String showCategoryPage(@PathVariable(name = "catId") int catId,
			@ModelAttribute("dto") CategoryPageDTO dto,
			@RequestParam(name = "page", defaultValue = "1") int page,
			@RequestParam(name = "sort", defaultValue = "default") String sort) {
		dto.setPage(page);
		dto.setSortType(SortType.parseValue(sort));
		dto.setCategoryId(catId);
		dtoService.fillDTO(dto);
		return CATEGORY_PAGE;
	}

}
