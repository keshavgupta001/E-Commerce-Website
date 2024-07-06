<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Register Page</title>
<%@include file="components/common.jsp" %>

</head>
<body>
<%@include file="components/navbar.jsp" %>
<div class="container-fluid">
	<div class="row mt-5">
	<div class="col-md-4 offset-md-4">
		<%@include file="components/message.jsp" %>
		<h3>Sign Up Here</h3>
		<form action="registerServlet" method="post">
			 <div class="form-group">
			    <label for="name">User Name</label>
			    <input type="text" name="user_name" class="form-control" id="name" placeholder="Enter here">
			  </div>
			 <div class="form-group">
			    <label for="email">Email</label>
			    <input type="email" name="user_email" class="form-control" id="email" placeholder="Enter Here">
  			</div>
  			<div class="form-group">
			    <label for="password">Password</label>
			    <input type="password" name="user_password" class="form-control" id="password" placeholder="Enter Here">
  			</div>
  			<div class="form-group">
			    <label for="phone">Phone No.</label>
			    <input type="number" name="user_phone" class="form-control" id="phone" placeholder="Enter Here">
  			</div>
  			<div class="form-group">
			    <label for="password">User Address</label>
				<textarea class="form-control" name="user_address" placeholder="Enter Here"></textarea>
  			</div>
  			<div class="container text-center">
  				<button class="btn btn-ooutline-success">Register</button>
  				<button class="btn btn-ooutline-warning">Reset</button>
  			</div>
		</form>
	</div>
</div>
</div>
</body>
</html>