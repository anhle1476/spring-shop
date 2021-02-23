package com.codegym.springshop.dao;

import java.util.List;

public interface IBaseDAO<T> {
	
	List<T> getAllObjs();
	
	List<T> getNthFirstObjs(int size);
	
	T getObjById(long id);

	int addObj(T obj);
	
	int updateObj(T obj);
	
	int deleteObj(long id);
}
