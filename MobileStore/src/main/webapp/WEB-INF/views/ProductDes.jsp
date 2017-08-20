<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<title>Product Description</title>
<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" />
<link rel="stylesheet" href="res/css/admine.css" />
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" charset="utf8"
	src="//cdn.datatables.net/1.10.2/js/jquery.dataTables.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script>
	$(document).ready(function() {
		var table = $('#example').DataTable();
	});
</script>
</head>
<body>

	<div class="secondary-masthead">

		<div class="container">
			<h1>
				<i class="icon-bookmark icon-large"></i> Shoppe Admin
			</h1>

		</div>
	</div>


	<div class="container">

		<div class="row">
			<div class="col-md-4">
			
		<form action="${context}/productSave"  method="post" >
				<div class="form-group">
					<label for="productId">Product-Id :</label> <input type="text"
						class="form-control" name="productId" value="${pid}" >
						
				</div>
				<div class="form-group">
					<label for="ram">Select RAM:</label> <select class="form-control"
						name="ram">
						
						<option value="0">0 GB</option>
						<option value="1">1 GB</option>
						<option value="2">2 GB</option>
						<option value="3">3 GB</option>
						<option value="4">4 GB</option>
					</select>
				</div>
				
				
				<div class="form-group">
					<label for="ram">Select ROM:</label> <select class="form-control"
						name="rom">
						
						<option value="0">0 GB</option>
						<option value="2">2 GB</option>
						<option value="4">4 GB</option>
						<option value="6">6 GB</option>
						<option value="8">8 GB</option>
					</select>
				</div>
				
				
				
				<div class="form-group">
					<label for="mem">Select Memory:</label> <select class="form-control"
						name="memory">
						<option value="0">0 GB</option>
						<option value="4">4 GB</option>
						<option value="8">8 GB</option>
						<option value="16">16 GB</option>
						<option value="32">32 GB</option>
						<option value="64">64 GB</option>
					</select>
				</div>
				
				
				<div class="form-group">
					<label for="war">Select Warranty :</label> <select class="form-control"
						name="warranty">
						
						<option value="0">0  </option>
						<option value="1">1  </option>
						<option value="2">2  </option>
						
					</select>
				</div>
				
				<div class="form-group">
					<label for="sim">Select Sim-Type :</label> <select class="form-control"
						name="SimType">
						
						<option value="Single">1 </option>
						<option value="Dual">2  </option>
						
					</select>
				</div>
				
				<div class="form-group">
					<label for="Display">Display Screen :</label> <input type="text"
						class="form-control" name="display" >
						
				</div>
				
				
				<div class="form-group">
					<label for="pro">Front Camera  :</label> <input type="text"
						class="form-control" name="frontCamera" >
						
				</div>
				
				<div class="form-group">
					<label for="pr">Back Camera :</label> <input type="text"
						class="form-control" name="backCamera" >
						
				</div>
				
				<div class="form-group">
					<label for="prof">Color :</label> <input type="text"
						class="form-control" name="color" >
						
				</div>
				
				<div class="form-group">
				    <input type="submit" class="btn" value="save Product" />
				</div> 
				</form>
				
			</div>

		</div>
	</div>




</body>
</html>
