<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<style>
#signupForm {
	margin-top: 80px;
}

h1 {
	color: brown;
}

.container {
	height: 47rem;
	margin-right: 900px;
	background-image:linear-gradient(40deg,#eacda3,#d6ae7b);
	 color:white;
}

.finalSignUp {
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
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>

</head>
<body style="background-image: url('https://www.elsevier.com/__data/assets/image/0007/278197/banner-Precision-medicine-the-new-rd-paradigm-img-940x400.jpg'); background-size: cover;">
	<%@include file="./navbar1.jsp"%>
	<h3 style="text-align:center; color:red;">${msg}</h3>
	<div class="container">
	<form:form action="patient-signup-form" modelAttribute="patient">
			<div class="form-group" id="signupForm">
				<!--same jesa entity file mei h  -->
				<h1>Sign Up</h1>
				<div class="form-group col-md-6">
					<form:label path="patientName">Name:</form:label>
					<form:input path="patientName" cssClass="form-control"
						placeholder="Enter name" required="true" />
					<font color="red"> <form:errors path="patientName"></form:errors></font><br />
				</div>

				<div class="form-group col-md-6">
					<form:label path="gender">Gender:</form:label>
					<form:select path="gender" cssClass="form-control">
						<form:option value="M" />
						<form:option value="F" />
					</form:select>
				</div>

				<div class="form-group col-md-6">
					<form:label path="email">Email</form:label>
					<form:input path="email" type="email" cssClass="form-control"
						id="loginEmail" placeholder='Enter email' required="required" />
					<font color="red"> <form:errors path="email"></form:errors></font>
					<small id="emailHelp" class="form-text text-muted">We'll
						never share your email with anyone else.</small>
				</div>

				<div class="form-group col-md-6">
					<form:label path="contactNumber">mobileNumber</form:label>
					<form:input path="contactNumber" cssClass="form-control"
						id="loginEmail" placeholder='Enter mobileno' required="required" />
					<font color="red"> <form:errors path="contactNumber"></form:errors></font><br />
				</div>

				<div class="form-group col-md-6">
					<form:label path="password">Password</form:label>
					<form:input path="password" type="password" cssClass="form-control"
						id="loginEmail" placeholder='Enter password' required="required" />
					<font color="red"> <form:errors path="password"></form:errors></font><br />
				</div>
				
				<button type="submit" class="finalSignUp">Register</button>
			</div>
	</form:form>
	<div class="form-group p-3" style="margin-left: 80px;">
		<label for="login">Already register?</label> <a href="patient-login">Login</a>
	</div>
	</div>
</body>
</html>