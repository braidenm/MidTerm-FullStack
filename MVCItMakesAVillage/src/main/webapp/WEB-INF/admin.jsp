<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Volunteer Site - Admin</title>
</head>
<body>
	<header>
		<%@include file="navBar.jsp"%>
		<br>
		<br>
		<br>
		<br>
	</header>
	<div class="container">
		<div class="row">
			<div class="col-sm-6">
				<h4>Find Project</h4>
				<form action="adminFindProject.do" method="GET">
					<div class="form-group">
						<label id="keyword">Find Project</label> <input type="text"
							id="keyword" name="keyword" placeholder="keyword"></input>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Find Project" />
					</div>
				</form>
				<c:if test="${not empty projectList }">
					<c:forEach var="project" items="${projectList}">
						<div class="projects">
							ID: ${project.id } <br> 
							Project: ${project.title } <br>
							Start Date: ${project.startDate } <br> 
							Start Time: ${project.time } <br> 
							Owner: ${project.owner } <br>
							Volunteers Needed: ${project.volunteersNeeded } <br> 
							Hours Needed: ${project.hoursNeeded }
							<form action="editProject.do" method="GET">
								<div class="form-group">
									<input name="projectId" value="${project.id}" type="hidden">
								</div>
								<div class="form-group">
									<input type="submit" class="btn btn-primary"
										value="Edit Project" />
								</div>
							</form>
						</div>
					</c:forEach>
				</c:if>
				<c:if test="${projectNotFound}">
					<div class="notFoundMessage">Project Not Found</div>
				</c:if>

			</div>
			<div class="col-sm-6">
				<h4>Find User</h4>
				<form action="adminFindUser.do" method="GET">
					<div class="form-group">
						<label id="username">Find User:</label> <input type="text"
							id="keyword" name="keyword" placeholder="keyword"></input>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary"
							value="Find User" />
					</div>
				</form>
				<c:if test="${not empty userList }">
					<c:forEach var="user" items="${userList }">
						<div class="users">
							ID: ${user.id } <br> 
							Username: ${user.userName} <br> 
							Name: ${user.volunteer.firstName} ${user.volunteer.lastName}<br>
							Email: ${user.email} <br> 
							Role: ${user.role } <br>
							<form action="adminEditProfile.do" method="GET">
								<div class="form-group">
									<input name="id" value="${user.id}" type="hidden">
								</div>
								<div class="form-group">
									<input type="submit" class="btn btn-primary"
										value="Edit Profile" />
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