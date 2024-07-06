package com.servlets;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.dao.categoryDao;
import com.dao.productDao;
import com.entities.Category;
import com.entities.Product;
import com.helper.FactoryProvider;

@MultipartConfig
public class productOperationServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public productOperationServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		//servlet has 2 works - add category and add product
		PrintWriter out = response.getWriter();
		try {
			String op = request.getParameter("operation");
			if(op.trim().equals("addCategory")) {
				//add category
				String title = request.getParameter("catTitle");
				String desc = request.getParameter("catDescription");
				Category category = new Category();
				category.setCategorytitle(title);
				category.setCategoryDescription(desc);
				categoryDao cdao=new categoryDao(FactoryProvider.getFactory());
				cdao.saveCategory(category);
				HttpSession httpsession = request.getSession();
				httpsession.setAttribute("message", "Category Added Successfully");
				response.sendRedirect("admin.jsp");
				return;
				
			}else if(op.trim().equals("addProduct")) {
				//add product
				String pName = request.getParameter("pName");
				String pDesc = request.getParameter("pDescription");
				int pPrice = Integer.parseInt(request.getParameter("pPrice"));
				int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
				int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
				int catId = Integer.parseInt(request.getParameter("catId"));
				Part part = request.getPart("pPic");
				Product p = new Product();
				p.setpName(pName);
				p.setpDesc(pDesc);
				p.setpPrice(pPrice);
				p.setpDiscount(pDiscount);
				p.setpQuantity(pQuantity);
				p.setpPhoto(part.getSubmittedFileName());
				
				
				categoryDao cDao = new categoryDao(FactoryProvider.getFactory());
				Category category = cDao.getCategoryById(catId);
				p.setCategory(category);
				
				productDao pdao = new productDao(FactoryProvider.getFactory());
				pdao.saveProduct(p);
				
				//upload the pic
				//find out the path to upload the photo
				
				String path = request.getRealPath("images")+File.separator+"productImages"+File.separator+part.getSubmittedFileName();
//				System.out.println(path); //this the actual path where the uploaded image will go
				try {
				//uploading the pic here
				FileOutputStream fos = new FileOutputStream(path);
				InputStream is = part.getInputStream();
				//reading data
				byte[] data = new byte[is.available()];
				is.read(data);
				//writing the data
				fos.write(data);
				fos.close();
				}catch(Exception e) {
					e.printStackTrace();
				}
				
				
				HttpSession httpsession = request.getSession();
				httpsession.setAttribute("message", "Product Added Successfully");
				response.sendRedirect("admin.jsp");
				return;
				
			}
			
			
			
			
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
	}

}
