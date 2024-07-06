package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.User;
import com.helper.FactoryProvider;

public class registerServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public registerServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try {
			String username = request.getParameter("user_name");
			String useremail = request.getParameter("user_email");
			String userpassword = request.getParameter("user_password");
			String userphone = request.getParameter("user_phone");
			String useraddress = request.getParameter("user_address");
			
			PrintWriter out = response.getWriter();
			User user = new User(username, useremail, userpassword, userphone, "default.jpg", useraddress, "normal");
			Session s = FactoryProvider.getFactory().openSession();
			Transaction tx = s.beginTransaction();
			s.persist(user);
			int userid = user.getUserId();
			tx.commit();
			s.close();
			
			HttpSession httpsession =  request.getSession();
			httpsession.setAttribute("message", "Registration Successful !!");
			response.sendRedirect("register.jsp");
			return;
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
