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
<title>Create Project</title>
</head>
<body>
<%@include file="navBar.jsp"%>
<br>
<br>
<br>
<br>
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
						<label id="sDate">Start Date</label> <input type="date"
							id="sDate" required name="sDate"></input>
					</div>
					<div class="form-group">
						<label id="eDate">End Date</label> <input type="date"
							id="eDate" required name="eDate"></input>
					</div>
					<div class="form-group">
						<label id="sTime">Time</label> <input type="time" id="sTime"
							required name="sTime"></input>
					</div>
					<div class="form-group">
						<label id="volunteersNeeded">Volunteers Needed</label> <input
							type="number" id="volunteersNeeded" required
							name="volunteersNeeded"></input>
					</div>
					<div class="form-group">
						<label id="hoursNeeded">Hours Needed</label> <input type="number"
							id="hoursNeeded" name="hoursNeeded"></input>
					</div>
					<div class="form-group">
						<label id="description">Project Description</label>
						<br>
						<textarea id="description" name="description" cols="35" rows="4"
							required placeholder="Tell us about your Project"></textarea>
					</div>
					
					<h3>Choose Categories</h3>
					<div class="form-group">
						<c:forEach items="${catList}" var="cat">
							${cat.name }: 
							<input value="${cat.id }" type="checkbox" name="cat" id="cat">
							<br>
						</c:forEach>
				

					</div>
					<div>
						<input type="hidden" value="${user.id}" id="ownerId"
							name="ownerId" />
					</div>
					<div>
						<input type="hidden" value="true" id="active" name="active" />
					</div>
					
					<input type="submit" class="btn btn-primary" value="Submit" />
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