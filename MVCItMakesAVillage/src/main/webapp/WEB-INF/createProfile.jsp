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

<link rel="stylesheet" type="text/css" href="profile.css">
<title>Volunteer Site - Create Profile</title>
</head>
<body>
	<%@include file="navBar.jsp"%>
	<br>
	<br>
	<br>
	<header> </header>
	<div class="container">
		<div class="row">
			<div class="col-sm-4" >
			</div>
			<div class="col-sm-4" >
				<h4>Create Profile</h4>
				<br>
				<form action="createProfile.do" method="POST">
				<div class="form-group">
					ID: ${user.id }
					<input type="hidden" id="userid" name="userid"
						   value="${user.id }">
				</div>
				<div class="form-group">
					<label id="firstName">First Name:</label> 
					<input type="text" id="John"
						   required maxlength="45"
						   name="firstName" placeholder="First Name">
				</div>
				<div class="form-group">
					<label id="lastName">Last Name:</label> 
					<input type="text" id="Smith"
						   required  maxlength="45"
						   name="lastName" placeholder="Last Name">
				</div>
				<div class="form-group">
					<label id="dob">Birth date:</label> 
					<input type="date" id="dob"
						   required
						   name="dob"></input>
				</div>
				<div class="form-group">
					<label id="phone">Phone Number:</label> 
					<input type="text" id="phone"
						    maxlength="15" name="phone" placeholder="555-555-5555">
				</div>
				<div class="form-group">
					<label id="about">About me:</label> 
					<textarea id="about" maxlength="250" 
							  name="about" 
							  required 
							  placeholder="Tell us a little about yourself..." 
							  cols="35" rows="3"></textarea>
				</div>
				<div class="form-group">
					<label id="pictureURL">Profile Image:</label> 
					<input type="text" id="pictureURL"
						   name="pictureURL" placeholder="Please enter a valid image URL">
				</div>
				<div class="form-group">
				<input type="submit" class="btn btn-primary" value="Submit" />
				</div>
				</form>
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