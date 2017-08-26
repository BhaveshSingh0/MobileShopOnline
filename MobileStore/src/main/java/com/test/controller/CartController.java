
package com.test.controller;

import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.test.MobileDAO.CartLineDAO;
import com.test.MobileDAO.UserDAO;
import com.test.MobileDTO.Address;

import com.test.MobileDTO.TransactionDetail;
import com.test.Model.UserModel;
import com.test.service.CartService;


@Controller
@RequestMapping("/cart")
public class CartController {

	@Autowired
	private HttpSession session;
	
	@Autowired
	private CartLineDAO cartLineDAO;
	
	@Autowired
	private CartService cartService;
	
	@Autowired
	private UserDAO userDAO;

	@RequestMapping("/show")
	public ModelAndView showCart(@RequestParam(name = "result", required=false)String result) {
		ModelAndView mv = new ModelAndView("Cart");
		if(result!=null) {
			
			switch(result) {
			
			case "updated":
					mv.addObject("message", "CartLine has been updated successfully!");
					break;
			case "error":
				mv.addObject("message", "Something went wrong!");
				break;	
				
			case "added":
				mv.addObject("message", "Product added");
				break;
				
			case "deleted":
				mv.addObject("message", "Product Deleted ");
				break;
		
			}
			
		}
		
		
		mv.addObject("title", "User Cart");
		mv.addObject("cartLines", cartService.getCartLines());		
		return mv;		
	}
	
	

	
	
	@RequestMapping("/{cartLineId}/update")
	public String updateCart(@PathVariable int cartLineId, @RequestParam int count) {		
		String response = cartService.updateCartLine(cartLineId, count);		
		return "redirect:/cart/show?"+response;
		
	}
	
	@RequestMapping("/billingAddress")
	public ModelAndView billing(){		
		ModelAndView mv =  new ModelAndView("bill");
		mv.addObject("cartLines", cartService.getCartLines());		
		return mv ;
		
	}
	
	@RequestMapping("/add/detail")
	public ModelAndView addDetail(@ModelAttribute("Address") Address address){		
	//	mv.addObject("cartLines", cartService.getCartLines());		
		String name = "";
		name = "P" + UUID.randomUUID().toString().substring(15).toUpperCase();
		UserModel  userModel=(UserModel)session.getAttribute("userModel");
		String message = "Your Order No - "+name+"  will be Delivered in 7 days "
				+ " \n Please keep "+userModel.getCart().getGrandTotal()+" \n Mobile no: "+userModel.getMobile()+" ";
		
		boolean  x =  userDAO.addAddress(address);
		if(x ==  true) {
			boolean b =  cartService.sendMail(message);
			if( b == true ){
				
				TransactionDetail d =  new TransactionDetail();
				d.setDate( new Date());
				d.setMobile(userModel.getMobile());
				d.setTotal(userModel.getCart().getGrandTotal());
				d.setTransaction_id(name);
				d.setUser_mail(userModel.getEmail());
				d.setName(userModel.getFullName());
				
				 boolean val = userDAO.addTransactionDetail(d);
				 if(val== true){
					  
				 cartLineDAO.deleteCartlines(userModel.getCart().getId());
				 cartService.clearCart();
						
				
						ModelAndView mv =  new ModelAndView("welcome");
						mv.addObject("message", "Please Check your Mail");
						return mv ;	
				 }
				 else{
						ModelAndView mv =  new ModelAndView("error");
						mv.addObject("message", "SomethingWent wrong in TransactionDetail ");
						return mv ;	
				 }
				
			}
			else{
				ModelAndView mv =  new ModelAndView("error");
				mv.addObject("message", "SomethingWent wrong  in Mailing");
				return mv ;
			}
			
		}
		else{
			ModelAndView mv =  new ModelAndView("error");
			mv.addObject("message", "SomethingWent wrong  in Address");
			return mv ;
		}
		
	}
	
	
	
	@RequestMapping("/{cartLineId}/delete")
	public String deleteCartLine(@PathVariable int cartLineId) {		
		String response = cartService.deleteCartLine(cartLineId);		
		return "redirect:/cart/show?"+response;
		
	}
	
	
	@RequestMapping("/add/{productId}/product")
	public String addCart(@PathVariable int productId) {		
		String response = cartService.addCartLine(productId);		
		return "redirect:/cart/show?"+response;
		
	}	
	

	
	
	
}
