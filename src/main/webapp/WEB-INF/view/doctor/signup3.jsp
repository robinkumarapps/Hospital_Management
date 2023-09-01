<%@include file="../header.jsp" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%String message=(String)request.getParameter("msg");
if(message == null)
	message="";%>
<!DOCTYPE html>
<html>
<head>
<style>
h1, p, h3, form {
	text-align:center;
}
</style>
<script>
	function myFunction() {
		var x = document.getElementById("password");
		if (x.type === "password") {
			x.type = "text";
		}else{
			x.type = "password";
		}
	}
</script>
<meta charset="ISO-8859-1">
<title>Doctor Signup</title>
</head>
<body>
	<h3>Doctor Signup</h3>
	<p style="color:red;">${msg }</p>
	<form:form action="doctor-signup-form" modelAttribute="doc">
	<form:hidden path="id"/>
	Name: <form:input path="name" placeholder="Enter Name"  required="true"/><br>
	<form:errors path="name" style="color:red;"/>
	<br>
	Email: <form:input type="email" path="email" placeholder="Enter Email" required="true"/><br>
	<form:errors path="email" style="color:red;"/>
	<br>
	Experience: <form:input type="number" path="experience" placeholder="Enter Experience" required="true" /><br>
	<form:errors path="experience" style="color:red;"/>
	<br>
	LicenseNumber: <form:input  path="licenseNo" placeholder="Enter licenseNo" required="true"/><br>
	<form:errors path="licenseNo" style="color:red;"/>
	<br>
	Appointment Fee: <form:input path="appointmentFee" placeholder="Enter Your Appointment fee" required="true" /><br>
	<form:errors path="appointmentFee" style="color:red;"/>
	<br>
	Specialist: <form:select path="speciality">
        <form:options items="${item}"/>
    </form:select>
	<br><br>
	Password: <form:password path="password" placeholder="Enter Password" required="true"/><br>
	<form:errors path="password" style="color:red;"/>
	<input type="checkbox" onclick="myFunction()">Show Password <br>
	<input type="submit" value="Submit" />
	<br><br>
	</form:form>
</body>
</html>