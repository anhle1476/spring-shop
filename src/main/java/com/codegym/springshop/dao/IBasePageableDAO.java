package com.codegym.springshop.dao;

import java.util.List;

public interface IBasePageableDAO<T> extends IBaseDAO<T> {

	List<T> getObjsWithPagination(int size, int page, int type);
}
