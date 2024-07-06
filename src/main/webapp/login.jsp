<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login</title>
<%@include file="components/common.jsp" %>

</head>
<body>
<%@include file="components/navbar.jsp" %>
<div class="container">
	<div class="row">
		<div class="col-md-4 offset-md-4">
			<div class="card mt-3">
				<div class="card-header custom-bg text-white">
					<h3>Login Here</h3>
				</div>
				<div class="card-body">
				<%@include file="components/message.jsp" %>
					<form action="Login" method="post">
  <div class="form-group">
    <label for="exampleInputEmail1">Email address</label>
    <input type="email" name="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
  </div>
  <div class="form-group">
    <label for="exampleInputPassword1">Password</label>
    <input type="password" name="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
  </div>
  <a href="register.jsp">Don't have an account, click here!</a>
  <button type="submit" class="btn btn-primary custom-bg text-white">Submit</button>
</form>
				</div>
				<div class="card-footer"></div>
			</div>
		</div>
	</div>

</div>

</body>
</html>