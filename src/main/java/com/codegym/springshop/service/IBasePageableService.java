package com.codegym.springshop.service;

import java.util.List;

import com.codegym.springshop.model.SortType;

public interface IBasePageableService<T> extends IBaseService<T> {

	List<T> getObjsWithPagination(int size, int page, SortType sort, Object... args);

	List<T> getObjsWithPagination(int size, int page, SortType sort);

	int getMaxPages(int size, Object... args);

	int getMaxPages(int size);

}
