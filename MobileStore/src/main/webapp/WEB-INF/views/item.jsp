<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Products</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css"
	rel="stylesheet" type="text/css" />

<style>
.breadcrumb {
	
}

div.vertical-line {
	width: 1px; /* Line width */
	background-color: black;
	height: 100%;
	float: left;
	margin-top: -20px;
}
</style>
</head>
<body>



	<%@ include file="header.jsp"%>
	<br>
	<br>

	<div class="row">

		<div class="col-md-offset-1 col-md-2">



			<%@ include file="category.jsp"%>


		</div>

		<div class="col-md-1">

			<div class="vertical-line" style="height: 380px;"></div>

		</div>
		<div class="col-md-7">



			<!-- ---------------------------all product--------------------------------------------- -->
			<c:if test="${clickOnAllProducts == true }">
				<ol class="breadcrumb" style="background-color:#ddd">
					<li><a href="${context}/index">Home</a> &nbsp;<i
						class="fa fa-home" aria-hidden="true"></i></li>
					<li class="active">All Products</li>
				</ol>






				<br>



				<c:if test="${empty product}">
					<div class="alert alert-info">
						<strong>Info!</strong> No Product Found !
					</div>

				</c:if>
				<c:if test="${not empty product}">


					<table id="example" class="display" cellspacing="10"
						style="background-color: #ddd;">
						<thead>
							<tr>
								<th>Product</th>
								<th>Name</th>
								<th>Price</th>
								<th>Rating</th>
							</tr>
						</thead>


						<c:forEach items="${product}" var="product">
							<tr>
								<td>
									<div class="row">
										<div class="col-xs-1">
											<a
												href="${context}/view/${product.productId}/${product.productName}/${product.imagePath}">
												<img src="${context}/res/img/${product.imagePath}.jpg"
												style="height: 100px; width: 60px;" />
											</a>
										</div>
									</div>
								</td>
								<td><b>${product.productName}</b></td>
								<td><h4><i class="fa fa-inr" aria-hidden="true"></i>  ${product.price}</h4></td>
								<td>

									<h2 class="bold padding-bottom-7">${product.rating}<small>/
											5</small>
									</h2>
									<button type="button" class="btn btn-warning btn-sm"
										aria-label="Left Align">
										<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
									</button>

                          



								</td>
							</tr>

						</c:forEach>

						</tbody>
					</table>
				</c:if>

			</c:if>

			<!-- --------------------------- by catgeory--------------------------------------------- -->

			<c:if test="${clickOnCategory == true }">
				<ol class="breadcrumb">
					<li><a href="${context}/index">Home</a> &nbsp;<i
						class="fa fa-home" aria-hidden="true"></i></li>
					<li class="active">Category</li>
					<li class="active">${title}</li>
				</ol>



				<br>

				<br>



				<c:if test="${empty product}">
					<div class="alert alert-info">
						<strong>Info!</strong> No Product Found !
					</div>

				</c:if>
				<c:if test="${not empty product}">


					<table id="example" class="display" cellspacing="10"
						style="background-color: #ddd;">
						<thead>
							<tr>
								<th>Product</th>
								<th>Name</th>
								<th>Price</th>
								<th>Rating</th>
							</tr>
						</thead>

						<c:set value="${idCat}" var="id "></c:set>
						<c:forEach items="${product}" var="product">


							<c:if test="${product.categoryId == id }">
								<tr>
									<td><div class="row">
											<div class="col-xs-2">
												<a href="${context}/view/${product.productId}/${product.productName}/${product.imagePath}"><img
													src="${context}/res/img/${product.imagePath}.jpg"
													style="height: 100px; width: 60px;" /></a>
											</div>
										</div></td>
									<td><b>${product.productName}</b></td>
									<td><h4><i class="fa fa-inr" aria-hidden="true"></i> ${product.price}</h4></td>
									<td>
										<h2 class="bold padding-bottom-7">${product.rating}<small>/
												5</small>
										</h2>
										<button type="button" class="btn btn-warning btn-sm"
											aria-label="Left Align">
											<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
										</button>



									</td>
								</tr>
							</c:if>



						</c:forEach>

						</tbody>
					</table>
				</c:if>

			</c:if>




			<br>


		</div>



	</div>






	<div class="row">
		<%@ include file="footer.jsp"%>
	</div>



	<script
		src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"
		type="text/javascript"></script>
	<script>
		$(document).ready(function() {
			var table = $('#example').dataTable();
			var table = $('#example1').dataTable();

		});
	</script>

</body>
</html>