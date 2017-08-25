package com.test.MobileDAOImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.test.MobileDAO.UserDAO;
import com.test.MobileDTO.Address;
import com.test.MobileDTO.TransactionDetail;
import com.test.MobileDTO.User;


@Repository("userDAO")
@Transactional
public class UserDAOimpl  implements UserDAO {
	
	@Autowired
	private SessionFactory sessionFactory;
	
	
	
	@Override
	public boolean addUser(User u) {
		try {

		
			 sessionFactory.getCurrentSession().persist(u);
			
			//session.flush();
           // session.close();
            
            return true;
		} catch (Exception e) {

			e.printStackTrace();
			return false;
		}

	}



	@Override
	public User getByEmail(String email) {
	//	String selectQuery = "FROM User WHERE email = :email";		
		try {
			
			Session session = sessionFactory.openSession();
			Query query1 = session.createQuery("from User");

			@SuppressWarnings("unchecked")
			List<User> list = query1.list();
			
			
			session.close();
			for (User user : list) {
				if (user.getEmail_add() ==  email ) {
				return user;
				}
			}
			return null;

		} catch (Exception e) {
			return null;
		}

	}



	@Override
	public boolean addAddress(Address address) {
try {
			
			sessionFactory.getCurrentSession().persist(address);
			return true;
		}
		catch(Exception ex) {
			ex.printStackTrace();
			return false;	
		}
	}



	@Override
	public int cartlineCount(int cartId) {
		try {
			String query = "FROM CartLine WHERE cartId = :cartId";
			Session session = sessionFactory.openSession();
	
			Query q =  session.createQuery(query);	
			q.setParameter("cartId", cartId);
		
			
			
			@SuppressWarnings("unchecked")
			List<User> list = q.list();
			int size =  list.size();
				
	       return size ;
			
		}
		
			catch(Exception e ){
				e.printStackTrace();
				return 0;
			}
	}



	@Override
	public boolean addTransactionDetail(TransactionDetail detail) {
		try {

			 sessionFactory.getCurrentSession().persist(detail);
		
           return true;
		} catch (Exception e) {

			e.printStackTrace();
			return false;
		}
	}

}
