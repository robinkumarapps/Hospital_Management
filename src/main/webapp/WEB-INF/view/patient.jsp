<%@page import="java.time.LocalDate"%>
<%@include file="header.jsp" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
	String date = LocalDate.now().plusDays(1).toString();
%>
<!DOCTYPE html>
<html>
<head>
<style>
h1, p, h3, form {
	text-align:center;
}
</style>
<meta charset="ISO-8859-1">
<title>Add Patient</title>
</head>
<body>
	<h3>Add Patient</h3>
	<p style="color:red;">${msg}</p>
	<div style="text-align:center;"> 
	<form:form action="add-patient-form" modelAttribute="patient" >
	<form:hidden path="patientId"/>
	<br><br>
	Name: <form:input path="patientName" placeholder="Enter Name"  required="true" /><br>
	<form:errors path="patientName" style="color:red;"/>
	<br>
	Appointment Date: <form:input type="date" name="aDate" path="" min="<%=date %>" required="true"/><br>
	<br>
	Appointment Time: <form:input type="time"  path="" name="timeOfAppoint" min="09:00" max="18:00"  required="required" />
	<br><br>
	Gender: <form:select path="gender">
		<form:option value="M" />
		<form:option value="F" />
	</form:select>
	<br><br>
	Contact Number: <form:input  path="contactNumber" placeholder="Enter contact number"  required="true"/><br>
	<form:errors path="contactNumber" style="color:red;"/>
	<br>
	DoctorId: <form:input path="" name="doctorId" required="true" />
	<br><br>
	<input type="submit" class="btn btn-success" value="Submit" />
	<br><br>
	<br>
	<form:hidden path="email" value="email@email.com" /><br>
	<br>
	</form:form>
	</div>
</body>
</html>