 	<%@page import="com.entities.User" %>
 	<%@page import="com.entities.Category" %>
 	<%@page import="com.dao.categoryDao" %>
 	<%@page import="com.helper.FactoryProvider" %>
 	<%@page import="java.util.*" %>
<%
	User user = (User)session.getAttribute("current-user");
	if(user==null){
		session.setAttribute("message", "You are not logged in");
		response.sendRedirect("login.jsp");
		return;
	}
	else{
		if(user.getUserType().equals("normal")){
			session.setAttribute("message", "You are not admin");
			response.sendRedirect("login.jsp");
			return;
		}
	}


%>




<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Page</title>
<%@include file="components/common.jsp" %>
</head>
<body>
<%@include file="components/navbar.jsp" %>
<div class="container admin">
	<div class="container-fluid mt-3">
		<%@include file="components/message.jsp" %>
	</div>
	<div class="row mt-3">
	<!-- first card -->
		<div class="col-md-4">
			<div class="card">
				<div class="card-body text-center">
					<div class="container">
						<img src="images/team.png" style="max-width: 100px" class="rounded-circle img-fluid">
					</div>
					<h1 class="mt-2">869</h1>
					<h1>Users</h1>
				</div>
			</div>
		</div>
		<!-- second card -->
		<div class="col-md-4">
			<div class="card">
				<div class="card-body text-center">
						<div class="container">
							<img src="images/options.png" style="max-width: 100px" class="rounded-circle img-fluid">
						</div>
						<h1 class="mt-2">269</h1>
						<h1>Categories</h1>
				</div>
			</div>
		</div>
		<!--  third card -->
		<div class="col-md-4">
			<div class="card">
				<div class="card-body text-center">
					<div class="container">
						<img src="images/new-product.png" style="max-width: 100px" class="rounded-circle img-fluid">
					</div>
					<h1 class="mt-2">8769</h1>
					<h1>Products</h1>
				</div>
			</div>
		</div>
	</div>
	<div class="row mt-3">
	<!--  second row first column -->
		<div class="col md-6">
			<div class="card" data-toggle="modal" data-target="#addCategoryModal">
				<div class="card-body text-center">
					<div class="container">
						<img src="images/new-product.png" style="max-width: 100px" class="rounded-circle img-fluid">
					</div>
					<h1>Add Category</h1>
				</div>
			</div>
		</div>
		<!--  second row second column -->
		<div class="col md-6">
			<div class="card" data-toggle="modal" data-target="#addProductModal">
				<div class="card-body text-center">
					<div class="container">
						<img src="images/new-product.png" style="max-width: 100px" class="rounded-circle img-fluid">
					</div>
					<h1>Add Products</h1>
				</div>
			</div>
		</div>
	</div>
</div>
<!-- add category modal -->
<!-- Modal -->
<div class="modal fade" id="addCategoryModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Add Category</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      		<form action="productOperationServlet" method="post">
      		<input type="hidden" name="operation" value="addCategory">
      			<div class="form-group">
      				<input type="text" class="form-control" name="catTitle" placeholder="Enter Category Name" required>
      			</div>
      			<div class="form-group">
      				<textarea style="height:150px" class="form-control" name="catDescription" placeholder="Enter Category Description" required></textarea>
      			</div>
      			<div class="container text-center">
      				<button class="btn btn-outline-success">Add Category</button>
      				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      				
      			</div>
      		</form>
      </div>
      
    </div>
  </div>
</div>
<!-- end category modal -->

<!-- start product modal -->
<!-- Modal -->
<div class="modal fade" id="addProductModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header custom-bg text-white">
        <h5 class="modal-title" id="exampleModalLabel">Add Products</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
      		<form action="productOperationServlet" method="post" enctype="multipart/form-data">
      		<input type="hidden" name="operation" value="addProduct">
      			<!-- product name -->
      			<div class="form-group">
      				<input type="text" class="form-control" name="pName" placeholder="Enter Product Name" required>
      			</div>
      			<!-- Product Description -->
      			<div class="form-group">
      				<textarea style="height:40px" class="form-control" name="pDescription" placeholder="Enter Product Description" required></textarea>
      			</div>
      			<!-- product price -->
      			<div class="form-group">
      				<input type="number" class="form-control" name="pPrice" placeholder="Enter Product Price" required>
      			</div>
      			<!-- product discount -->
      			<div class="form-group">
      				<input type="number" class="form-control" name="pDiscount" placeholder="Enter Product Discount" required>
      			</div>
      			<!-- product Quantity -->
      			<div class="form-group">
      				<input type="number" class="form-control" name="pQuantity" placeholder="Enter Product Quantity" required>
      			</div>
      			<!--  Product Category -->
      			<%
      				categoryDao cdao = new categoryDao(FactoryProvider.getFactory());
      				List<Category> list = cdao.getCategory();
      			
      			%>
      			
      			
      			<div class="form-group">
      				<select name="catId" class="form-control" placeholder="Select Category">
      					<%
      						for(Category c:list){
      					%>
      					<option value="<%=c.getCategoryId() %>"><%=c.getCategorytitle() %></option>      						
      					<% } %>
      				</select>
      			</div>
      			<!-- product file -->
      			<div class="form-group">
      				<label for="pPic">Select Picture of Product </label>
      				<br>
      				<input type="file" id="pPic" name="pPic" required />
      			</div>
      			
      			
      			<div class="container text-center">
      				<button class="btn btn-outline-success">Add Product</button>
      				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
      				
      			</div>
      		</form>
      </div>
      
    </div>
  </div>
</div>

<!--  end product modal -->

</body>
</html>