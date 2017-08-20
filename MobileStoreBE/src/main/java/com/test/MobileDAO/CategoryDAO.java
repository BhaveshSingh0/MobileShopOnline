package com.test.MobileDAO;

import java.util.List;

import com.test.MobileDTO.Category;

public interface CategoryDAO {
	
  boolean add(Category  category);
	List<Category> listCat();
	Category get(int id);
	boolean deleteCategory(int id);
	
	

	
}
