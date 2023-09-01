<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@page import="com.model.Booking"%>
<%@include file="header.jsp" %>
<%@ page import="java.util.List"%>
<%
List<Booking> list = (List<Booking>) request.getAttribute("list");
String message= request.getParameter("msg");
if(message == null)
	message="";
%>
<!DOCTYPE html>
<html>
<head>
<style>
h2, h3, p {
	text-align: center;
}

</style>
<meta charset="ISO-8859-1">
<title>Doctor Bookings</title>
</head>
<body style="  background-image:linear-gradient(40deg,#eacda3,#d6ae7b);color:white; ">
	<h2 style="font-size:50px;">Hello, Dr. ${name}</h2>
	<h3>
		Pending Bookings || <a href="/cyberhealth/booking/${id}" style="color:white;">Scheduled
			Booking</a>
	</h3>
	<br> 
	<%if(message.equals("Appointement Accepted!")){
		%><p style="color:green;"><%=message%></p><% 
	}else if(message.equals("Appointement Rejected!")){
		%><p style="color:red;"><%=message%></p><%
	}%>
	<div class="card-group" style="margin:35px;">
		<%
		if (list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
		%>
		<div class="card text-dark bg-light mb-3" style="max-width: 18rem;">
			<div class="card-header">
				Patient:
				<%=list.get(i).getPatient().getPatientName()%></div>
			<div class="card-body">
				<p class="card-text">
					Patient Id:
					<%=list.get(i).getPatient().getPatientId()%></p>
				<p class="card-text">
					Gender:
					<%=list.get(i).getPatient().getGender()%></p>
				<p class="card-text">
					Appointment Date: <br><%=list.get(i).getAppDate()%><br><%=list.get(i).getAppTime() %></p>
				<p class="card-text">
					DoctorId:
					<%=list.get(i).getPatient().getDoctor().getId()%></p>
				<p class="card-text">
					MobileNo:
					<%=list.get(i).getPatient().getContactNumber()%></p>
				<form action="pending-booking/<%=list.get(i).getPatient().getPatientId()%>" method="post">
					<input type="submit" class="btn btn-success" value="Accept">
				</form>
				<br>
				<form action="pending-booking/<%=list.get(i).getPatient().getPatientId()%>">
					<input type="submit" class="btn btn-secondary" value="Reject">
				</form>
			</div>
		</div>
		<%
		}
		}
		%>
	</div>
</body>
</html>