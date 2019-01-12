<nav class="navbar navbar-inverse navbar-fixed-top">
	  <div class="container-fluid">
	  
	  
	      <a href="home.do">Home</a>
	      <c:if test="${empty user}">
	      <a href="login.do">Login/Register</a>
	      </c:if>
	      <c:if test="${not empty user}">
	      	<a href="account.do">Account</a>
	      	<a href="logout.do">Logout</a>
	      </c:if>
	      <c:if test="${not empty user && user.role == 'admin'}">
	      	<a href="admin.do">Admin page</a>
	      </c:if>
	  </div>
</nav>