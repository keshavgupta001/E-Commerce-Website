package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.Category;
import com.entities.Product;

public class productDao {
	private SessionFactory factory;
	public productDao(SessionFactory factory) {
		this.factory = factory;
	}
	public boolean saveProduct(Product product) {
		boolean result = false;
		try {
			Session session = this.factory.openSession();
			Transaction tx = session.beginTransaction();
			session.persist(product);
			tx.commit();
			session.close();
			result = true;
		}
		catch(Exception e) {
			e.printStackTrace();
			result=false;
		}
		return result;
	}
	//shows all products
	public List<Product> showProducts(){
		Session session = this.factory.openSession();
		Query<Product> query = session.createQuery("from Product", Product.class);
		List<Product> list = query.list();
		return list;
	}
	
	//show products according to cid\
	public List<Product> showProductsById(int cid){
		Session session = this.factory.openSession();
		Query<Product> query = session.createQuery("from Product as p where p.category.categoryId =: id", Product.class);
		query.setParameter("id", cid);
		List<Product> list = query.list();
		return list;
	}
	
	//show products by search 
	public List<Product> showProductsBySearch(String s) {
	    Session session = this.factory.openSession();
	    Query<Product> query = session.createQuery("from Product as p where p.pName like :searchTerm", Product.class);
	    query.setParameter("searchTerm", "%" + s + "%");
	    List<Product> list = query.list();
	    session.close();
	    return list;
	}

	
	
	
}
