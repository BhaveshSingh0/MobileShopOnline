package com.test.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.test.MobileDAO.UserDAO;
import com.test.MobileDTO.Cart;
import com.test.MobileDTO.User;

@Controller
public class userController {
/*	
	@Autowired
	private SellerDAO sellerDAO;
*/	
	@Autowired
	private UserDAO userDAO;

	
	
	@RequestMapping(value= "/addUser")
	public ModelAndView addUser(
			@RequestParam("firstname") String fname ,
			@RequestParam("lastname") String lname ,
			@RequestParam("mobile") String mobile ,
			@RequestParam("pass") String pass ,
			@RequestParam("email_add") String email 
			){
		
		
		 Cart cart = new Cart();
		User  u=  new User();
		u.setFirstname(fname);
		u.setLastname(lname);
		u.setMobile(mobile);
		u.setEmail_add(email);
		u.setPass(pass);
		u.setRole("USER");
	
		
		  
		if(u.getRole().equals("USER")) {
            
			
			cart.setUser(u);
			cart.setCartLines(0);
			cart.setGrandTotal(0);
			
			
			
		}
       		
		u.setCart(cart);

		userDAO.addUser(u);
		
		ModelAndView mv =  new ModelAndView("register");
		return mv ;
		
	}
	
}
