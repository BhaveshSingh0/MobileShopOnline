<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="x"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Admin</title>
<script
	src="https://cdn.datatables.net/1.10.15/js/jquery.dataTables.min.js"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.15/css/jquery.dataTables.min.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<style>
#formadd {
	display: none;
}

#formeditp {
	display: none;
}

#formaddp {
	display: none;
}

.test {
	padding: 15px;
	background-color: #333;
}

.test h2 {
	color: white;
	font-size: 25px;
}

#disp {
	display: none;
}

#dispupdate {
	display: none;
}

#dispdelete {
	display: none;
}

#categorytable {
	display: none;
}
</style>



<script>
	$(document).ready(function() {

		//  var table = $('#example').dataTable();

		$("input[type='radio']").click(function() {
			var val = $("input[name='optradio']:checked").attr('id');

			if (val == "addp") {
				$("#formadd").css("display", "none");
				$("#formeditp").css("display", "none");
				$("#formaddp").css("display", "block");

			}
			if (val == "add") {
				$("#formaddp").css("display", "none");
				$("#formeditp").css("display", "none");
				$("#formadd").css("display", "block");
			}
			if (val == "editp") {
				$("#formaddp").css("display", "none");
				$("#formadd").css("display", "none");
				$("#formeditp").css("display", "block");
			}

		});

		$("#addData").click(function() {
			$("#disp").toggle();

		});

	});
