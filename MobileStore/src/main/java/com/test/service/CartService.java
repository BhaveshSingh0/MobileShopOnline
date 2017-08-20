package com.test.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.MobileDAO.CartLineDAO;
import com.test.MobileDAO.ProductDAO;
import com.test.MobileDTO.Cart;
import com.test.MobileDTO.CartLine;
import com.test.MobileDTO.Product;
import com.test.Model.UserModel;



@Service("cartService")
public class CartService {

	@Autowired
	private CartLineDAO cartLineDAO;
	
	@Autowired
	private ProductDAO productDAO;

	
	
	@Autowired
	private HttpSession session;
	private Cart getCart() {
		
	return ((UserModel)session.getAttribute("userModel")).getCart();
		
	}
	
	
	
	
	
	
	public String deleteCartLine(int cartLineId) {

	
		CartLine cartLine = cartLineDAO.get(cartLineId);
		
		if(cartLine == null) {
			return "result=error";
		}
		else {
			// update the cart
			Cart cart = this.getCart();
			cart.setGrandTotal(cart.getGrandTotal() - cartLine.getTotal());
			cart.setCartLines(cart.getCartLines() - 1);
			cartLineDAO.updateCart(cart);
	
			cartLineDAO.delete(cartLine);
			
			return "result=deleted";			
		}
	}
	
	
public String addCartLine(int productId) {
		
		String response = null;
		Cart cart = this.getCart();
		CartLine cartLine = cartLineDAO.getByCartAndProduct(cart.getId(), productId);
		
		if(cartLine == null) {
			// add a new cartLine
			cartLine = new CartLine();
			
			// fetch the product
			Product product = productDAO.get(productId);
			
			cartLine.setCartId(cart.getId());
			cartLine.setProduct(product);
			cartLine.setBuyingPrice(product.getPrice());
			cartLine.setProductCount(1);
			cartLine.setTotal(product.getPrice());
			cartLine.setAvailable(true);
			
			cartLineDAO.add(cartLine);
			
			cart.setCartLines(cart.getCartLines() + 1);
			cart.setGrandTotal(cart.getGrandTotal() + cartLine.getTotal());
			cartLineDAO.updateCart(cart);
			response = "result=added";
			
			
		}
		return response;
			
		}
	
		
	
	
	
	// returns the entire cart lines
	public List<CartLine> getCartLines() {
		
		if(this.getCart() == null ){
			return  null ;
		}
		else{
	           return cartLineDAO.list(this.getCart().getId());	
		
		}
	}

	
	public String updateCartLine(int cartLineId, int count) {

		// fetch the cart line
		CartLine cartLine = cartLineDAO.get(cartLineId);
		
		if(cartLine == null) {
			return "result=error";
		}
		else {
			
			Product product = cartLine.getProduct();
			double oldTotal = cartLine.getTotal();
			if(product.getProductCount() <= count) {
				count = product.getProductCount();
			}
			cartLine.setProductCount(count);
			cartLine.setBuyingPrice(product.getPrice());
			cartLine.setTotal(product.getPrice() * count);
			cartLineDAO.update(cartLine);
			Cart cart = this.getCart();
			cart.setGrandTotal(cart.getGrandTotal() - oldTotal + cartLine.getTotal());
			cartLineDAO.updateCart(cart);
			
			return "result=updated";
		}
	
	}
	
}