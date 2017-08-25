package com.test.MobileDAO;

import com.test.MobileDTO.Address;
import com.test.MobileDTO.TransactionDetail;
import com.test.MobileDTO.User;

public interface UserDAO {

	boolean addUser(User user);
	User getByEmail(String email);
	boolean addAddress(Address address);
	public int cartlineCount(int cartId);
	boolean addTransactionDetail(TransactionDetail detail);
}
