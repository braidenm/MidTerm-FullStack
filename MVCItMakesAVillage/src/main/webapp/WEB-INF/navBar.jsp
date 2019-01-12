<nav class="navbar navbar-inverse navbar-fixed-top">
	  <div class="container-fluid">
	  
	  
	      <a href="home.do">Home</a>
	      <br>
	      
	      <c:if test="${empty user}">
	      <a href="login.do">Login/Register</a>
	      </c:if>
	      <br>
	      
	      <c:if test="${not empty user}">
	      	<a href="account.do">Account</a>
	      	<br>
	      	<a href="logout.do">Logout</a>
	      </c:if>
	      <br>
	      <c:if test="${not empty user && user.role == 'admin'}">
	      	<a href="admin.do">Admin page</a>
	      </c:if>
	  </div>
</nav>