</script>
</head>
<body>

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
				<li><a href="#">Admin </a> <span class="divider">/</span></li>
				<li class="active">Dashboard</li>
				<li><a href="${context}/Admin/Seller">Seller</a></li>
				<li><a href="${context}/Admin/Category">Catgeory</a></li>
				<li><a href="${context}/Admin/Product">Product </a></li>
			</ul>

		</div>

	</div>




	<div class="main-area dashboard">

		<div class="container">

			<div class="row">

				<div class="span12">

					<div class="slate clearfix">

						<a class="stat-column" href="#"> <span class="number">16</span>
							<span>Products</span>

						</a> <a class="stat-column" href="#"> <span class="number">452</span>
							<span>Categories</span>

						</a> <a class="stat-column" href="#"> <span class="number">$2,512</span>
							<span>Revenue</span>

						</a> <a class="stat-column" href="#"> <span class="number">348</span>
							<span>Supplier</span>

						</a>


					</div>

				</div>

			</div>
		</div>
	</div>


	<div class="container">

		<div class="row">
			<div class="col-md-5">

				<div class="btn-group">
					<button type="button" id="addData" class="btn btn-primary">Add
					</button>
				</div>
			</div>
		</div>
	</div>
	<div class="row" id="rowdata" style="margin-left: 20px;">



		<!-- --------------------- Add  -------------------------- -->

		<div id="disp">
			<div class="col-md-3">
				<div class="radio">
					<label><input type="radio" id="add" name="optradio">Add
						Category</label>
				</div>
				<div class="radio">
					<label><input type="radio" id="addp" name="optradio">Add
						Product </label>
				</div>
				<div class="radio">
					<label><input type="radio" id="editp" name="optradio">Add
						Supplier </label>
				</div>




			</div>
			<div class="col-md-3">
				<div id="formadd">

					<form id="addcategory" action="${context}/Admin/add/category"
						method="post">
						<div class="form-group">
							<label for="category">Category Name:</label> <input name="name"
								type="text" class="form-control" id="category">
						</div>

						<div class="form-group">
							<label for="description">Description:</label> <input name="desc"
								type="text" class="form-control" id="description">
						</div>
						<div class="form-group">
							<input type="submit" class="btn" value="Add Category"
								id="category">
						</div>
						 <input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />

					</form>
				</div>

				<div id="formaddp">

					<form id="addproduct" action="${context}/add/product"
						enctype="multipart/form-data" method="post">

						<div class="form-group">
							<label for="category">Product Name:</label> <input type="text"
								class="form-control" name="productName" id="category">
						</div>
						<div class="form-group">
							<label for="category">Product Image:</label> <input type="file"
								name="file">
						</div>
						
						<div class="form-group">
							<label for="sel1">Select Category:</label> <select
								class="form-control" name="categoryId" id="cat">
								<c:forEach items="${category}" var="category">
									<option value="${category.id}">${category.name}</option>
								</c:forEach>

							</select>
						</div>

						<div class="form-group">
							<label for="sel1">Select Seller:</label> <select
								class="form-control" name="sellerId" id="sel1">
								<c:forEach items="${seller}" var="seller">
									<option value="${seller.sellerId}">
										${seller.sellerName}</option>
								</c:forEach>
							</select>
						</div>



						<div class="form-group">
							<label for="description">Price:</label> <input type="number"
								class="form-control" name="price" id="description">
						</div>

						<div class="form-group">
							<label for="description">Quantity:</label> <input type="number"
								class="form-control" name="productCount" id="description">
						</div>

						<div class="form-group">
							<input type="submit" class="btn" value="Add Product"
								id="category">
						</div>
                           <input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
					</form>
				</div>

				<div id="formeditp">

					<form id="addsuplier" action="${context}/add/supplier">
						<div class="form-group">
							<label for="category">Supplier Name:</label> <input type="text"
								class="form-control" name="sellerName"
								placeholder="Supplier Name" id="category">
						</div>

						<div class="form-group">
							<label for="contact">Mobile Phone</label>
							<div class="input-group">

								<span class="input-group-btn">
									<button class="btn btn-default" type="button" disabled>+91</button>
								</span> <input type="text" name="phoneNumber" id="contact1"
									tabindex="10" class="form-control" data-toggle="popover"
									data-trigger="hover" data-placement="right"
									data-content="Your phone number helps us with things like keeping your account secure."
									placeholder="Example: 8419930936" />

							</div>
						</div>

						<div class="form-group">
							<label for="description">Address:</label> <input type="text"
								class="form-control" id="autocomplete" name="sellerAddress"
								placeholder="Address" onFocus="geolocate()">
						</div>
						<div class="form-group">
							<input type="submit" class="btn" value="Add Supplier"
								id="category">
						</div>
					</form>

				</div>
			</div>
		</div>

	</div>





	<script>
		var placeSearch, autocomplete;
		var componentForm = {
			street_number : 'short_name',
			route : 'long_name',
			locality : 'long_name',
			administrative_area_level_1 : 'short_name',
			country : 'long_name',
			postal_code : 'short_name'
		};

		function initAutocomplete() {
			autocomplete = new google.maps.places.Autocomplete(
			/** @type {!HTMLInputElement} */
			(document.getElementById('autocomplete')), {
				types : [ 'geocode' ]
			});

			autocomplete.addListener('place_changed', fillInAddress);
		}

		function fillInAddress() {
			// Get the place details from the autocomplete object.
			var place = autocomplete.getPlace();

			for ( var component in componentForm) {
				document.getElementById(component).value = '';
				document.getElementById(component).disabled = false;
			}

			for (var i = 0; i < place.address_components.length; i++) {
				var addressType = place.address_components[i].types[0];
				if (componentForm[addressType]) {
					var val = place.address_components[i][componentForm[addressType]];
					document.getElementById(addressType).value = val;
				}
			}
		}

		function geolocate() {
			if (navigator.geolocation) {
				navigator.geolocation.getCurrentPosition(function(position) {
					var geolocation = {
						lat : position.coords.latitude,
						lng : position.coords.longitude
					};
					var circle = new google.maps.Circle({
						center : geolocation,
						radius : position.coords.accuracy
					});
					autocomplete.setBounds(circle.getBounds());
				});
			}
		}
	</script>
	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcXs-7TBRttYlGFHgCYfRFwsUiV1AAWyY&libraries=places&callback=initAutocomplete"
		async defer></script>



</body>
</html>