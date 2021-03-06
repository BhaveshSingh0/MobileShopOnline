package com.test.MobileDAO;

import java.util.List;

import com.test.MobileDTO.Product;
import com.test.MobileDTO.ProductDescp;

public interface ProductDAO {

	boolean addProduct(Product product);
	List<Product> listProduct();
	boolean addPdescription(ProductDescp productDesc);
     List<String> getAllName();
	ProductDescp viewproduct(String imagepath);
	Product get(int id);
	List<Product> getByName(String name);
	boolean updatePdescription(ProductDescp productDesc);
	boolean DeletePdescription(String id);
	   
	boolean updateProduct(Product p);
	boolean deleteProduct(int id);
}
