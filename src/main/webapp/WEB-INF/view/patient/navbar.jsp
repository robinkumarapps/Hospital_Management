<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<style><%@include file="/WEB-INF/resources/css/style.css"%></style> 
<%@include file="base.jsp"%>
</head>
<body>
<div class="header">
<div class="menu-bar">
<nav class="navbar navbar-expand-lg navbar-dark" style="background-image:linear-gradient(90deg,#d38312,#a83279);
	 color:white;">
  <a class="navbar-brand" href="/cyberhealth/patient-homepage">CyberHealth</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
   <!--  <i class="fa fa-bars"></i> -->
    <span class="navbar-toggler-icon"></span>
  </button>
  <div id="navbarNav">
    <ul class="navbar-nav ml-auto ">
      <li class="nav-item active">
        <a class="nav-link" href="/cyberhealth/${patient.patientId}/viewAppointment">View Appointment</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="/cyberhealth/${patient.patientId}/bookAppointment">Book Appointment</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="/cyberhealth/${patient.patientId}/checkup">CheckUp Report</a>
      </li>
      
       <li class="nav-item active">
        <a class="nav-link" href="/cyberhealth/${patient.patientId}/prescription">Prescription</a>
      </li>
      
      
       <li class="nav-item active">
        <a class="nav-link" href="/cyberhealth/${patient.patientId}/searchp">Search</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="/cyberhealth/${patient.patientId}/booking-history">History</a>
      </li>
      
      <li class="nav-item"><a href="/cyberhealth/${patient.patientId}/patient-logout" class="btn btn-danger" style="position:absolute; right:0; margin-top:4px; margin-right:10px;">Logout</a></li>
					
      <!-- <li class="nav-item">
        <a class="nav-link" href="#">Doctor</a>
      </li>
       <li class="nav-item">
        <a class="nav-link" href="patientdashboard">Patient</a>
      </li>
      <li class="nav-item">
        <a class="nav-link" href="#">Help</a>
      </li>
         <li class="nav-item active ml-auto">
        <a class="nav-link" href="addDoctor">adddoctor</a>
      </li>
      <li class="nav-item active">
        <a class="nav-link" href="logout">Logout</a>
      </li> -->
    </ul>
  </div>
</nav>


</div>
</div>


</body>
</html>