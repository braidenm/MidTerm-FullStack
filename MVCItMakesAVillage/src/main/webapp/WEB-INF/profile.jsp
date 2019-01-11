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
<title>Profile</title>
</head>
<body>
<p>
    <jsp:useBean id="today" class="java.util.Date" />
    <b><c:out value="${today}"/></b>
</p>
	<header>
		<h2>View Profile</h2>
	</header>
	<img src="${user.volunteer.pictureURL}" class="img-fluid"
		alt="Responsive image">
	<ul class="list-group">
		<li class="list-group-item">Name: ${user.volunteer.firstName}
			${user.volunteer.lastName}</li>
		<li class="list-group-item">DOB: ${user.volunteer.dob}</li>
		<li class="list-group-item">Phone ${user.volunteer.phone}</li>
		<li class="list-group-item">About ${user.volunteer.about}</li>
	</ul>
	<h3>Your Projects</h3>
	<div data-spy="scroll" data-target="#project-scrollbox" data-offset="0">
		<c:forEach items="${user.volunteer.projects}" var="project">
			<c:if test="${project.endDate gt today}">
				<ul class="list-group">
					<li class="list-group-item"><h3>${project.title}</h3>
						${project.startDate}
						<form action="viewProject.do" method="get">
							<input type="hidden" value="${project.id }" name="projectId">
							<input type="submit" class="btn btn-primary" value="View Project">

						</form></li>
				</ul>
			</c:if>
		</c:forEach>
	</div>



	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
		integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
		crossorigin="anonymous"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.6/umd/popper.min.js"
		integrity="sha384-wHAiFfRlMFy6i5SRaxvfOCifBUQy1xHdJ/yoi7FRNXMRBu5WHdZYu1hA6ZOblgut"
		crossorigin="anonymous"></script>
	<script
		src="https://stackpath.bootstrapcdn.com/bootstrap/4.2.1/js/bootstrap.min.js"
		integrity="sha384-B0UglyR+jN6CkvvICOB2joaf5I4l3gm9GU6Hc1og6Ls7i6U/mkkaduKaBhlAXv9k"
		crossorigin="anonymous"></script>
</body>
</html>