package com.test.MobileDAO;

import java.util.List;

import com.test.MobileDTO.Seller;

public interface SellerDAO {
	boolean addSeller(Seller seller);
	List<Seller> listSeller();
}
