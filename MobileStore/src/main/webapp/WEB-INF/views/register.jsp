<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>



<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

<title>Register</title>
</head>
<body>


	<div class="row">
		<%@ include file="header.jsp"%>

	</div>
	<br>

	<div class="container">
		<div class="row">

			<div class="col-md-6 col-md-offset-6">
				<div class="jumbotron"
					style="background-color: white; border-style: solid; border-width: 0px; border-color: black; box-shadow: 5px 5px 40px #D3D4D5">
					<div class="jumbotron"
						style="margin-left: 0px; padding: 5px !important; background-color: #D3D4D5;">
						<span><center>
								<strong>REGISTRATION</strong>
							</center></span>
					</div>

					<form class="form-horizontal" id="myregform"
						style="margin-left: 10px; margin-right: 10px;"
						action="${context}/addUser" method="POST">
						<div class="row">
							<div class="col-xs-6">
								<div class="form-group has-feedback"
									style="margin-right: -10px;">
									<label for="fname">Name</label> <input type="text" tabindex="1"
										id="fname" name="firstname" class="form-control" required
										placeholder="First">

								</div>
							</div>
							<div class="col-xs-6">
								<div class="form-group has-feedback"
									style="margin-right: -10px;">
									<label for="lname">&nbsp;</label> <input type="text"
										tabindex="2" id="lname" name="lastname" class="form-control"
										required placeholder="Last">

								</div>
							</div>
						</div>

						<div class="form-group">
							<label for="pass">Email Id</label> <input type="email"
								tabindex="4" id="email" name="email_add" class="form-control"
								required placeholder="Email ID">
						</div>

						<div class="form-group has-feedback">
							<label for="pass">Create a Password</label> <input
								type="password" tabindex="4" id="pass" name="pass"
								class="form-control" required placeholder="Password"> <span
								class="glyphicon form-control-feedback" aria-hidden="true"></span>
						</div>
						<div class="form-group has-feedback">
							<label for="pass_confirm">Confirm your Password</label> <input
								type="password" tabindex="5" id="pass_confirm"
								name="pass_confirm" class="form-control" required
								placeholder="Confirm Password"> <span
								class="glyphicon form-control-feedback" aria-hidden="true"></span>
						</div>

					
						<div class="form-group has-feedback">
							<label for="contact">Mobile Phone</label>
							<div class="input-group has-feedback">

						   <span class="input-group-btn">
									<button class="btn btn-default" type="button" disabled>+91</button>
								</span> <input type="text" name="mobile" id="contact" tabindex="10"
									class="form-control" data-toggle="popover" data-trigger="hover"
									data-placement="right"
									data-content="Your phone number helps us with things like keeping your account secure."
									placeholder="Example: 9004196353" />

							</div>
						</div>

						<div class="form-group has-feedback" style="margin-left: 10px;">
							<label for="rights"></label>
							<div class="checkbox has-feedback">
								<input type="checkbox" id="rights" name="rights" tabindex="11"
									value="yes" required>
								<p style="font-size: 14.5px;">
									I agree to the MobileShoppee.com <a href="terms.html"><b>Terms
											of Service and Privacy Policy</b></a>.
								</p>
							</div>
						</div>

						<div class="form-group" style="margin-bottom: -20px;">
							<div class="col-sm-offset-4 col-sm-12">
								<input type="button" id="reg_button" value="Register"
									class="btn btn-success" tabindex="12">
							</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	<script>
		$('#contact').popover();
		$('#name').popover();
	</script>

	<!-- Script for validation of form goes right below, hoss!-->
	<script type="text/javascript">
		function validateName(name) {
			var string = $("#" + name).val();
			var regex = /^[a-zA-Z]*$/;
			if (string === null || string === "") {
				var div = $("#" + name).closest("div");
				div.addClass("has-warning");
				div.removeClass("has-success");
				div.removeClass("has-error");
				$('#error' + name).remove();

				if (name === 'fname')
					div
							.append('<span id="error'+name+'" style="color: red;font-size: 10px;display: none">Please enter your First Name</span>');
				if (name === 'lname')
					div
							.append('<span id="error'+name+'" style="color: red;font-size: 10px;display: none">Please enter your Last Name</span>');
				$('#error' + name).css({
					"display" : "inline"
				});
				$("#glyphcn" + name).remove();
				div
						.append('<span id="glyphcn'+name+'"class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>');
				return false;
			} else if (regex.test(string)) {
				var div = $("#" + name).closest("div");

				div.removeClass("has-warning");
				div.addClass("has-success");
				div.removeClass("has-error");

				$('#error' + name).remove();
				$('#error' + name).css({
					"display" : "none"
				});
				$("#glyphcn" + name).remove();
				div
						.append('<span id="glyphcn'+name+'"class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>');
				return true;
			} else {
				var div = $("#" + name).closest("div");
				div.removeClass("has-warning");
				div.removeClass("has-success");
				div.addClass("has-error");

				$("#error" + name).remove();
				div
						.append('<span id="error'+name+'" style="color: red;font-size: 10px;display: none">Enter only Alphabets.</span>');
				$('#error' + name).css({
					"display" : "inline"
				});
				$("#glyphcn" + name).remove();
				div
						.append('<span id="glyphcn'+name+'"class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>');
				return false;
			}
		}

		function validatePassword(key1) {
			var keyLength = $("#" + key1).val().length;
			var string = $("#" + key1).val();
			var regex_space = new RegExp(" ");
			if (keyLength === 0) {
				var div = $("#" + key1).closest("div");
				$("#error" + key1).remove();
				$('#glyphcn' + key1).remove();

				div.removeClass("has-warning");
				div.removeClass("has-success");
				div.addClass("has-error");

				div
						.append('<span id="glyphcn'+key1+'"class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>');
				div
						.append('<span id="error'+key1+'" style="color: red;font-size: 10px;display: none">Please enter a Password.</span>');
				$('#error' + key1).css({
					"display" : "inline"
				});
				return false;
			} else {
				if (regex_space.test(string)) {
					var div = $("#" + key1).closest("div");
					$("#error" + key1).remove();
					$('#glyphcn' + key1).remove();

					div.addClass("has-warning");
					div.removeClass("has-success");
					div.removeClass("has-error");

					div
							.append('<span id="glyphcn'+key1+'"class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>');
					div
							.append('<span id="error'+key1+'" style="color: red;font-size: 10px;display: none">Password must not contain any spaces.</span>');
					$('#error').css({
						"display" : "inline"
					});
					return false;
				} else {
					if (keyLength < 8) {
						var div = $("#" + key1).closest("div");
						$("#error" + key1).remove();
						$('#glyphcn' + key1).remove();

						div.addClass("has-warning");
						div.removeClass("has-success");
						div.removeClass("has-error");

						div
								.append('<span id="glyphcn'+key1+'"class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>');
						div
								.append('<span id="error'+key1+'" style="color: red;font-size: 10px;display: none">Password must be greater than or equal to 8 characters.</span>');
						$('#error' + key1).css({
							"display" : "inline"
						});
						return false;
					} else {
						var div = $("#" + key1).closest("div");
						$("#error" + key1).remove();
						$('#glyphcn' + key1).remove();

						div.removeClass("has-warning");
						div.addClass("has-success");
						div.removeClass("has-error");

						div
								.append('<span id="glyphcn'+key1+'"class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>');
						return true;
					}
				}
			}
		}
		function passwordConfirmation(key1, key2) {
			var keyValue1 = $("#" + key1).val();
			var keyValue2 = $("#" + key2).val();

			var keyLength = $("#" + key1).val().length;
			if (keyLength === 0) {
				var div = $("#" + key1).closest("div");
				$("#error" + key1).remove();
				$('#glyphcn' + key1).remove();

				div.removeClass("has-warning");
				div.removeClass("has-success");
				div.addClass("has-error");

				div
						.append('<span id="glyphcn'+key1+'"class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>');
				div
						.append('<span id="error'+key1+'" style="color: red;font-size: 10px;display: none">Please enter the confirmation Password.</span>');
				$('#error' + key1).css({
					"display" : "inline"
				});
				return false;
			} else if (keyValue1 === keyValue2) {
				var div = $("#" + key1).closest("div");
				$('#error' + key1).css({
					"display" : "none"
				});
				$("#error" + key1).remove();
				$('#glyphcn' + key1).remove();

				div.removeClass("has-warning");
				div.addClass("has-success");
				div.removeClass("has-error");

				div
						.append('<span id="glyphcn'+key1+'"class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>');
				return true;
			} else {
				var div = $("#" + key1).closest("div");
				$("#error" + key1).remove();
				$('#glyphcn' + key1).remove();

				div.removeClass("has-warning");
				div.removeClass("has-success");
				div.addClass("has-error");

				div
						.append('<span id="glyphcn'+key1+'"class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>');
				div
						.append('<span id="error'+key1+'" style="color: red;font-size: 10px;display: none">Please enter the same password as above.</span>');
				$('#error' + key1).css({
					"display" : "inline"
				});
				return false;
			}
		}

		function validateRights(key1) {
			var val = document.getElementById(key1).checked;
			if (!val) {
				var div = $("#" + key1).closest("div");
				div
						.append('<span id="glyphcn'+key1+'" style="margin-right: -20px;" class="glyphicon glyphicon-remove form-control-feedback" aria-hidden="true"></span>');
				div
						.append('<span id="error'+key1+'" style="color: red;font-size: 10px;display: none">You really need to check this before registeration.</span>');
				$('#error' + key1).css({
					"display" : "inline"
				});
				return false;
			} else {
				var div = $("#" + key1).closest("div");
				$('#error' + key1).css({
					"display" : "none"
				});
				$("#error" + key1).remove();
				$('#glyphcn' + key1).remove();

				div.removeClass("has-warning");
				div.addClass("has-success");
				div.removeClass("has-error");

				div
						.append('<span id="glyphcn'+key1+'" style="margin-right: -20px;" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>');
				return true;
			}
		}
		function validateContact(key1) {
			var value = $("#" + key1).val();
			var regex = /[^0-9]/;
			if (value === null || value === "") {
				var div = $("#" + key1).closest("div");
				div.addClass("has-warning");
				div.removeClass("has-success");
				div.removeClass("has-error");
				$('#error' + key1).remove();

				$("#" + key1).css({
					"margin-top" : "14px"
				});
				div
						.append('<span id="error'+key1+'" style="color: red;font-size: 10px;display: none;">Please enter your contact number.</span>');
				$('#error' + key1).css({
					"display" : "table"
				});
				$("#glyphcn" + key1).remove();
				div
						.append('<span id="glyphcn'+key1+'" style="margin-top: 14px;" class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>');
				return false;
			} else if (value.length !== 10 || regex.test(value)) {
				var div = $("#" + key1).closest("div");
				div.removeClass("has-warning");
				div.removeClass("has-success");
				div.addClass("has-error");
				$('#error' + key1).remove();

				$("#" + key1).css({
					"margin-top" : "14px"
				});
				div
						.append('<span id="error'+key1+'" style="color: red;font-size: 10px;display: none;">Please enter a valid contact number.</span>');
				$('#error' + key1).css({
					"display" : "table"
				});
				$("#glyphcn" + key1).remove();
				div
						.append('<span id="glyphcn'+key1+'" style="margin-top: 14px;" class="glyphicon glyphicon-warning-sign form-control-feedback" aria-hidden="true"></span>');
				return false;
			} else {
				var div = $("#" + key1).closest("div");
				$('#error' + key1).css({
					"display" : "none"
				});
				$("#error" + key1).remove();
				$('#glyphcn' + key1).remove();

				div.removeClass("has-warning");
				div.addClass("has-success");
				div.removeClass("has-error");

				$("#" + key1).css({
					"margin-top" : " 0px"
				});
				div
						.append('<span id="glyphcn'+key1+'" style="margin-top: 0px;" class="glyphicon glyphicon-ok form-control-feedback" aria-hidden="true"></span>');
				return true;
			}
		}
		$(document).ready(

				function() {
					$("#reg_button").click(
							function() {
								validateName("fname");
								validateName("lname");
								validatePassword("pass");
								passwordConfirmation("pass_confirm", "pass");
								validateRights("rights");
								validateContact("contact");
								if (validateName("fname")
										&& validateName("lname")
										&& validatePassword("pass")
										&& passwordConfirmation("pass_confirm",
												"pass")
										&& validateRights("rights")
										&& validateContact("contact"))
									$("form#myregform").submit();
								else
									$("#wrong").css({
										"display" : "block"
									});
							});
				}

		);
	</script>

</body>
</html>