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
  
  
<title>View Project</title>
</head>
<body>
	<%@include file="navBar.jsp"%>
	  
	  <br>
	  <br>
	  <br>
	  <br>
	  
	  <div class="row">
		  <div class="col-sm-2">
		  </div>
		  <div class="col-sm-4">
		  			<c:if test="${project.active }"> 
		  					<h4>Project is Open</h4>
		  				</c:if>
		  				<c:if test="${not project.active }"> 
		  					<h4>Project is Closed</h4>
		  				</c:if>
		  			
		  				<strong>Project name: </strong>${project.title}
		  				 <br>
		  				<strong>Project Description: </strong>${project.description}
		  				 <br>
		  					<strong>Category: </strong> 
		  				 <c:forEach items="${project.categories}" var="cat">
		  				 	${cat}
		  				 	<br>
		  				 </c:forEach>
		  				<strong>Owner Name: </strong>${project.owner.firstName} ${project.owner.lastName} 
		  				 <br>
		  				 <strong>Address: </strong>${project.address }
		  				 <br>
		  				<strong>StartDate: </strong>${project.startDate}
		  				 <br>
		  				<strong>EndDate: </strong>${project.endDate}
		  				 <br>
		  				<strong>Time: </strong>${project.time}
		  				 <br>
		  				<c:if test="${(project.volunteersNeeded - fn:length(project.volunteers)) > 0}">
		  					<strong>Volunteers still needed: </strong>
		  					${project.volunteersNeeded - fn:length(project.volunteers) }
		  				</c:if>
		  				<c:if test="${(project.volunteersNeeded - fn:length(project.volunteers)) <= 0}">
		  					<strong>Volunteer:</strong>
		  					Volunteer Goal Met
		  				</c:if>
		  				<br>
			  			<form action="joinProject.do" method="post">
			  				<label for="hours">Add Volunteer: </label>
			  				<input type="hidden" name="userId" id="userId" value="${user.id}">
			  				<input type="hidden" name="project" id="project" value="${project}">
			  				<input type="number" name="hours" id="hours" placeholder="pledged hours" required>
			  				<input type="submit" class="btn btn-primary" value="Join Project">
			  				
			  			</form>
		  				<c:if test="${project.owner.userid == user.id or user.role == 'admin' }">
		  					<form action="editProject.do" method="GET">
									<input name="projectId" value="${project.id}" type="hidden">
									<input type="submit" class="btn btn-primary"
										value="Edit Project" />
							</form>
		  				</c:if>
		  </div>
		  <div class="col-sm-3">
		  
		  <!-- put map here -->
		  
		  	<h3>Volunteers:</h3>
		  	<div>
		  	<c:forEach items="${project.volunteers}" var="volunteer">
		  		<strong>Name: </strong>${volunteer.firstName } ${volunteer.lastName }
		  		<br>
		  		<strong>Number: </strong>${volunteer.phone}
		  		<br>
		  		<strong>Email: </strong>${volunteer.user.email}
		  		<br>
		  		
		  		<c:forEach items="${pvList}" var="pv">
		  			<c:if test="${volunteer.userid == pv.volunteer.userid}">
		  				<strong>Pledged Hours: </strong>${pv.hoursPledged}
		  				<br>
		  				<strong>Actual Hours: </strong>${pv.hoursActual }
		  				<br>
		  				<c:if test="${volunteer.userid == user.id or project.owner.userid == user.id or user.role == 'admin' }">
			  				<form action="submitHours.do" method="post">
			  					<label for="hoursActual">Edit Hours: </label>
			  					<input type="hidden" name="userId" id="userId" value="${volunteer.userid}">
			  					<input type="hidden" name="projectId" id="projectId" value="${project.id}">
			  					<input type="number" name="hours" id="hours" value="${pv.hoursPledged}">
			  					<input type="submit" class="btn btn-primary" value="Submit Hours">
			  				</form>
			  				<br>
			  				<form action="removeVolunteer.do" method="post">
			  					<input type="hidden" name="userId" id="userId" value="${volunteer.userid}">
			  					<input type="hidden" name="projectId" id="projectId" value="${project.id}">
			  					<input type="submit" class="btn btn-primary" value="Remove Volunteer">
			  				
			  				</form>
		  				</c:if>
		  			</c:if>
		  					
		  				
		  				
		  		</c:forEach>
		  		
		  	
		  	</c:forEach>
		  
		  	</div>
		  </div>
	</div>




    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
 
</body>
</html>