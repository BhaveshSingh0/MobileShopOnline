<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Update Product</title>
<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" />

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>



<br>
<br>
<br>



	<div  class="container">
    <div class="row" >
    <div class="col-md-5">
					<form id="addproduct" action="${context}/updateProduct1"
						 method="post">

	<c:forEach items="${product}" var="product">
						<div class="form-group">
							<label for="category">Product Name:</label> <input type="text"
								class="form-control" name="productName" value="${product.productName}" id="category">
						</div>
						<div class="form-group">
							<label for="category">Product Image:</label> <input type="text"
								name="imagePath"   value="${product.imagePath }">
						</div>
						
						<input type="hidden"  name="hid" value="1">
						
						<div class="form-group">
							<label for="sel1"> Category:</label><input type="text"  value="${product.categoryId}"
								class="form-control" name="categoryId" id="cat" >
							
						</div>

						<div class="form-group">
							<label for="sel1"> Seller:</label> <input type="text"  value="${product.sellerId}"
								class="form-control" name="sellerId" id="sel1">
								
							
						</div>



						<div class="form-group">
							<label for="description">Price:</label> <input type="number"
								class="form-control"  value="${product.price}" name="price" id="description">
						</div>

						<div class="form-group">
							<label for="description">Quantity:</label> <input type="number"
								class="form-control" value="${product.productCount}" name="productCount" id="description">
						</div>

					
						
					<div class="form-group">
					<label for="productId">Product-Id :</label> <input type="text"
						class="form-control" name="productId" value="${product.productId}" >
					
			   	</div>	
						</c:forEach>
						
						
				<div class="form-group">
					<label for="ram"> RAM:</label> <input type="text" value="${d.ram}" class="form-control"
						name="ram">
						
						
				</div>
				
				
				<div class="form-group">
					<label for="ram"> ROM:</label> <input type="text" value="${d.rom}"  class="form-control"
						name="rom">
						
						
				</div>
				
				
				
				<div class="form-group">
					<label for="mem"> Memory:</label><input type="text"  value="${d.memory}"  class="form-control"
						name="memory">
						
				</div>
				
				
				<div class="form-group">
					<label for="war"> Warranty :</label><input type="text" value="${d.warranty}"  class="form-control"
						name="warranty">
						
				</div>
				
		
				
				<div class="form-group">
					<label for="Display">Display Screen :</label> <input type="text" value="${d.display}" 
						class="form-control" name="display" >
						
				</div>
				
				
				
				<div class="form-group">
					<label for="pro">Front Camera  :</label> <input type="text"
						class="form-control" name="frontCamera" value="${d.frontCamera}"  >
						
				</div>
				
				<div class="form-group">
					<label for="pr">Back Camera :</label> <input type="text"
						class="form-control" name="backCamera" value="${d.backCamera}"  >
						
				</div>
				
				<div class="form-group">
					<label for="prof">Color :</label> <input type="text"
						class="form-control" name="color" value="${d.color}"  >
						
				</div>
				
				
                           <input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
									
									
										<div class="form-group">
							<input type="submit" class="btn" value="Update Product"
								id="category">
						</div>
					</form>
					</div>
					
				</div>

</div>
	
</body>
</html>