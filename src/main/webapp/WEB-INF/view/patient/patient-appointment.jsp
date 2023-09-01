<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<%@include file="./base.jsp"%>
<style>
h1, h2, h3, p {
	text-align: center;
}
.card {
	padding: 1.5em .5em .5em;
	border-radius: 2em;
	text-align: center;
	box-shadow: 0 5px 10px rgba(0, 0, 0, 0.2);
	height:15rem;
	margin-left:5px;
	
	
}
.btn{
font-size:30px;
background-image:linear-gradient(90deg,#de6262 ,#ffb88c);
border:2px solid #dd5e89;
}


</style>
</head>
<body>
	<%@include file="navbar.jsp"%>
	<h3 style="text-align:center;">Welcome, Dear ${patient.patientName}</h3>
	<p style="align-text:center;">${msg}</p>
	<div class="row ml-5">
		<!-- <div class="col-md-4">
			<div class="card" id="profile">
				<div class="card-body"
					style="background-image: linear-gradient(90deg, #c79081, #dfa579); width: 200px;">
					<h5 class="card-title">Patient</h5>
					<h2></h2>
					<a href="#"><h5 class="card-title">Dashboard</h5></a> <a
						href="appointment"><h5 class="card-title">Appointment</h5></a> <a
						href="discharge"><h5 class="card-title">Dishcharge</h5></a>
				</div>
			</div>

		</div> -->
		<div class="container">
		<div class="row">
		<div class="col-md-4 mt-4">
				<div class="card" style="width: 22rem; border: 2px solid #dd5e89;">
					<div class="yes"></div>

					<i class="far fa-calendar-times text-primary" style="font-size: 70px;"></i>
					<div class="card-body">
					<h5>Book Appointment</h5>
					<p class="card-text"></p>
					 <a
						href="/cyberhealth/${patient.patientId}/bookAppointment" class="btn btn-primary">Book Appointment</a>
				</div>
				</div>

			</div>
			<div class="col-md-4 mt-4">
				<div class="card" style="width: 22rem; border: 2px solid #dd5e89;">
					<div class="yes"></div>

					<i class="fas fa-file-prescription text-primary" style="font-size: 70px;"></i>
					<div class="card-body">
					<h5>View Prescription</h5>
					<p class="card-text"></p>
					 <a
		href="/cyberhealth/${patient.patientId}/prescription" class="btn btn-primary">View Prescription</a>
				</div>
				</div>

			</div>
			<div class="col-md-4 mt-4">
				<div class="card" style="width: 22rem; border: 2px solid #dd5e89;">
					<div class="yes"></div>

					<i class="fas fa-calendar-alt text-primary" style="font-size: 70px;"></i>
					<div class="card-body">
					<h5>View Apointment</h5>
					<p class="card-text"></p>
					 <a
						href="/cyberhealth/${patient.patientId}/viewAppointment" class="btn btn-primary">View Apointment</a>
				</div>
				</div>

			</div>
		
		</div>
		
		<!-- 00000000000 -->
		<div class="row">
		<div class="col-md-6 mt-4">
				<div class="card" style="width: 30rem; border: 2px solid #dd5e89;">
					<div class="yes"></div>

					<i class="fas fa-file-medical text-primary" style="font-size: 70px;"></i>
					<div class="card-body">
					<h5>View Checkup Report</h5>
					<p class="card-text"></p>
					 <a
						href="/cyberhealth/${patient.patientId}/checkup" class="btn btn-primary">View Checkup Report</a>
				</div>
				</div>

			</div>
			<div class="col-md-6 mt-4">
				<div class="card" style="width: 30rem; border: 2px solid #dd5e89;">
					<div class="yes"></div>

					<i class="fas fa-history text-primary" style="font-size: 70px;"></i>
					<div class="card-body">
					<h5>View Booking History</h5>
					<p class="card-text"></p>
					 <a
						href="/cyberhealth/${patient.patientId}/booking-history" class="btn btn-primary">View Booking History</a>
				</div>
				</div>

			</div>
		
		
		
		
		</div>
			
			

		
	</div>

</body>
</html>