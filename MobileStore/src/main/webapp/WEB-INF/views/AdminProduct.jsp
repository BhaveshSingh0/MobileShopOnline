<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin Product</title>

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

<style>
td {
	font-size: 18px;
}
</style>
<link
	href="https://gitcdn.github.io/bootstrap-toggle/2.2.2/css/bootstrap-toggle.min.css"
	rel="stylesheet">

</head></head>
<body>
	<script
		src="https://gitcdn.github.io/bootstrap-toggle/2.2.2/js/bootstrap-toggle.min.js"></script>


<br>
	<div class="container">
		<c:if test="${dataStored == true }">
			<div class="alert alert-success">
				<strong>Success!</strong>${title}
			</div>

		</c:if>
		<c:if test="${dataStored == false }">

			<div class="alert alert-warning">
				<strong>Warning!</strong>${title}

			</div>
		</c:if>

	</div>
	<br>

	<div class="secondary-masthead">

		<div class="container">
			<h1>
				<i class="icon-bookmark icon-large"></i> Shoppe Admin
			</h1>


			<ul class="breadcrumb">
				<li><a href="#">Admin</a> <span class="divider">/</span></li>
				<li><a href="${context}/Admin">Dashboard</a></li>
				<li><a href="${context}/Admin/Seller">Seller</a></li>
				<li><a href="${context}/Admin/Category">Catgeory</a></li>

				<li class="active">Product</li>
			</ul>

		</div>

	</div>




	<div class="container">
		<div class="row">
			<div class="col-md-12"
				style="background-color: white; padding: 20px; border: 1px #080808; outline: none;">
			<div class="table-responsive" >
				<table id="example" class="table table-striped table-bordered" cellspacing="0" width="100%"
					style="background-color: #ddd;">
					<thead>
						<tr>

							<th>Product Id</th>
							<th>Product</th>
							<th>Name</th>
							<th>Price</th>
							<th>Product Count</th>
							<th>Deactivate /Activate</th>
							<th>Update product</th>
						</tr>
					</thead>

					<tbody>
						<c:forEach items="${product}" var="product">


							<tr>
								<td>${product.productId}</td>
								<td>

									<div class="row">
										<div class="col-xs-1">
											<a
												href="${context}/view/${product.imagePath}/${product.productName}">
												<img src="${context}/res/img/${product.imagePath}.jpg"
												style="height: 100px; width: 60px;" />
											</a>
										</div>
									</div>
								</td>
								<td>${product.productName}</td>

								<td><i class="fa fa-inr" aria-hidden="true"></i>
									${product.price}</td>

								<td>${product.productCount}</td>


								<td>
								<a href="${context}/${product.productId}/${product.imagePath}/deleteProduct"
									class="btn btn-info" role="button"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>







								<td><a href="${context}/${product.productName}/${product.imagePath}/updateProduct"
									class="btn btn-info" role="button"><i class="fa fa-pencil-square-o" aria-hidden="true"></i></a></td>

							</tr>


						</c:forEach>





					</tbody>
				</table>
			</div>
		</div>
	</div>
</div>

</body>
</html>