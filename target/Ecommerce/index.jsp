<%@page import="com.helper.FactoryProvider"%>
<%@page import="com.dao.productDao" %>
<%@page import="com.dao.categoryDao" %>
<%@page import="java.util.*" %>
<%@page import="com.entities.Product" %>
<%@page import="com.entities.Category" %>
<%@page import="com.helper.Helper" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>E-Commerce</title>
		<%@include file="components/common.jsp" %>
	</head>
	<body>
		<%@include file="components/navbar.jsp" %>
		<div class="row mt-3 mx-2">
		<%
			productDao pdao = new productDao(FactoryProvider.getFactory());
			List<Product> plist = pdao.showProducts();
			categoryDao cdao = new categoryDao(FactoryProvider.getFactory());
			List<Category> clist = cdao.getCategory();
		%>
			<!-- Show categories -->
			<div class="col-md-2">
				<div class="list-group mt-4">
				<a href="#" class="list-group-item list-group-item-action active">All Products</a>
				
			<%
					for(Category c: clist){
						%>
						 <a href="#" class="list-group-item list-group-item-action"><%= c.getCategorytitle() %></a>	
				<%
					}
				%>
				</div>
			</div>
			
			<!-- Show products -->
			<div class="col-md-10">
				<!--  row -->
				<div class="row mt-4">
					<div class="col-md-12">
						<div class="card-columns">
						<!-- traversing products -->
						<%
							for(Product p: plist){
						%>
							<div class="card">
							<div class="container text-center">
								<img src="images/productImages/<%= p.getpPhoto() %>" style="box-sizing: border-box; max-height:200px; max-width: 100%";">								
							</div>
								<div class="card-body">
									<h5><%= p.getpName() %></h5>
									<p class="card-text"> 
										<%= Helper.get10Words(p.getpDesc()) %>
									</p>
									
								</div>
								<div class="card-footer">
									<button class="btn btn-outline-primary">&#8377;<%= p.getpPrice() %></button>
									<button class="btn custom-bg text-white">Add to Cart</button>
								</div>
								
								
							</div>
						
						
						
						<%
							}
						%>
						
						</div>
					</div>
				</div>
				
				
			</div>
		</div>
	</body>
</html>