<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="context" value="${pageContext.request.contextPath}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
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

<script>
	$(function() {
		
		
	});
</script>
</head>
<body>

	<div class="row">
		<%@ include file="header.jsp"%>

	</div>
	<br>


	<div class="row">
		<div class="col-md-offset-3 col-md-6">

			<div class="panel panel-primary">

				<div class="panel-heading">
					<h4>Login</h4>
				</div>

				<div class="panel-body">
					<form action="${context}/login" method="POST"
						class="form-horizontal" id="loginForm">
						<div class="form-group">
							<label for="username" class="col-md-4 control-label">Email:
							</label>
							<div class="col-md-8">
								<input type="text" name="email_add" id="username"
									class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<label for="password" class="col-md-4 control-label">Password:
							</label>
							<div class="col-md-8">
								<input type="password" name="pass" id="password"
									class="form-control" />
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-offset-4 col-md-8">
								<input type="submit" value="Login" class="btn btn-primary" /> <input
									type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
							</div>
						</div>
					</form>

				</div>
				<div class="panel-footer">
					<div class="text-right">
						New User - <a href="${context}/signup">Register Here</a>
					</div>
				</div>
			</div>

		</div>
	</div>


</body>
</html>