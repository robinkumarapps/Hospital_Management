<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@include file="base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Patient</title>
</head>
<body>
	<h3 style="text-align: center; color: red;">${msg}</h3>
	<div class="container">
		<form:form action="/cyberhealth/patient-signup-form"
			modelAttribute="patient" class="justify-content-center">
			<div class="form-group" id="signupForm">
				<!--same jesa entity file mei h  -->
				<h1>Add Patient</h1>
				<div class="form-group col-md-6 justify-content-center">
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
				
				
				<a onclick="history.back()" class="btn btn-outline-danger">Back</a>
				<button type="submit" class="finalSignUp">Add Patient</button>
				
				
				<form:input type="hidden" path="" cssClass="form-control" id="main"
					name="main" value="1" required="required" />
			</div>
		</form:form>
	</div>
</body>
</html>