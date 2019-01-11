<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  
    <title>Home</title>
  </head>
  <body>
	  <header>
	  
		  <div class="headerText">
		  		Welcome to Your Community Volunteer Page
		  		
		  		<div class="row">
		  			<div class="col-sm-4">
		  				<form action="searchKW.do" method="get" id="searchByKW">
		  					<label for="keyword">Search by KeyWord(s): </label>
		  					<input type="text" name="keyword" id="keyword" placeholder="Search" required />
		  					<input type="submit" value="Search" class="btn btn-primary" />
		  				</form>
		  			</div>
		  			<div class="col-sm-4">
		  				<form action="searchCat.do" method="get" id="searchByCat">
		  					<label for="keyword">Search by Category: </label>
		  					<c:forEach var="cat" items="${catList}">
		  						
		  					
		  					
		  					</c:forEach>
		  				
		  				
		  				
		  				</form>
		  				
		  			
		  			</div>
		  		
		  		
		  		</div>
		  	
		  
		  </div>
		  
	  </header>






    <!-- Optional JavaScript -->
    <!-- jQuery first, then Popper.js, then Bootstrap JS -->
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
  </body>
</html>