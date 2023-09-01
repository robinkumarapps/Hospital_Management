<%@page import="com.model.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="java.time.LocalDate"%>
<%@include file="navbar.jsp"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%
String date = LocalDate.now().plusDays(1).toString();
List<Doctor> list = (List<Doctor>) request.getAttribute("doc");
String s = "";
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./base.jsp"%>
<style>
.headerbook {
	margin-top: 40px;
	background-image: linear-gradient(90deg, #de6262, #ffb88c);
	font-size: 16px;
	text-align: center;
	height: 50px;
	width: 500px;
	margin-left: 400px;
}

.container {
	height: 26rem;
	border-radius: 12px;
	background-image: linear-gradient(40deg, #eacda3, #d6ae7b);
}
</style>
<title>Book Appointment</title>
</head>
<body>
	<p style="text-align: center; color: red">${msg}</p>
	<h4 style="text-align: center; font-size: 40px;">One Patient One
		Booking</h4>
	<div class="container">
		<form:form action="bookAppointment-form" method="post"
			modelAttribute="booking"
			style="width:300px; margin:auto; color:white;font-size:20px;">
			<h4 style="color: white; text-align: center; width: 400px;">Book
				Appointment Details</h4>
			<br>
			<div class="form-group">
				<form:label path="">Choose Date:</form:label>
				<form:input type="date" path="" name="apDate" min="<%=date%>"
					required="true" />
				<br />
			</div>

			<div class="form-group">
				<form:label path="appTime" name="appTime">Choose Time:</form:label>


				<form:select path="appTime" name="appTime" class="custom-select"
					required="true">
					<form:option selected="selected" value="" />
					<form:option value="09:00" label="Morning(9-10AM)" />
					<form:option value="04:00" label="Evening(4-6PM)" />
					<form:option value="12:00" label="Afternoon(12-2PM)" />
				</form:select>
			</div>
			<div class="form-group">
				<form:label path="" name="doctor">Doctor</form:label>
				<form:select path="" name="doctor" class="custom-select"
					required="true">
					<form:option selected="selected" value="" />
					<%
					for (int i = 0; i < list.size(); i++) {
						s = "Dr. " + list.get(i).getName() + "(Speciality: " + list.get(i).getSpeciality() + ", " + "Fees: "
						+ Integer.toString(list.get(i).getAppointmentFee()) + ", " + "Experience: "
						+ Byte.toString(list.get(i).getExperience()) + ")";
					%>
					<form:option value="<%=list.get(i).getId()%>" label="<%=s%>" />
					<%
					}
					%>
				</form:select>
				<br />
			</div>
			<input type="submit" value="Book"
				style="font-size: 30px; padding: 2px; background-image: linear-gradient(90deg, #de6262, #ffb88c); border: 2px solid #dd5e89; color: white; width: 10rem;">
		</form:form>
	</div>

</body>
</html>