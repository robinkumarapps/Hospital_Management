<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Bootstrap CSS -->
<spring:url value="/resources/css/bootstrap/bootstrap.min.css" var="css" />
<link href="${css}" rel="stylesheet" />

<spring:url value="/resources/js/bootstrap.min.js" var="js" />
<script src="${js}" type="text/javascript"></script>
<style>
@charset "ISO-8859-1";


*{
	margin:0px;
	padding:0px;
		font-family: 'PT Serif', serif;
}

img {
  width:100vw;
  height:100vh;
  position:relative;
  background-size:cover;
 }
.button {
  background-color: #04AA6D;
  border: none;
   color: white; 

  
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;

  

  border-radius: 12px;
  background-image:linear-gradient(-90deg,#d38312,#a83279);
}
.heading{
	text-align:center;
	font-size:50px;
	padding:20px 20px;
	margin-top:300px;
	
}

#takeAppointment{
	padding:20px 20px;
	font-size: 30px;
	margin-top:20px;
	
	
	
}
.patientbutton{
	text-align:center;
	margin-top:50px;
	font-size: 30px;
	
}
#patientLogin{
	padding:20px 20px;
	font-size: 30px;
	margin-top:20px;
	padding:20px 80px;
	
}
#patientSignUp{
	padding:20px 20px;
	font-size: 30px;
	margin-top:20px;
	padding:20px 80px;
	
	
}
.button:hover{
	font-weight:600;
	border-bottom:1px solid #fff;
	border-left:1px solid #fff;
	border-right:1px solid #fff;
}

.menu-bar{
	background-image:linear-gradient(-90deg,#d38312,#a83279);
	
}
.navbar-brand{
 	color:#fff!important; 

	font-size:25px;
	margin-top:5px;
	margin-left:20px;
}
.nav-link{
	font-size:25px;
	margin:3px;
	 color:#fff!important; 
	
	font-weight:500;
	
}
.navbar-nav{
	
	margin-right:80px;
	
}

.menu-bar .navbar-toggler{
	padding-right:20px;
	outline:none!important;
	border:none!important;
}
.navbar .fa{
	 color:#fff!important; 
	
	font-size:26px;
}
.nav-link:hover{
	font-weight:600;
	border-bottom:1px solid #fff;
}

.content{
	text-align:center;
	margin-top:200px;
	font-weight:16px;
}

@media only screen and (max-width:1000px){
	.nav-link:hover{
	border-bottom:none!important;
	}}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-dark" style="background-image:linear-gradient(90deg,#d38312,#a83279);   margin:5px; padding:3px;height:70px;">
		<div class="container-fluid">
			<a class="navbar-brand" href="/cyberhealth/doctor-index/${id}" style="font-size:1.7vw;">Cyber Health</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" aria-current="page"
						href="/cyberhealth/booking/${id}" style="font-size: 1.5vw;">Get
							Booking</a></li>
					<li class="nav-item"><a class="nav-link"
						href="/cyberhealth/${id}/pending-booking"
						style="font-size: 1.5vw;">Pending Booking</a></li>



					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" id="navbarDropdown"
						role="button" data-bs-toggle="dropdown" aria-expanded="false" style="font-size: 1.5vw;">
							Other </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdown" style="background-image:linear-gradient(-90deg,#d38312,#a83279);">
							<li class="nav-item"><a class="nav-link"
								href="/cyberhealth/${id}/status" style="font-size: 1.5vw; ">Set
									Availability</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/cyberhealth/${id}/search" style="font-size: 1.5vw;">Search
									Patient</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/cyberhealth/${id}/appointment-history"
								style="font-size: 1.5vw;">Booking History</a></li>
							<li class="nav-item"><a class="nav-link"
								href="/cyberhealth/${id}/profile" style="font-size: 1.5vw;">My
									Profile</a></li>
						</ul></li>
					<li class="nav-item"><a
						href="/cyberhealth/${id}/doctor-logout" class="btn btn-danger"
						style="position: absolute; right: 0; margin-top: 4px; margin-right: 10px;">Logout</a></li>

				</ul>
				 <form class="d-flex" action="/cyberhealth/">
        <!-- <button style="position:fixed; right:0;  margin-top:0;" class="btn btn-outline-success" type="submit">Logout</button> -->
        
      </form>
			</div>
		</div>
	</nav>
</body>
</html>