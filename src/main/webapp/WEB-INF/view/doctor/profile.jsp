<%@page import="com.model.Doctor"%>
<%@include file="header.jsp"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<% 
	Doctor d = (Doctor)request.getAttribute("doc"); 
	%>
<!DOCTYPE html>
<html>
<head>
<style>
h1, p, h3, form {
	text-align: center;
}

* {
    margin: 0;
    padding: 0;
}

.card {
    width: 350px;
   background-image:linear-gradient(40deg,#eacda3,#d6ae7b);
    border: none;
    cursor: pointer;
    transition: all 0.5s;
    color:#fff;
}
#license{
 font-size: 30px;
    font-weight: bold;
    color:white;

}

/* .image img {
    transition: all 0.5s
} */

.card:hover .image img {
    transform: scale(1.5);
    
}	
.card{
width:70rem;

}

.name {
    font-size: 40px;
    font-weight: bold;
}

.idd {
    font-size: 40px;
    font-weight: 600;
}


.number {
    font-size:40px;
    font-weight: bold;
}

.text span {
    font-size: 20px;
    color: #545454;
    font-weight: 500;
  
}

</style>
<script>
	function myFunction() {
		var x = document.getElementById("password");
		if (x.type === "password") {
			x.type = "text";
		} else {
			x.type = "password";
		}
	}
	document.getElementById("Myid").style.display = "none";
	function toggleForm(){
	  var x = document.getElementById("Myid");
	  if (x.style.display === "none") {
	    x.style.display = "block";
	  } else {
	    x.style.display = "none";
	  }
	}
</script>
<meta charset="ISO-8859-1">
<title>Doctor Profile</title>
</head>
<body>
	<h3 style="font-size:50px;">Your Profile</h3>
	<div class="container mt-4 mb-4 p-3 d-flex justify-content-center">
    <div class="card p-4">
        <div class=" image d-flex flex-column justify-content-center align-items-center"> 
       <%-- <img src="<%=img%>" height="100" width="100" /> --%>
        <span class="name mt-3">Dr.${doc.name}</span> <span class="idd">DoctorId: ${doc.id }</span>
            <div class="d-flex flex-row justify-content-center align-items-center mt-3" id="license"><%=d.getPatient().size()%> Patients</div>
            <div class="text mt-3"> <span>Dr. <%=d.getName() %> is a <%=d.getSpeciality() %> specialist having an experience of <%=d.getExperience() %> years.<br><br></span><span id="license">LicenseId: <%=d.getLicenseNo()%></span></div>
            <br><br><br><br><br><br><!-- <button style="position:relative;" class="btn btn-outline-success" onClick="toggleForm()">Change Password</button> -->
        </div>
    </div>
</div>
<%-- <form action="addprescription" method="post" style="margin:35px;" id="Myid">
    <div class="mb-3 row">
		<label class="col-sm-2 col-form-label">Old Password: </label>
		<div class="col-sm-5">
			<input type="text" class="form-control-plaintext"
				id="" value="">
		</div>
	</div>
	
	<div class="mb-3 row">
		<label class="col-sm-2 col-form-label">New Password: </label>
		<div class="col-sm-5">
			<input type="text" class="form-control-plaintext"
				id="" value="">
		</div>
	</div>
</form> --%>
</body>
</html>