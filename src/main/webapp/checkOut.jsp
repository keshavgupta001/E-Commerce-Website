<%@page import="com.entities.User" %>
 	<%@page import="com.entities.Category" %>
 	<%@page import="com.dao.categoryDao" %>
 	<%@page import="com.helper.FactoryProvider" %>
 	<%@page import="java.util.*" %>
<%
	User user = (User)session.getAttribute("current-user");
	if(user==null){
		session.setAttribute("message", "You are not logged in. Login to place order!");
		response.sendRedirect("login.jsp");
		return;
	}
	


%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>CheckOut</title>
<%@include file="components/common.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>

<div class="container">
	<div class="row mt-3">
		<div class="col-md-6">
			<!-- Card -->
			<div class="card">
				<div class="card-body">
					<h4 class="mb-3">Your Selected Items</h4>
					<div class="cart-body"></div>
				</div>
			</div>
		</div>
		<div class="col-md-6">
			<div class="card">
				<div class="card-body">
					<h4 class="mb-3">Your Details for Order</h4>
					<form action="#">
					<div class="form-group">
					    <label for="emai">Email address</label>
					    <input type="email" value="<%= user.getUserEmail() %>" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
					    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
					</div>
					<div class="form-group">
					<label for="exampleInputName">Your Name</label>
					    <input type="email" value="<%= user.getUserName() %>" class="form-control" id="exampleInputName" aria-describedby="emailHelp" placeholder="Enter Name">
					</div>
					<div class="form-group">
					<label for="exampleInputPhone">Contact Number</label>
					    <input type="email" value="<%= user.getUserPhone() %>" class="form-control" id="exampleInputPhone" aria-describedby="emailHelp" placeholder="Enter Contact No.">
					</div>
					 <div class="form-group">
					    <label for="exampleFormControlTextarea1">Your Shipping Address</label>
					    <textarea class="form-control" value="<%= user.getUserAddress() %>" id="exampleFormControlTextarea1" placeholder="Enter youraddress" rows="3"></textarea>
					  </div>
					  
					<div class="container">
						<button class="btn btn-outline-success">Order Now</button>
						<button class="btn btn-outline-primary">Continue Shopping</button>
					</div>
					</form>
				</div>
			</div>
		</div>
	</div>
</div>


<%@include file="components/common_modals.jsp" %>
</body>
</html>