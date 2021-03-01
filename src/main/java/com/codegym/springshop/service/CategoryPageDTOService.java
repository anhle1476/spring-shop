package com.codegym.springshop.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.codegym.springshop.model.Product;
import com.codegym.springshop.model.SortType;
import com.codegym.springshop.model.dto.CategoryPageDTO;

@Service
public class CategoryPageDTOService implements ICategoryPageDTOService {

	@Autowired
	IProductService productService;

	@Override
	public CategoryPageDTO fillDTO(CategoryPageDTO dto) {
		try {
			int size = dto.getSize();
			SortType sortType = dto.getSortType();
			int categoryId = dto.getCategoryId();
			int maxPage;
			List<Product> products;
			
			if (categoryId == 0) {
				maxPage = productService.getMaxPages(size);
				products = productService.getObjsWithPagination(size, dto.getPage(), sortType);
			} else {
				maxPage = productService.getMaxPages(size, categoryId);
				products = productService.getObjsWithPagination(size, dto.getPage(), sortType, categoryId);
			}
			
			dto.setMaxPage(maxPage);
			dto.setProducts(products);	
					
		} catch (Exception e) {
			e.printStackTrace();
		}
		return dto;
	}
}	

