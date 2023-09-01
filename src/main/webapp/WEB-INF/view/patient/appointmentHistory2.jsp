<%@page import="com.service.doctor.ServiceDoctorImp"%>
<%@page import="com.service.doctor.ServiceDoctor"%>
<%@page import="org.springframework.beans.factory.annotation.Autowired"%>
<%@page import="com.model.Doctor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./base.jsp"%>
<style>
.container{
height:26rem;
border-radius:12px;
 background-image:linear-gradient(40deg,#eacda3,#d6ae7b);
 margin-top:60px;
}
h1{
color:white; text-align:center;
}
#col{
color:white;
}
th{
width:20rem;
font-size:30px;}

td{
font-size:20px;
}

</style>
</head>
<body>
	<div class="container">
	<h1>Booking History</h1>
	<div align="center" id="col">

		<table border="3" padding="5">

			<tr>
				<th>Booking Date</th>
				<th>Booking Slot</th>
				<th>Doctor</th>
				<th>Status</th>
			</tr>

			<c:forEach items="${list}" var="booking">
				<tr>
					<td>${booking.appDate}</td>
					<td>${booking.appTime}</td>
					<td><a href="/cyberhealth/${docId}/profile1">View Doctor</a></td>
					<td>${booking.bookingStatus}</td>
				</tr>
			</c:forEach>
		</table>
		<button onClick="history.back()">
					Back<i class="far fa-hand-point-right"></i>
				</button>
	</div>
	</div>
</body>
</html>