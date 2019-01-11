<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/css/bootstrap.min.css"
	integrity="sha384-GJzZqFGwb1QTTN6wy59ffF1BuGJpLSa9DkKMp0DgiMDm4iYMj70gZWKYbI706tWS"
	crossorigin="anonymous">
<meta charset="UTF-8">
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Create Project</title>
</head>
<body>
	<header>
		<h2>Create Project</h2>
	</header>
	<div class=container>
		<div class=row>
			<div class="col-sm-4">
				<form action="createProject.do" method="post">
					<div class="form-group">
						<label id="title">Title</label> <input type="text" required
							id="title" name="title"></input>
					</div>
					<div class="form-group">
						<label id="startDate">Start Date</label> <input type="date"
							id="startDate" required name="startDate"></input>
					</div>
					<div class="form-group">
						<label id="endDate">End Date</label> <input type="date"
							id="endDate" required name="endDate"></input>
					</div>
					<div class="form-group">
						<label id="time">Time</label> <input type="number" id="time"
							required name="time"></input>
					</div>
					<div class="form-group">
						<label id="volunteersNeeded">Volunteers Needed</label> <input
							type="number" id="volunteersNeeded" required
							name="volunteersNeeded"></input>
					</div>
					<div class="form-group">
						<label id="hoursNeeded">Hours Needed</label> <input type="text"
							id="hoursNeeded" name="hoursNeeded"></input>
					</div>
					<div class="form-group">
						<label id="description">Project Description</label>
						<textarea id="description" name="description" cols="35" rows="4"
							required placeholder="Tell us about your Project"></textarea>
					</div>
					<div class="form-group">
						<select
							class="mdb-select md-form colorful-select dropdown-primary"
							multiple searchable="Search here..">
							<option value="" disabled selected>Choose your country</option>
							<option value="1">USA</option>
							<option value="2">Germany</option>
							<option value="3">France</option>
							<option value="4">Poland</option>
							<option value="5">Japan</option>
						</select>

					</div>
					<div>
						<input type="hidden" value="${sessions.user.id}" id="ownerId"
							name="ownerId" />
					</div>
					<div>
						<input type="hidden" value="true" id="active" name="active" />
					</div>
					<div>
						<input type="hidden" value="true" id="active" name="active" />
					</div>
					<input type="submit" class="btn btn-secondary" value="Submit" />
				</form>
			</div>
		</div>
	</div>

	<!-- <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
		crossorigin="anonymous"></script> -->
</body>
</html>