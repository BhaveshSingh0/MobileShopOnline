<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<title>Admin Seller</title>
<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" />
<link rel="stylesheet" href="res/css/admine.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.2/js/jquery.dataTables.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
   
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

				<li class="active">Seller</li>
				<li><a href="${context}/Admin/Category">Catgeory</a></li>

				<li><a href="${context}/Admin/Product">Product </a></li>
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

							<th>Seller Id</th>
							<th>Seller Name</th>
							<th>Address</th>
							<th>Mobile</th>
							<th>Delete</th>
						</tr>
					</thead>

					<tbody>
					<c:forEach items="${seller}" var="seller">

<tr>
<td>
${seller.sellerId}
</td>

<td>
${seller.sellerName}
</td>

<td>
${seller.sellerAddress}
</td>
<td>
${seller.phoneNumber}
</td>


								<td><a href="${context}/${seller.sellerId}/deleteSeller"
								class="btn btn-info" role="button"><i class="fa fa-trash-o" aria-hidden="true"></i></a></td>
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