<%@page import="com.model.Booking"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@include file="header.jsp" %>
<%@ page import="java.util.List"%>
<%
List<Booking> list = (List<Booking>)request.getAttribute("list");
%>
<spring:url value="/resources/images" var="img" />
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<style>
h2, h3, p {
	text-align: center;
}
#NOLINE {
            text-decoration: none;
        }
        
#zoom {
  transition: transform .2s;
}

#zoom:hover {
  transform: scale(1.2); 
}
#container{
background-image:linear-gradient(40deg,#eacda3,#d6ae7b);
color:white;

}

</style>
<meta charset="ISO-8859-1">
<title>All Booking</title>
<link rel="icon" type="image/ico" href="${img}">
</head>
<body id="container">
	<br>
	<div >
	<h2>Hello, Dr. ${name}</h2>
	<br>
	<h2 >
		Scheduled Appointments || <a
			href="/cyberhealth/${id}/pending-booking" style="color:white;">Pending Booking</a>
	</h2>
	<h5 style="text-align:center; color:red;">${msg}</h5>
	<div class="card-group" style="margin:35px;">
		<%
		if (list != null) {
			for (int i = 0; i < list.size(); i++) {
		%>
		<div class="card text-dark bg-light mb-3" style="max-width: 18rem;" id="zoom" >
			<div class="card-header">
				Patient:
				<%=list.get(i).getPatient().getPatientName()%> <a href="/cyberhealth/booking/${id}/delete/<%=list.get(i).getPatient().getPatientId()%>"><i class="fas fa-trash text-danger" style="text-align:right;"></i></a></div>
			<div class="card-body">
				<p class="card-text">
					Patient Id:
					<%=list.get(i).getPatient().getPatientId()%></p>
				<p class="card-text">
					Gender:
					<%=list.get(i).getPatient().getGender()%></p>
				<p class="card-text">
					Appointment date:<%=list.get(i).getAppDate()%><br><%=list.get(i).getAppTime() %></p>
				<p class="card-text">
					DoctorId:
					<%=list.get(i).getPatient().getDoctor().getId()%></p>
				<p class="card-text">
					MobileNo:
					<%=list.get(i).getPatient().getContactNumber()%></p>
					<form action="/cyberhealth/booking/${id}/<%=list.get(i).getPatient().getPatientId() %>/prescription">
					<input type="submit" class="btn btn-success" value="View/Add Prescription">
				</form>
				<br>
				<form action="/cyberhealth/booking/${id}/<%=list.get(i).getPatient().getPatientId()%>/checkup">
					<input type="submit" class="btn btn-success" value="View/Add Report">
				</form>
			</div>
		</div>
		<%
		}
		}
		%>
	</div>
	
	
	</div>

	
</body>
</html>