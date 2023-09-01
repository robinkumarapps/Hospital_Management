<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="ISO-8859-1">


<!-- Bootstrap CSS -->
<spring:url value="/resources/css/bootstrap/bootstrap.min.css" var="css" />
<link href="${css}" rel="stylesheet" />
<spring:url value="/resources/images/background.jpg" var="img" />
<spring:url value="/resources/js/bootstrap.min.js" var="js" />
<script src="${js}" type="text/javascript"></script>

</head>
<body>
<div class="header">
<div class="menu-bar">
	<nav class="navbar navbar-expand-lg navbar-light " >
		<div class="container-fluid">
			<a class="navbar-brand" href="/cyberhealth/"><h4>Cyber Health</h4></a>
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
					<!-- <li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Dropdown link
					</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="#">Action</a></li>
							<li><a class="dropdown-item" href="#">Another action</a></li>
							<li><a class="dropdown-item" href="#">Something else
									here</a></li>
						</ul></li> -->
				</ul>
			</div>
		</div>
	</nav>
	</div>
	</div>

</body>
</html>