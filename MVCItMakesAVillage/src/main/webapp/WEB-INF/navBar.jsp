<nav class="navbar navbar-inverse navbar-fixed-top">
	  <div class="container-fluid">
		  <div class="navbar-header">
	      <a class="navbar-brand" href="home.do">ItMakesAVillage</a>
	  	  </div>
	  	  <ul class="nav navbar-nav navbar-left">
		      <c:if test="${not empty user && user.role == 'admin'}">
		      	<li><a href="admin.do">Admin page</a></li>
		      </c:if>
		      <c:if test="${not empty user}" >
			      <li><a href="account.do"><span class="glyphicon glyphicon-user"></span> Account</a></li>
			  </c:if>
			  <li><a href="about.do"> About</a></li>
	  	  </ul>
	  
		  <ul class="nav navbar-nav navbar-right">
		      <c:if test="${empty user}">
		     	  <li > <a href="login.do"><span class="glyphicon glyphicon-log-in"></span> Login/Register</a></li>
		     	  <br>
		      </c:if>
		      <c:if test="${not empty user}" >
			      <li class="navbar-right"><a href="logout.do"><span class="glyphicon glyphicon-log-in"></span> Logout</a></li>
			      <br>
			      <li>
			      </li>
		      </c:if>
	   	 </ul>
	  </div>
</nav>

