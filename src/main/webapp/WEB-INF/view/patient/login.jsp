<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./base.jsp"%>

<style>
#loginform {
	margin-top: 80px;
}

h1 {
	color: brown;
}

.container {
	height: 25rem;
	margin-right: 900px;
	 background-image:linear-gradient(40deg,#eacda3,#d6ae7b);
	 color:white;
}

.finalLogin {
	border: none;
	color: white;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 20px;
	padding: 10px 20px;
	background-image: linear-gradient(-90deg, #d38312, #a83279);
}
</style>
</head>
<body class="h-100" style="background-image: url('https://www.elsevier.com/__data/assets/image/0007/278197/banner-Precision-medicine-the-new-rd-paradigm-img-940x400.jpg'); background-size: cover;">
	<%@include file="./navbar1.jsp"%>
	<p style="text-align:center; color:red;">${msg}</p>
	<div
		class="form-group row h-100 justify-content-center align-items-center">
		<label for="inputEmail3" class="col-sm-3 col-form-label"></label>
		<div class="col-8 col-md-8 col-lg-6">
		<div class="container">
			<form action="patient-login-form" method="post">
				
					<div class="form-group" id="loginform">
						<h1 class=" font-weight-bold">Login</h1>
						Email address: <input type="email" name="email"
							class="form-control" required placeholder="Enter email here" />
					</div>
					<small>We'll never share your email with anyone else.</small>
					<div class="form-group">
						Password: <input type="password" id="password" name="password"
							required class="form-control" placeholder="Enter password here" />
					</div>
					<br>
					<button type="submit" class="finalLogin">Login</button>
				</form>
				<div class="form-group">
				<label for="patient-signup">New User?</label> <a href="patient-signup"
					style="color: brown;">Sign Up</a>
			</div>
				</div>
		</div>
	</div>
</body>
</html>