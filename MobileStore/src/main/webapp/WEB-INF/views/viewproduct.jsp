<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html>

<head>
<title>Product</title>
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
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
.btn-lg{
  padding:17px;
}
</style>

</head>

<body>
      <div class="row">

		<%@ include file="header.jsp"%>
	</div>
     
     <br>
     
     <div class="conatiner">
     <div class="row">
     
     <div class="col-md-4 col-md-offset-1">
           <img src="${context}/res/img/${singleP.productId}.jpg" style="width: 280px; height: 500px;"  />
     </div>
     
     <div class="col-md-4">
       <table class="table">
       <tr><th><b>${name}</b></th><td></td></tr>
       
       <tr><td>RAM :</td><td>  ${singleP.ram} GB</td></tr>
       <tr><td>ROM :</td><td> ${singleP.memory} GB</td></tr>
       <tr><td>Primary Camera :  </td><td>${singleP.backCamera} MP</td></tr>
        <tr> <td>Secondary Camera : </td><td> ${singleP.frontCamera} MP</td></tr>
      
       <tr><td>Color  :</td><td>  ${singleP.color} </td></tr>
       
       <tr><td>Display  :</td><td>  ${singleP.display}.Inch </td></tr>
       <tr><td>Warranty   :</td><td>  ${singleP.warranty} Year </td></tr>
      
       </table>
      <br>
      <br>
           
            <a href="${context}/cart/add/${id}/product" class="btn btn-primary btn-lg "> <span class="glyphicon glyphicon-shopping-cart"> ADD TO CART </a>
            <a href="#" class="btn btn-primary btn-lg"> <span class="glyphicon glyphicon-bookmark"> BUY NOW</a>
        
     </div>
     </div>
     
     <div class="row">
		<%@ include file="footer.jsp"%>
	</div>

        
     </div>

</body>
</html>

