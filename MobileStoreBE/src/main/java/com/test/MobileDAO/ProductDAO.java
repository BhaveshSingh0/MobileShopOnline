package com.test.MobileDAO;

import java.util.List;

import com.test.MobileDTO.Product;
import com.test.MobileDTO.ProductDescp;

public interface ProductDAO {

	boolean addProduct(Product product);
	List<Product> listProduct();
	boolean addPdescription(ProductDescp productDesc);
	
	ProductDescp viewproduct(String imagepath);
	Product get(int id);
}
