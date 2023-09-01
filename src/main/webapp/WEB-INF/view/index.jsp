<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<style>
h1, p {
	text-align: center;
}

.button{
background-image:linear-gradient(-90deg,#d38312,#a83279);
padding:5px;
border-radius:12px;


}

h2 {
  animation: color-change 1s infinite;
}

@keyframes color-change {
  0% { color: red; }
  50% { color: white; }
  100% { color: red; }
}
</style>
<meta charset="ISO-8859-1">
<title>HomePage</title>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
<style><%@include file="/WEB-INF/resources/css/style.css"%></style> 

<link refl="stylesheet" href="https://cdn.jsdelivr.net/npm/@fortawesome/fontawesome-free@5.15.4/css/fontawesome.min.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=PT+Serif:ital@1&display=swap" rel="stylesheet">
</head>
<body>
<div class="header">
<div class="menu-bar">
	<nav class="navbar navbar-expand-lg navbar-light " >
		<div class="container-fluid">
			<a class="navbar-brand" href="/cyberhealth/">Cyber Health</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" 
				aria-controls="navbarNav" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav ml-auto">
					<li class="nav-item active"><a class="nav-link" href="/cyberhealth/login"><b>Admin</b></a></li>
					<li class="nav-item"><a class="nav-link" href="/cyberhealth/doctor-login"><b>Doctor</b></a>
					<li class="nav-item"><a class="nav-link" href="/cyberhealth/patient-login"><b>Patient</b></a>
					</li>
								</ul>
			</div>
		</div>
	</nav>
	</div>
	</div>
		<div class="card bg-dark text-white">
  <img src="<c:url value="/resources/images/medicine.jpg"/>" style="filter: blur(5px);
  -webkit-filter: blur(5px);" class="card-img" alt="patient image">
  <div class="card-img-overlay">
  
  <div class="heading" >
  <h2>You'll Love the way We care for you</h2>
 <h5>Emergency?</h5>
 <h2>1234-56789</h2>
 <!-- <button class="button"  ><a href="contactAdmin"style="color:  white;">contact us</a></button>
   --></div>
 
  </div>
</div>
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>