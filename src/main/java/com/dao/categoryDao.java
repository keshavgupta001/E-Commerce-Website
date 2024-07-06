package com.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.query.Query;

import com.entities.Category;

public class categoryDao {
private SessionFactory factory;

public categoryDao(SessionFactory factory) {
	super();
	this.factory = factory;
}
public int saveCategory(Category cat){
	Session session = this.factory.openSession();
	Transaction tx = session.beginTransaction();
	session.persist(cat);
	int catId = cat.getCategoryId();
	tx.commit();
	session.close();
	return catId;
}
public List<Category> getCategory(){
	Session s = this.factory.openSession();
	Query<Category> query = s.createQuery("from Category", Category.class);
	List<Category> list = query.list();
	return list;
}
public Category getCategoryById(int cid) {
	Category cat = null;
	try {
		Session s = this.factory.openSession();
		cat = s.get(Category.class, cid);
		s.close();
	}catch (Exception e) {
		e.printStackTrace();
	}
	return cat;
}

}
