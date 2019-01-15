<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"
	integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO"
	crossorigin="anonymous">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" type="text/css" href="index.css">
<link href="https://fonts.googleapis.com/css?family=Open+Sans+Condensed:300" rel="stylesheet">
<title>Home</title>
</head>
<body>

	<%@include file="navBar.jsp"%>


	<div class="bg-img">
		<div class="headerText">
			<h1>A Little Dirt Doesn't Hurt</h1>
		</div>
		<div class="row" id="centered">
			<div class="col-sm-5">
				<form action="searchKW.do" method="get" id="searchByKW"
					class="containerKW">
					<div class="KWHeader">
						<label for="keyword">Search by KeyWord(s): </label>
					</div>
					<br> <input type="text" name="keyword" id="keyword"
						placeholder="Search" maxlength="45" /> <input type="submit"
						value="Search" class="btn btn-primary" />
				</form>
			</div>
			<div class="col-sm-5">
				<form action="searchCat.do" method="get" id="searchByCat"
					class="containerCategory">
					<div class="CategoryHeader">
						<label for="keyword">Search by Category </label>
					</div>
					
					<c:forEach var="cat" items="${catList}">
						<strong>${cat.name}:</strong>
						<input id="keyword" name="keyword" type="checkbox"
							value="${cat.name}">
							<br>
					</c:forEach>
					
					 <br> <input type="submit" value="Search"
						class="btn btn-primary" />
				</form>
			</div> 
		</div>
	</div>
	<%-- <div class="container">
		<form form-check form-check-inline action="searchCat.do" method="get"
			id="searchByCat" class="containerCategory">
			<label class="categoryHeader" for="keyword">Search by
				Category </label>

			<c:forEach var="cat" items="${catList}">
					<strong>${cat.name}:</strong>
				<div class="form-check form-check-inline">
					<input class="form-check-input" id="inlineCheckbox1" name="keyword"
						type="checkbox" value="${cat.name}"> <label
						class="form-check-label" for="inlineCheckbox1">${cat.name}:</label>
				</div>
			</c:forEach>
			<input type="submit" value="Search" class="btn1 btn-primary" />
		</form>
	</div> --%>
	<br>
	<br>
	<br>
	<br>

	<div class="containerProject">
		<div class="row">
		<div class="col-sm-1"></div>
			<div class="col-sm-4">
				<c:if test="${not empty projectList }">
					<c:forEach var="project" items="${projectList}">
						<strong>Project name: </strong>${project.title}
		  				 <br>
						<%-- <strong>Owner Name: </strong>${project.owner.firstName} ${project.owner.lastName} 
		  				 <br>
						<strong>Address: </strong>${project.address }
		  				 <br> --%>
						<Strong>Location: </Strong>${project.address.city }, ${project.address.state}
		  				 <br>
						<strong>StartDate: </strong>${project.startDate}
		  				 <br>
						<%-- <strong>EndDate: </strong>${project.endDate}
		  				 <br>
						<strong>Time: </strong>${project.time}
		  				 <br> --%>
						<c:if
							test="${(project.volunteersNeeded - fn:length(project.volunteers)) <= 0}">
							<strong>Volunteer:</strong>
		  					Volunteer Goal Met
		  				</c:if>
		  				<c:if test="${project.active }">
							<strong>Project is:</strong><h6 class="open">OPEN</h6>
						</c:if>
						<c:if test="${not project.active }">
							<strong>Project is:</strong><h6 class="closed">CLOSED</h6>
						</c:if>
						<c:if
							test="${(project.volunteersNeeded - fn:length(project.volunteers)) > 0}">
							<strong>Volunteers still needed: </strong>
		  					${project.volunteersNeeded - fn:length(project.volunteers) }
		  				</c:if>

						<div class="bottomButton">
							<form action="viewProject.do" method="get">
								<input type="hidden" value="${project.id }" name="projectId">
								<input type="submit" class="btn btn-primary"
									value="View Project">

							</form>

						</div>
						<br>
					</c:forEach>
				</c:if>
				<br>
				<c:if test="${notFound }">
					<div class="notFoundMessage">No Projects Found</div>
				</c:if>
				<c:if test="${needCategory }">
					<div class="needCategoryMessage">Please pick a category</div>
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