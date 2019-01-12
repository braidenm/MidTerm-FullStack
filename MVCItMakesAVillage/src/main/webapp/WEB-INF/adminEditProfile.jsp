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

<title>Volunteer Site - Admin Edit Profile and User</title>
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
			<div class="col-sm-4">
				<h4>Edit Profile</h4>

				<form action="adminEditProfile.do" method="POST">
					<div class="form-group">
						<label id="userName">Username:</label> 
						<input type="text" id="userName" 
							   name="userName" required value="${user.userName }"></input>
					</div>
					<div class="form-group">
					<!-- 	<label id="password"></label>  -->
						<input type="hidden" id="password" 
							   name="password" required value="${user.password }"></input>
					</div>
					<div class="form-group">
						<label id="email">Email:</label> 
						<input type="text" id="email"
							   name="email" required value="${user.email }"></input>
					</div>
					<div class="form-group">
						<label id="role">Role:</label> 
						<input type="text" id="role"
							   name="role" required value="${user.role }"></input>
					</div>
					<div class="form-group">
						<label id="id">User Id:</label> 
						<input type="number" id="id"
							   readonly required
							   name="id" value="${user.id }"></input>
					</div>
					<div class="form-group">
				<!-- 		<label id="userid">User Id:</label>  -->
						<input type="number" id="userid"
							   hidden required
							   name="userid" value="${user.volunteer.userid }"></input>
					</div>
					<div class="form-group">
						<label id="firstName">First Name:</label> 
						<input type="text" id="firstName" 
							   required 
							   name="firstName"
							   value="${user.volunteer.firstName }"></input>
					</div>
					<div class="form-group">
						<label id="lastName">Last Name:</label> 
						<input type="text" id="lastName" 
							   required 
							   name="lastName"
							   value="${user.volunteer.lastName }"></input>
					</div>
					<div class="form-group">
						<label id="dob">Birth date:</label> 
						<input type="date" id="dob"
							   required 
							   name="dob" 
							   value="${user.volunteer.dob }"></input>
					</div>
					<div class="form-group">
						<label id="phone">Phone Number:</label> 
						<input type="text" id="phone" 
							   name="phone" 
							   value="${user.volunteer.phone }"></input>
					</div>
					<div class="form-group">
						<label id="about">About me:</label>
						<textarea id="about" maxlength="250" name="about"
								  cols="35" rows="3">${user.volunteer.about }</textarea>
					</div>
					<div class="form-group">
						<label id="pictureURL">Profile Image:</label> 
						<input type="text"
							   id="pictureURL" name="pictureURL"
							   value="${user.volunteer.pictureURL }"></input>
					</div>
					<div class="form-group">
						<input type="submit" class="btn btn-primary" value="Submit" />
					</div>
				</form>
			</div>
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