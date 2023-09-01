<%@page import="com.model.Patient"%>
<%@page import="java.util.List"%>
<%@include file="header.jsp" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
	List<Patient> list = (List<Patient>)request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<style>
h1, h2, p, h3, form {
	text-align: center;
}

* {
	margin: 0;
	padding: 0
}

.card {
	width: 350px;
	background-image:linear-gradient(40deg,#eacda3,#d6ae7b);
	border: none;
	cursor: pointer;
	transition: all 0.5s
}

.name {
	font-size: 22px;
	font-weight: bold
}

.idd {
	font-size: 14px;
	font-weight: 600
}

.number {
	font-size: 22px;
	font-weight: bold
}

.text span {
	font-size: 13px;
	color: #545454;
	font-weight: 500
}

.container {
	heigth: 200px;
}
</style>
<meta charset="ISO-8859-1">
<title>Search</title>
<link rel="icon" type="image/ico" href="${img}">
</head>
<body>
	<h3>Hello, Dr. ${doc.name}</h3>
	<h2>You can search from here</h2>
	<div class="container mt-4 mb-4 p-3 d-flex justify-content-center">
		<div class="card p-4">
			<form action="search" method="post">
				SearchByName:<br><input type="text" name="search" required placeholder="Enter name"/><br>
				<br><input type="submit" class="btn btn-secondary" value="Search">
			</form>
		</div>
	</div>
	
	
	<div class="card-group" style="margin:35px;">
		<%
		if (list != null && list.size() > 0) {
			for (int i = 0; i < list.size(); i++) {
		%>
		<div class="card text-dark bg-light mb-3" style="max-width: 18rem;" id="zoom" >
			<div class="card-header">
				Patient:
				<%=list.get(i).getPatientName()%></div>
			<div class="card-body">
				<p class="card-text">
					Patient Id:
					<%=list.get(i).getPatientId()%></p>
				<p class="card-text">
					Gender:
					<%=list.get(i).getGender()%></p>
				<p class="card-text">
					Appointment date:<%=list.get(i).getBooking().getAppDate()%><br><%=list.get(i).getBooking().getAppTime()%></p>
				<p class="card-text">
					DoctorId:
					<%=list.get(i).getDoctor().getId()%></p>
				<p class="card-text">
					MobileNo:
					<%=list.get(i).getContactNumber()%></p>
					<form action="/cyberhealth/booking/${id}/<%=list.get(i).getPatientId() %>/prescription">
					<input type="submit" class="btn btn-success" value="View/Add Prescription">
				</form>
				<br>
				<form action="/cyberhealth/booking/${id}/<%=list.get(i).getPatientId()%>/checkup">
					<input type="submit" class="btn btn-success" value="View/Add Report">
				</form>
			</div>
		</div>
		<%
		}
		}else{%>
			<h4 style="text-align:center;">Nothing to show here</h4>
		<%}
		%>
	</div>
</body>
</html>