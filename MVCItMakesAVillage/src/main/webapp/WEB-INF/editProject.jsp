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
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<title>Edit Project</title>
</head>
<body>
	<%@include file="navBar.jsp"%>
	<br>
	<br>
	<br>
	<header>
		<h2>Edit Project</h2>
	</header>
	<div class=container>
		<div class=row>
			<div class="col-sm-4">
				<form action="editProject.do" method="post">
					<div class="form-group">
						<label id="title">Title</label> <input type="text" id="title"
							name="title" required value="${project.title }"></input>
					</div>
					<div class="form-group">
						<label id="sDate">Start Date</label> <input type="date" id="sDate"
							required name="sDate" value="${project.startDate}"></input>
					</div>
					<div class="form-group">
						<label id="eDate">End Date</label> <input type="date" id="eDate"
							required name="eDate" value="${project.endDate}"></input>
					</div>
					<div class="form-group">
						<label id="sTime">Time</label> <input type="text" id="sTime"
							name="sTime" required value="${project.time}"></input>
					</div>
					<div class="form-group">
						<label id="volunteersNeeded">Volunteers Needed</label> <input
							type="number" required id="volunteersNeeded"
							name="volunteersNeeded" value="${project.volunteersNeeded}"></input>
					</div>
					<div class="form-group">
						<label id="hoursNeeded">Hours Needed</label> <input type="number"
							id="hoursNeeded" required name="hoursNeeded"
							value="${project.hoursNeeded}"></input>
					</div>
					<div class="form-group">
						<label id="description">Project Description</label> <br>
						<textarea id="description" required name="description" cols="35"
							rows="4">${project.description}</textarea>
					</div>
					<div class="form-group">
						<!-- Street 1 -->
						<label for="street1_id" class="control-label">Street
							Address </label> <input type="text" class="form-control" id="street1_id"
							name="street" value="${ project.address.street}">
					</div>
					<div class="form-group">
						<!-- City-->
						<label for="city_id" class="control-label">City</label> <input
							type="text" class="form-control" id="city_id" name="city"
							value="${ project.address.city}">
					</div>

					<div class="form-group">
						<!-- State Button -->
						<label for="state_id" class="control-label">State</label> <select
							class="form-control" id="state_id" name="state" value="${ project.address.state}">
							<option value="AL">Alabama</option>
							<option value="AK">Alaska</option>
							<option value="AZ">Arizona</option>
							<option value="AR">Arkansas</option>
							<option value="CA">California</option>
							<option value="CO">Colorado</option>
							<option value="CT">Connecticut</option>
							<option value="DE">Delaware</option>
							<option value="DC">District Of Columbia</option>
							<option value="FL">Florida</option>
							<option value="GA">Georgia</option>
							<option value="HI">Hawaii</option>
							<option value="ID">Idaho</option>
							<option value="IL">Illinois</option>
							<option value="IN">Indiana</option>
							<option value="IA">Iowa</option>
							<option value="KS">Kansas</option>
							<option value="KY">Kentucky</option>
							<option value="LA">Louisiana</option>
							<option value="ME">Maine</option>
							<option value="MD">Maryland</option>
							<option value="MA">Massachusetts</option>
							<option value="MI">Michigan</option>
							<option value="MN">Minnesota</option>
							<option value="MS">Mississippi</option>
							<option value="MO">Missouri</option>
							<option value="MT">Montana</option>
							<option value="NE">Nebraska</option>
							<option value="NV">Nevada</option>
							<option value="NH">New Hampshire</option>
							<option value="NJ">New Jersey</option>
							<option value="NM">New Mexico</option>
							<option value="NY">New York</option>
							<option value="NC">North Carolina</option>
							<option value="ND">North Dakota</option>
							<option value="OH">Ohio</option>
							<option value="OK">Oklahoma</option>
							<option value="OR">Oregon</option>
							<option value="PA">Pennsylvania</option>
							<option value="RI">Rhode Island</option>
							<option value="SC">South Carolina</option>
							<option value="SD">South Dakota</option>
							<option value="TN">Tennessee</option>
							<option value="TX">Texas</option>
							<option value="UT">Utah</option>
							<option value="VT">Vermont</option>
							<option value="VA">Virginia</option>
							<option value="WA">Washington</option>
							<option value="WV">West Virginia</option>
							<option value="WI">Wisconsin</option>
							<option value="WY">Wyoming</option>
						</select>
					</div>

					<div class="form-group">
						<!-- Zip Code-->
						<label for="zip_id" class="control-label">Zip Code</label> <input
							type="number" class="form-control" id="zip_id" name="zip"
							value="${ project.address.zip}">
					</div>

					<h4>Edit Categories</h4>
					<div class="form-group">
						<c:forEach items="${pCatList}" var="cat">
							${cat.name }: 
							<input value="${cat.id }" type="checkbox" name="cat" id="cat"
								checked>
							<br>
						</c:forEach>
						<c:forEach items="${rCatList}" var="cat">
							${cat.name }: 
							<input value="${cat.id }" type="checkbox" name="cat" id="cat">
							<br>
						</c:forEach>


					</div>
					<%-- <div>
						<input type="hidden" value="${sessions.user.id}" id="ownerId"
							name="ownerId" />
					</div> --%>
					<div>
						<input type="hidden" value="true" id="active" name="active" />
					</div>
					<div>
						<input type="hidden" value="${project.id }" id="projectId" name="id" />
					</div>
					<input type="submit" class="btn btn-secondary" value="Submit" />
				</form>
			</div>
		</div>
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