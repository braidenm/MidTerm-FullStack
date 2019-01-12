<nav class="navbar navbar-inverse navbar-fixed-top">
	  <div class="container-fluid">
		  <div class="navbar-header">
	      <a class="navbar-brand" href="home.do">WebSiteName</a>
	  	  </div>
	  
		  <ul class="nav navbar-nav">
		      <c:if test="${empty user}">
		     	  <li> <a href="login.do">Login/Register</a></li>
		      </c:if>
		      <c:if test="${not empty user}">
			      <li><a href="account.do">Account</a></li>
			      <li><a href="logout.do">Logout</a></li>
		      </c:if>
		      <c:if test="${not empty user && user.role == 'admin'}">
		      	<li><a href="admin.do">Admin page</a></li>
		      </c:if>
	   	 </ul>
	  </div>
</nav>

