package com.codegym.springshop.dao;

import java.util.List;

public interface IBaseDAO<T> {
	
	List<T> getAllObjs();
	
	List<T> getNthFirstObjs(int size);
	
	T getObjById(int id);

	boolean addObj(T obj);
	
	boolean updateObj(T obj);
	
	boolean deleteObj(int id);
}
