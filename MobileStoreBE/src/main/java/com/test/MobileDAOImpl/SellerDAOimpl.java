package com.test.MobileDAOImpl;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.test.MobileDAO.SellerDAO;
import com.test.MobileDTO.Seller;

@Repository("sellerDAO")
public class SellerDAOimpl  implements  SellerDAO{

	@Autowired
	private SessionFactory sessionFactory;

	
	@Override
	@Transactional
	public boolean addSeller(Seller seller) {

		try {

			Session session = sessionFactory.openSession();
			session.save(seller);
            session.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	@Override
	public List<Seller> listSeller() {
		try {

			Session session = sessionFactory.openSession();
			Query query1 = session.createQuery("from Seller");
			@SuppressWarnings("unchecked")
			List<Seller> sellerlist = query1.list();
			session.close();
			return sellerlist;
		} catch (Exception e) {
			return null;
		}
	}

	
	
}
