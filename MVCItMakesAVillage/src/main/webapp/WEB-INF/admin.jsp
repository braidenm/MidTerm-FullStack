<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">

<title>Volunteer Site - Admin </title>
</head>
<body>
	<header> </header>
	<div class="container">
		<div class="row">
			<div class="col-sm-6" >
				<h4>Find Project</h4>
				<form action="adminFindProject.do" method="GET">
				<div class="form-group">
					<label id="keyword">Find Project</label> 
					<input type="text" id="keyword"
						   name="keyword" value="keyword"></input>
				</div>
				<div class="form-group">
				<input type="submit" class="btn btn-primary" value="Submit" />
				</div>
				</form>
				<c:if test="${not empty projectList }">
					<c:forEach var="project" items="${projectList}" >
						<div class="projects">
							ID: ${project.id }
							<br>
							Project: ${project.title }
							<br>
							Start Date: ${project.startDate }
							<br>
							Start Time: ${project.startTime }
							<br>
							Owner: ${project.owner }
							<br>
							Volunteers Needed: ${project.volunteersNeeded }
							<br>
							Hours Needed: ${project.hoursNeeded }
							<form action="editProject.do" method="GET">
								<div class="form-group">
								<input name="project" value="${project }" type="hidden">
								</div>
								<div class="form-group">
								<input type="submit" class="btn btn-primary" value="Edit Project" />
								</div>
							</form>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${notFound }">
					<div class="notFoundMessage">Project Not Found</div>
				</c:if>
				
			</div>
			<div class="col-sm-6">
				<h4>Find User</h4>
				<form action="adminFindUser.do" method="GET">
				<div class="form-group">
					<label id="username">Find User:</label> 
					<input type="text" id="keyword"
						   name="keyword" value="keyword"></input>
				</div>
				<div class="form-group">
				<input type="submit" class="btn btn-primary" value="Create Account" />
				</div>
				</form>
				<c:if test="${not empty userList }">
					<c:forEach var="user" items="${userList }">
						<div class="users">
							ID: ${user.id }
							<br>
							Username: ${user.userName}
							<br>
							Email: ${user.email}
							<br>
							Role: ${user.role }
							<br>
							<form action="editProfile.do" method="GET">
								<div class="form-group">
								<input name="user" value="${user }" type="hidden">
								</div>
								<div class="form-group">
								<input type="submit" class="btn btn-primary" value="Edit Profile" />
								</div>
							</form>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${notFound }">
					<div class="notFoundMessage">User Not Found</div>
				</c:if>
			</div>
		</div>
	</div>

	<!-- Optional JavaScript -->
	<!-- jQuery first, then Popper.js, then Bootstrap JS -->
	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js"
		integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js"
		integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy"
		crossorigin="anonymous"></script>
</body>
</html>