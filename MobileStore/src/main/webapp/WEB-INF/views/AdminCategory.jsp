<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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


			<ul class="breadcrumb">
				<li><a href="#">Admin</a> <span class="divider">/</span></li>
				<li><a href="${context}/Admin">Dashboard </a></li>

				<li><a href="${context}/Admin/Seller">Seller </a></li>
				<li class="active">Catgeory</li>

				<li><a href="${context}/Admin/Product">Product</a></li>
			</ul>

		</div>

	</div>


	<div class="container">
		<div class="row">
			<div class="col-md-12"
				style="background-color: white; padding: 20px; border: 1px #080808; outline: none;">
				<table id="example" class="display" cellspacing="0" width="100%"
					style="background-color: #ddd;">
					<thead>
						<tr>
							<th>Category Id</th>
							<th>Category Name</th>
							<th>Category Description</th>
							<th>Delete</th>

						</tr>
					</thead>

					<tbody>





						<c:forEach items="${category}" var="category">



							<tr>
								<form action="${context}/Admin/deleteCategory/${category.id}"
									method="post">
									
									<td>${category.id}</td>
									<td>${category.name}</td>
									<td>${category.description}</td>
									<td><button type="submit" class="submit-with-icon">
											<span class="glyphicon glyphicon-trash"></span>
										</button></td>
								</form>
							</tr>

						</c:forEach>





					</tbody>
				</table>
			</div>
		</div>
	</div>

</body>
</html>