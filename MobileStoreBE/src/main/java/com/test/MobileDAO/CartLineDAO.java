package com.test.MobileDAO;

import java.util.List;

import com.test.MobileDTO.Cart;
import com.test.MobileDTO.CartLine;

public interface CartLineDAO {

	public CartLine get(int id);	
	public boolean add(CartLine cartLine);
	public boolean update(CartLine cartLine);
	public boolean delete(CartLine cartLine);
	public List<CartLine> list(int cartId);
	
	// other business method related to the cart lines
	public List<CartLine> listAvailable(int cartId);
	public CartLine getByCartAndProduct(int cartId, int productId);
	
	public  boolean deleteCartlines( int CartId);

	
	// udpate a cart
	boolean updateCart(Cart cart);	
}
