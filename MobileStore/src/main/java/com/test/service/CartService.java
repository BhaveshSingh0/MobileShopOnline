package com.test.service;

import java.util.List;


import java.util.Date;
import java.util.Properties;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;
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
	
	
	//testing 
	
	public boolean clearCart(){
	 	Cart cart =  this.getCart();
		cart.setCartLines(0);
		cart.setGrandTotal(0);
		UserModel userModel = (UserModel)session.getAttribute("userModel");
		userModel.setCartLineCount(0);
		cartLineDAO.updateCart(cart);
     return true ;
	}
	
	public String deleteCartLine(int cartLineId) {

	
		CartLine cartLine = cartLineDAO.get(cartLineId);
		
		if(cartLine == null) {
			return "result=error";
		}
		else {
			
			//delete the cartline count by one after deleting
			//Model
			UserModel userModel = (UserModel)session.getAttribute("userModel");
	         userModel.setCartLineCount(userModel.getCartLineCount() - 1);
			
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
			
			
			// set the cartLine Count By 1 after adding to cartLine
		UserModel userModel = (UserModel)session.getAttribute("userModel");
         userModel.setCartLineCount(userModel.getCartLineCount() + 1);
			
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
	
	public boolean sendMail(String message1){
	UserModel  userModel=(UserModel)session.getAttribute("userModel");
		String fullname =  userModel.getFullName();
		String email = userModel.getEmail();
	   // 	Date d =  new Date();
	
		String host = "smtp.gmail.com";
        String port = "587";
        String mailFrom = "***************************";
        String password1 = "**************************";
        String mailTo = email;
        String subject = "Greeting";
        String message = "Thank you "+fullname+"  "+message1+" Hope We see you again ";
		 try {
		
        Properties properties = new Properties();
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", port);
        properties.put("mail.smtp.auth", "true");
        properties.put("mail.smtp.starttls.enable", "true");
        properties.put("mail.user", mailFrom);
        properties.put("mail.password", password1);
        Authenticator auth = new Authenticator() {
            public PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(mailFrom, password1);
            }
        };
        Session session1 = Session.getInstance(properties, auth);
         Message msg = new MimeMessage(session1);
        msg.setFrom(new InternetAddress(mailFrom));
        InternetAddress[] toAddresses = { new InternetAddress(mailTo) };
        msg.setRecipients(Message.RecipientType.TO, toAddresses);
        msg.setSubject(subject);
  
        msg.setSentDate(new Date());
        MimeBodyPart messageBodyPart = new MimeBodyPart();
        messageBodyPart.setContent(message, "text/html");
         Multipart multipart = new MimeMultipart();
        multipart.addBodyPart(messageBodyPart);
	 msg.setContent(multipart);
	Transport.send(msg);
        
                  
        
        
        }
                 
                 catch (Exception ex) {
           ex.printStackTrace();
           
           
         return  false ;
        }
                 
    
		
		return true;
	}
	
}