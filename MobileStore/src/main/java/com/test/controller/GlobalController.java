package com.test.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.test.MobileDAO.UserDAO;
import com.test.MobileDTO.User;
import com.test.Model.UserModel;

@ControllerAdvice
public class GlobalController {
	
	@Autowired
	private HttpSession session;
	
	@Autowired
	private UserDAO userDAO;
	
	private UserModel userModel = null;
	
	
	@ModelAttribute("userModel")
	public UserModel getUserModel() {
		
		if(session.getAttribute("userModel")==null) {
			
			Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
			
			User user = userDAO.getByEmail(authentication.getName());
			  
			if(user!=null) {
				
			
				 
				userModel = new UserModel();
			    userModel.setId(user.getMobile());
				userModel.setEmail(user.getEmail_add());
				userModel.setRole(user.getRole());
				userModel.setFullName(user.getFirstname() + " " + user.getLastname());
				
				if(userModel.getRole().equals("USER")) {
					userModel.setCart(user.getCart());
					userModel.setCartLineCount(userDAO.cartlineCount(user.getCart().getId()));
					
				}
				
				session.setAttribute("userModel", userModel);
				
				return userModel;
				
				
			}
			
		}
		
		
		return (UserModel) session.getAttribute("userModel");
		
	}
	
	
	
}