package com.servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.dao.userDao;
import com.entities.User;
import com.helper.FactoryProvider;

public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
			PrintWriter out = response.getWriter();
			String email = request.getParameter("email");
			String password = request.getParameter("password");
			
			//authentication user
			userDao userdao = new userDao(FactoryProvider.getFactory());
			User user = userdao.getUserByEmailAndPassword(email, password);
//			System.out.println(user);
			HttpSession httpsession =  request.getSession();
			if(user == null) {
//				out.println("<h1> Invalid Details </h1>");
				httpsession.setAttribute("message", "Invalid Details");
				response.sendRedirect("login.jsp");
				return;
			}
			else {
				out.println("<h1> Welcome " +user.getUserName()+"</h1>");
				//login
				httpsession.setAttribute("current-user", user);
				if(user.getUserType().equals("admin")) {
					response.sendRedirect("admin.jsp");
				} else if(user.getUserType().equals("normal")) {
					response.sendRedirect("index.jsp");
				} else {
					out.println("we have not found the usertype");
				}
				
				
			}
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		
		
	}

}
