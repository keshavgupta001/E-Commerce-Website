package com.dao;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;

import com.entities.User;

public class userDao {
    private SessionFactory factory;

    public userDao(SessionFactory factory) {
        super();
        this.factory = factory;
    }

    // Get user by email and password
    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        try {
            String hql = "from User where userEmail = :e and userPassword = :p";
            Session session = this.factory.openSession();
            Query<User> query = session.createQuery(hql, User.class);
            query.setParameter("e", email);
            query.setParameter("p", password);
            user =(User) query.uniqueResult();
            session.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }
}
