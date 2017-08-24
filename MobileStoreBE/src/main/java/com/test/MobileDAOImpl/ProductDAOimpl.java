package com.test.MobileDAOImpl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.test.MobileDAO.ProductDAO;
import com.test.MobileDTO.Product;
import com.test.MobileDTO.ProductDescp;

@Repository("productDAO")
@Transactional
public class ProductDAOimpl  implements ProductDAO{

	@Autowired
	private SessionFactory sessionFactory;
	
	//sheshagiri sir - 9940146501
	
	
	
	@Override
	public boolean addProduct(Product product) {
		try {

			Session session = sessionFactory.openSession();
			session.save(product);
			session.flush();
            session.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}

	}

	@Override
	public List<Product> listProduct() {
		try {

			Session session = sessionFactory.openSession();
			Query query1 = session.createQuery("from Product");

			@SuppressWarnings("unchecked")
			List<Product> productlist = query1.list();
			session.close();
			return productlist;
		} catch (Exception e) {
			return null;
		}

	}

	
	@Override
	public boolean addPdescription(ProductDescp productDesc) {
		try {
			sessionFactory.getCurrentSession().persist(productDesc);
			//Session session = sessionFactory.openSession();
			//session.save(productDesc);
		   //	System.out.println(productDesc.getBackCamera());
          //  session.close();
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public ProductDescp viewproduct(String productId) {
		
		try {
			Session session = sessionFactory.openSession();
			ProductDescp p = (ProductDescp) session.get(ProductDescp.class, productId);
			
			session.close();
			return p ;

		} catch (Exception e) {
			return null;
		}
	}

	@Override
	public Product get(int productId) {
		
		try {			
			return (Product) sessionFactory
					.getCurrentSession()
						.get(Product.class,Integer.valueOf(productId));			
		}
		catch(Exception ex) {		
			ex.printStackTrace();			
		}
		return null;
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<String> getAllName() {
		try {
			
			Session session = sessionFactory.openSession();
			Query query1 = session.createQuery(" select productName from Product");

			List<String> plist = query1.list();
			session.close();
			return plist;
		    
		}catch (Exception e) {
		   return null ;
		}
	}

	@SuppressWarnings("unchecked")
	@Override
	public List<Product> getByName(String name) {
	
		
		/*	String st = "SELECT * FROM Product WHERE productName = :name";
		try{
		Session session = sessionFactory.openSession();
		Query query1 = session.createSQLQuery(st);
		query1.setParameter("name", name);
		List<Product> plist = query1.list();
		session.close();
		return plist;
		} 
		catch(Exception e){
			return  null ;
		}
		*/
		try {
            String nam=  name.trim();
			Session session = sessionFactory.openSession();
			Query query1 = session.createQuery("from Product");
			List<Product> productlist = query1.list();
			List<Product> product = new ArrayList<>();
			session.close();
			for( Product p : productlist){
			
				if(nam.contains(p.getProductName())){
				 
					product.add(p);
				}
				
			}
	
			return product;
		} catch (Exception e) {
			return null;
		}
		
		
		
	}

}
