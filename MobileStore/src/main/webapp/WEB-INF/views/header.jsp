<%@taglib prefix="security"
	uri="http://www.springframework.org/security/tags"%>

<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<title>Header</title>
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script type="text/javascript" charset="utf8"
	src="//cdn.datatables.net/1.10.2/js/jquery.dataTables.js"></script>
<style>

.bs-autocomplete{
  background-color: #fff;
  box-shadow: 0px 1px 6px 1px rgba(0, 0, 0, 0.4);
}



</style>
<script>
  $( function() {
	 
	  var p = document.getElementById("tag1").value;

    var availableTags = new Array();
    p =  p.slice(1,-1);
    availableTags = p.split(',');
    $( "#tags" ).autocomplete({
      source: availableTags
    });
  });
  
  </script>
<style>
nav li {
	font-family: "Avant Garde", Avantgarde, "Century Gothic", CenturyGothic,
		"AppleGothic", sans-serif;
	font-size: 15px;
	color: black;
}

li:hover a {
	color: white
}

h1 {
	font-family: "Avant Garde", Avantgarde, "Century Gothic", CenturyGothic,
		"AppleGothic", sans-serif;
	font-size: 20px;
	margin-top: 0px;
	padding: 10px 10px;
	text-align: center;
	text-transform: uppercase;
	text-rendering: optimizeLegibility;
}

.elegantshd {
	margin-top: 0px;
	color: #333;
	letter-spacing: .15em;
}
</style>
</head>
<body>

	<div class="row">
		<div class="col-md-4">
			<img src="${context}/res/img/mobileshop.png" style="height: 90px;" />
		</div>
	</div>
	<!--  --------------------------------------------------------------  -->

	<div class="row">
		<div class="col-md-12">

			<nav class="navbar navbar-default"
				style=" border:none; outline:none; ">
			<div class="container-fluid">
				<div class="collapse navbar-collapse"
					id="bs-example-navbar-collapse-1">
					<ul class="nav navbar-nav">
						<li><a href="${context}/index" class="active">Home <span
								class="sr-only">(current)</span><i class="fa fa-home"
								aria-hidden="true"></i></a></li>
						<li><a href="#">About Us <i class="fa fa-user"
								aria-hidden="true"></i></a></li>
						<li><a href="${context}/show/all/products">All products <i
								class="fa  fa-list" aria-hidden="true"></i>
						</a></li>


					</ul>

   
					<input type="hidden" id="tag1" value="${user}" />	
				


					<div class="navbar-form navbar-left">
				<form  action="${context}/show/product" method="get" >
				
				<input type="text" id="tags" name="mobilename"  class="form-control bs-autocomplete"  placeholder="Search Mobile"  style="width: 400px; font-size: 18px;" />
				<input type="submit" class="btn btn-primary" value="Search	" />
				</form>
					</div>


					<ul class="nav navbar-nav navbar-right">
						<li><a href="#">Contact <i class="fa fa-phone"></i></a></li>

						<security:authorize access="isAuthenticated()">



							<li><a href="#">${userModel.fullName}
									 <i class="fa fa-user"></i>
							</a></li>

							<security:authorize access="hasAuthority('USER')">

								<li><a href="${context}/cart/show">Cart - <span class="badge">${userModel.cartLineCount}</span>
										&nbsp;<i class="fa fa-shopping-cart"></i></a></li>

							</security:authorize>

							<li><a href="${context}/perform-logout">Logout</a></li>
						</security:authorize>

				<security:authorize access="isAnonymous()">
							<li><a href="${context}/signin">SignIn &nbsp;<i
									class="fa fa-user"></i></a></li>
							<li><a href="${context}/signup">SignUp &nbsp;<i
									class="fa fa-user-plus"></i></a></li>
						</security:authorize>
                   	</ul>



				</div>
			</div>
			</nav>


		</div>
	</div>


	<br>


</body>
</html>