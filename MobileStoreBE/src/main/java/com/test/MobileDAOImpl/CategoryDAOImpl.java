package com.test.MobileDAOImpl;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import com.test.MobileDAO.CategoryDAO;
import com.test.MobileDTO.Category;

@Repository("categoryDAO")
public class CategoryDAOImpl implements CategoryDAO {
	
	@Autowired
	private SessionFactory sessionFactory;

	
	@Override
	public Category get(int id) {

		try {

			Session session = sessionFactory.openSession();
			Query query1 = session.createQuery("from Category");

			@SuppressWarnings("unchecked")
			List<Category> productlist = query1.list();
			
			
			session.close();
			for (Category category : productlist) {
				if (category.getId() == id) {
					return category;
				}
			}
			return null;

		} catch (Exception e) {
			return null;
		}

	}

	@Override
	@Transactional
	public boolean add(Category category) {
	

		try {

			Session session = sessionFactory.openSession();
			session.save(category);
			session.flush();
            session.close();
            
            return true;
		} catch (Exception e) {

			e.printStackTrace();
			return false;
		}

	}
	
	@SuppressWarnings("unchecked")
	@Override
	public List<Category> listCat() {

		try {

			
			Session session = sessionFactory.openSession();
			Query query1 = session.createQuery("from Category");

		
			List<Category> productlist = query1.list();
			session.close();
			return productlist;
		} catch (Exception e) {
			return null;
		}

	}

	
	@Override
	public boolean deleteCategory(int id) {
		
		try {
			Session session = sessionFactory.openSession();
			Category p = (Category) session.get(Category.class, id);
			if (p != null)
				session.delete(p);
			session.flush();
			session.close();
			return true;

		} catch (Exception e) {
			return false;
		}

	}

	

}
