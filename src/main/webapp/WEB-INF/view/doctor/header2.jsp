<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">

<style><%@include file="/WEB-INF/resources/css/style.css"%></style> 
<%@include file="base3.jsp"%>

</head>
<body>
<div class="header">
<div class="menu-bar">
<nav class="navbar navbar-expand-lg navbar-light ">
  <a class="navbar-brand" href="/cyberhealth/">CyberHealth</a>
  <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
   <!--  <i class="fa fa-bars"></i> -->
    <span class="navbar-toggler-icon"></span>
  </button>
  <div class="collapse navbar-collapse" id="navbarNav">
   	<ul class="navbar-nav ml-auto">
					<li class="nav-item"><a class="nav-link"
						aria-current="page" href="/cyberhealth/doctor-login" style="font-size:1.5vw;">Login</a></li>
					<li class="nav-item"><a class="nav-link" href="/cyberhealth/doctor-signup" style="font-size:1.5vw;">Signup</a>
					</li>
					<%-- <li class="nav-item"><a class="nav-link" href="/cyberhealth/${id}/status" style="font-size:1.5vw;">Set Availability</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/cyberhealth/${id}/search" style="font-size:1.5vw;">Search Patient</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="/cyberhealth/" style="font-size:1.5vw;">About</a>
					</li>
					<li class="nav-item"><a href="/cyberhealth/${id}/doctor-logout" class="btn btn-danger" style="position:absolute; right:0; margin-top:4px; margin-right:10px;">Logout</a></li>
					 --%><!-- <li class="nav-item dropdown"><a
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
</nav>


</div>
</div>


</body>
</html>





