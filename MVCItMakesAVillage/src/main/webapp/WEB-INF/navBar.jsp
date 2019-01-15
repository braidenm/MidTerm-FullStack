<nav class="navbar navbar-fixed-top">
	<div class="container-fluid" id="navBackground">
		<div class="navbar-header">
			<a class="navbar-brand" href="home.do">ItMakesAVillage</a>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<c:if test="${not empty user && user.role == 'admin'}">
				<li class="nav-item"><a class="nav-link" href="admin.do">Admin
						page</a></li>
			</c:if>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<c:if test="${user != null}">
				<li class="nav-item"><a class="nav-link" href="account.do"><span
						class="glyphicon glyphicon-user"></span> Account</a></li>
			</c:if>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<li class="nav-item"><a class="nav-link" href="about.do">
					About</a></li>
		</ul>

		<ul class="nav navbar-nav navbar-right">
			<c:if test="${empty user}">
				<li class="nav-item"><a href="login.do"><span
						class="glyphicon glyphicon-log-in"></span> Login/Register</a></li>

			</c:if>
		</ul>
		<ul class="nav navbar-nav navbar-right">
			<c:if test="${not empty user}">
				<li class="navbar-right"><a href="logout.do"><span
						class="glyphicon glyphicon-log-in"></span> Logout </a></li>
			</c:if>
		</ul>
	</div>
</nav>

