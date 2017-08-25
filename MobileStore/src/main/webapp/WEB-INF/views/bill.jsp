<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Billing</title>

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

</head>
<body>




	<br>
	<br>
	<div clas="container">



		<%@ include file="header.jsp"%>


		<div class="row">




			<div class="col-md-offset-1 col-md-4">


				<br>
				<div class="alert alert-info">
					<strong>Info!</strong> Enter Total Address in Address Field !
				</div>

				<br>


				<form action="${context}/cart/add/detail" method="POST">

					<div class="form-group">
						<label for="description">Address:</label> <input type="text"
							class="form-control" id="autocomplete" name="completeAddress"
							placeholder="Address" onFocus="geolocate()">
					</div>

					<input type="hidden" name="${_csrf.parameterName}"
						value="${_csrf.token}" />
					<div class="form-group">
						<label for="usr">Street:</label> <input type="Text"
							class="form-control" name="street" id="street_number"></input>

					</div>

					<div class="form-group">
						<label for="usr">Route</label> <input type="text"
							class="form-control" name="route" id="route"></input>

					</div>
					<div class="form-group">
						<label for="usr">City:</label> <input type="text"
							class="form-control" name="city" id="locality" placeholder="City"
							required>
					</div>
					<div class="form-group">
						<label for="pwd">Mobile:</label> <input type="text"
							class="form-control" name="mobile" value="${userModel.mobile}"
							placeholder="Country" required>
					</div>

					<div class="form-group">
						<label for="pwd">State:</label> <input type="text"
							class="form-control" name="state"
							id="administrative_area_level_1" placeholder=" State" required>
					</div>
					<div class="form-group">
						<label for="pwd">ZipCode:</label> <input type="text"
							class="form-control" name="zip" id="postal_code"
							placeholder="ZipCode" required>
					</div>
					<div class="form-group">
						<label for="pwd">Country:</label> <input type="text"
							class="form-control" name="country" id="country"
							placeholder="Country" required>
					</div>


					<input type="submit" class="btn btn-info" value="Submit">




				</form>

			</div>

			<!--  -----------------------  second Side ---------------     -->



			<div class=" col-md-6">
				<br>

				<div class="jumbotron jumbotron-fluid">
					<div class="container">

						<h2>Details-</h2>
						<c:forEach items="${cartLines}" var="cartLine">
							<p>
							<li>${cartLine.product.productName} <i
								class="fa fa-shopping-bag" aria-hidden="true"></i> /
								${cartLine.buyingPrice} <i class="fa fa-inr" aria-hidden="true"></i>
								/ <span class="badge">${cartLine.productCount} </span>
							</li>
						</c:forEach>
						<br>

						<h3>
							Grand Total : ${userModel.cart.grandTotal} <i class="fa fa-inr"
								aria-hidden="true"></i>
						</h3>



					</div>
				</div>






			</div>

		</div>



		<%@ include file="footer.jsp"%>

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