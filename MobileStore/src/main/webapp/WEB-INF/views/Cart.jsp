<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Cart </title>
<script src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" />
<link rel="stylesheet" href="res/css/admine.css"/>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script type="text/javascript" charset="utf8" src="//cdn.datatables.net/1.10.2/js/jquery.dataTables.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<script>

$(document).ready(function(){
	

$('button[name="refreshCart"]').click(function() {
	
	var cartLineId = $(this).attr('value');
	var countElement = $('#count_' + cartLineId);	
	var originalCount = countElement.attr('value');
	var currentCount = countElement.val();
	
	if(currentCount !== originalCount) {
		
		if(currentCount < 1 || currentCount > 3) {
			countElement.val(originalCount);
	       	alert("Product Count Should be Min 1 and Max 3") ;
		}
		else {
			
			var updateUrl =   '/MobileStore'+ '/cart/' + cartLineId + '/update?count=' + currentCount;
			window.location.href = updateUrl;
			alert("Update cart count");
			
		}
		
		
		
	}
	
	
});	
});

</script>

</head>
   <body>
   
   
<%@ include file="header.jsp"%>
		
	
<div class="container">
		<br>


	<c:if test="${not empty message}">
	
		<div class="alert alert-info">
		
			<h3 class="text-center">
				${message}
			</h3>
		
		</div>
	
	</c:if>

	<c:choose>
		
		<c:when test="${not empty cartLines}">
		
<table id="cart" class="table table-hover table-condensed">
				<thead>
		<tr>
			<th style="width:50%">Product</th>
			<th style="width:10%">Price</th>
			<th style="width:8%">Quantity</th>
			<th style="width:22%" class="text-center">Subtotal</th>
			<th style="width:10%"></th>
		</tr>
	</thead>
	<tbody>
		
		
		<c:forEach items="${cartLines}" var="cartLine">
		<tr>
			<td data-th="Product">
				<div class="row">
					<div class="col-sm-2 hidden-xs"><img src="${context}/res/img/${cartLine.product.imagePath}.jpg"
					style="height: 100px; width: 60px;" /></div><div class="col-sm-10">
						<h4 class="nomargin">${cartLine.product.productName}
							<c:if test="${cartLine.available == false }">
								<strong class="unavailable">(Not Available)</strong>
							</c:if>
						</h4>
					</div>
				</div>
			</td>
			<td data-th="Price">&#8377; ${cartLine.buyingPrice}</td>
			<td data-th="Quantity">
				<input type="number" id="count_${cartLine.id}" min="1" max="3" class="form-control text-center" value="${cartLine.productCount}">
			</td>
			<td data-th="Subtotal" class="text-center">&#8377; ${cartLine.total}</td>
			<td class="actions" data-th="">
				<button type="button" name="refreshCart" value="${cartLine.id}" class="btn btn-info btn-sm"><span class="glyphicon glyphicon-refresh"></span></button>
				<a href="${context	}/cart/${cartLine.id}/delete" class="btn btn-danger btn-sm"><span class="glyphicon glyphicon-trash"></span></a>								
			</td>
		</tr>
		
		</c:forEach>
 	
	</tbody>
	<tfoot>
		<tr class="visible-xs">
			<td class="text-center"><strong>Total &#8377; ${userModel.cart.grandTotal}</strong></td>
		</tr>
		<tr>
			<td><a href="#" class="btn btn-warning"><span class="glyphicon glyphicon-chevron-left"></span> Continue Shopping</a></td>
			<td colspan="2" class="hidden-xs"></td>
			<td class="hidden-xs text-center"><strong>Total &#8377; ${userModel.cart.grandTotal}</strong></td>
			<td><a href="#" class="btn btn-success btn-block">Checkout <span class="glyphicon glyphicon-chevron-right"></span></a></td>
		</tr>
	</tfoot>
</table>		
		
		</c:when>
		
		<c:otherwise>
			
			<div class="jumbotron">
			
				<div class="text-center">
				
					
					<h1>Your cart is empty!</h1>
				
				</div>
			
			</div>
		
		</c:otherwise>
	
	</c:choose>



</div>
</body>
</html>