<%@page import="com.entities.User" %>
<%
	User user1 = (User) session.getAttribute("current-user"); 

%>
<nav class="navbar navbar-expand-lg navbar-dark custom-bg">
  <a class="navbar-brand" href="index.jsp">LOGO</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
    <span class="navbar-toggler-icon"></span>
  </button>

  <div class="collapse navbar-collapse" id="navbarSupportedContent">
    <ul class="navbar-nav mr-auto">
      <li class="nav-item active">
        <a class="nav-link" href="index.jsp">Home <span class="sr-only">(current)</span></a>
      </li>
      
    </ul>
    <form class="search-form" action="searchServlet" method="post">
    	<input type="hidden" value="search">
    	<input type="text" placeholder="Search here" name="search">
		<button type="submit" class="search-submit">
		    <img src="images/search.png" class="search-img" alt="Search">
		</button>
		    	
    </form>
    <ul class="navbar-nav ml-auto">
    
     <li class="nav-item active">
        <a class="nav-link ml-2" href="#" data-toggle="modal" data-target="#cart">Cart <span class="cart-items">(0)</span></a>
      </li>
    
    
    	<%
    		if(user1==null){
    			%>
      <li class="nav-item active">
        <a class="nav-link" href="login.jsp">Login</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="register.jsp">Register</a>
      </li>
      
      <%
    		}
    		else{
    			%>
    			<li class="nav-item active">
        <a class="nav-link" href="<%= user1.getUserType().equals("admin")?"admin.jsp":"normal.jsp" %>"><%= user1.getUserName() %></a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="logoutservlet">LogOut</a>
      </li>
      
      <%
    		}
    	%>
    </ul>
  </div>
</nav>