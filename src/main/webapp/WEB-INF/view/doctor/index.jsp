<%@include file="header.jsp"%>
<%
int num = (int) request.getAttribute("pending");
System.out.println(num);
%>
<html>
<head>
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
	border:2px solid #dd5e89;
	
}
.btn{
font-size:30px;
background-image:linear-gradient(90deg,#de6262 ,#ffb88c);
border:2px solid #dd5e89;
}


</style>
<meta charset="ISO-8859-1">
<title>HomePage</title>
</head>
<body>
	<h1>Hello, Dr. ${name}</h1>
	<br>
	<%
	if (num > 0) {
	%>
	<div class="alert alert-warning alert-dismissible fade show"
		role="alert" style="text-align:center; width:450px;  margin: auto;">
		<a href="/cyberhealth/${id}/pending-booking">
		<strong>You have <%=num%> pending bookings.</strong>
		</a>
		
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>
	<%
	}
	%>
	
	<%-- <h3>Your Pending Bookings: ${num}</h3> --%>
	<div class="container">
		<div class="row">
		<div class="col-md-4 mt-4">
				<div class="card" style="width: 22rem;">
					<div class="yes"></div>


					<i class="fas fa-user-md text-primary" style="font-size: 100px;"></i>
					<div class="card-body ">

						<h5 class="card-title">Get Booking</h5>
						<p class="card-text"></p>
						<a href="/cyberhealth/booking/${id}" class="btn btn-primary" >View</a>

					</div>
				</div>

			</div>
			<div class="col-md-4 mt-4">
				<div class="card" style="width: 22rem;">
					<div class="yes"></div>

					<i class="fas fa-user-md  text-primary" style="font-size: 100px;"></i>


					<div class="card-body ">

						<h5 class="card-title">Pending Booking</h5>
						<p class="card-text"></p>
						<a href="/cyberhealth/${id}/pending-booking" class="btn btn-primary">Pending</a>
					</div>
				</div>

			</div>
			<div class="col-md-4 mt-4">
				<div class="card" style="width: 22rem;">
					<div class="no"></div>

					<i class="fas fa-user-md text-primary" style="font-size: 100px;"></i>
					<div class="card-body ">

						<h5 class="card-title">Set Availability</h5>
						<p class="card-text"></p>
						<a href="/cyberhealth/${id}/status" class="btn btn-primary"> Set Availability</a>
					</div>
				</div>

			</div>
		
		</div>
		
		<!-- 00000000000 -->
		<div class="row">
		<div class="col-md-6 mt-4">
				<div class="card" style="width: 30rem;">
					<div class="no"></div>

					<i class="fas fa-user-md text-primary" style="font-size: 100px;"></i>
					<div class="card-body ">

						<h5 class="card-title">Search Patient</h5>
						<p class="card-text"></p>
						<a href="/cyberhealth/${id}/search" class="btn btn-primary">Search Patient</a>
					</div>
				</div>

			</div>
			<div class="col-md-6 mt-4">
				<div class="card" style="width: 30rem;">
					<div class="yes"></div>

					<i class="fas fa-user-md text-primary" style="font-size: 100px;"></i>
					<div class="card-body ">

						<h5 class="card-title">My Profile</h5>
						<p class="card-text"></p>
						<a href="/cyberhealth/${id}/profile" class="btn btn-primary">Profile</a>
					</div>
				</div>

			</div>
		
		
		
		
		</div>
			
			

		
	</div>

</body>
</html>