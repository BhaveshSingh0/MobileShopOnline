package com.test.MobileDAOImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.test.MobileDAO.CartLineDAO;
import com.test.MobileDTO.Cart;
import com.test.MobileDTO.CartLine;

@Repository("cartLineDAO")
public class CartLineDAOImpl implements CartLineDAO {

	  CartLine carline = null ;
	
	
	  
	  
	@Autowired
	private SessionFactory sessionFactory;

	@Override
    @Transactional
	public CartLine get(int id) {		
		return (CartLine) sessionFactory.getCurrentSession().get(CartLine.class, id);
	}
	
	@Override
    @Transactional
	public boolean add(CartLine cartLine) {
		try {
			sessionFactory.getCurrentSession().persist(cartLine);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@Override 
    @Transactional
	public boolean update(CartLine cartLine) {
		try {
			sessionFactory.getCurrentSession().update(cartLine);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;
		}
	}

	@Override
    @Transactional
	public boolean delete(CartLine cartLine) {	
		try {			
			sessionFactory.getCurrentSession().delete(cartLine);
			return true;
		}catch(Exception ex) {
			return false;
		}		
	}


	@SuppressWarnings("unchecked")
	@Override
    @Transactional
	public List<CartLine> list(int cartId) {
		
		try {
		String query = "FROM CartLine WHERE cartId = :cartId";
		return sessionFactory.getCurrentSession()
								.createQuery(query)
									.setParameter("cartId", cartId)
										.list();	
		
		}
		
		catch(Exception e ){
			e.getMessage();
			return null;
		}
	}	

	@SuppressWarnings("unchecked")
	@Override
	@Transactional
	public List<CartLine> listAvailable(int cartId) {
		String query = "FROM CartLine WHERE cartId = :cartId AND available = :available";
		return sessionFactory.getCurrentSession()
								.createQuery(query)
									.setParameter("cartId", cartId)
									.setParameter("available", true)
									.list();	
	}

	@Override
	@Transactional
	public CartLine getByCartAndProduct(int cartId, int productId) {
		String query = "FROM CartLine WHERE cartId = :cartId AND  product.id = :productId";
		try {
			
			
			Query  q = sessionFactory.getCurrentSession().createQuery(query).setParameter("cartId", cartId)
					.setParameter("productId", productId);
			
		         return (CartLine)q.uniqueResult();
			}
		catch(Exception ex) {
			return null;
		}
	}

	// related to the cart
	@Override
	@Transactional
	public boolean updateCart(Cart cart) {
		try {
			
			sessionFactory.getCurrentSession().update(cart);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;	
		}
	}

	@Override
	@Transactional
	public boolean deleteCartlines(int cartId) {
		
		
		String query1 = " Delete from CartLine where cartId= :uid ";
		Session session= sessionFactory.getCurrentSession();
		
		try{
		Query query = session.createQuery(query1);
	//	query.set("uid", cartId);
		query.setParameter("uid", cartId);
	    query.executeUpdate();
	  //  session.flush();

	}
	catch(Exception e){
	  e.printStackTrace();	
	}
	finally{
		 session.close();

	}
		return false;
	}

		
}