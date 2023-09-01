<%@include file="header2.jsp"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
String message = (String) request.getParameter("msg");
if (message == null)
	message = "";
%>
<!DOCTYPE html>
<html>
<head>
<style>
h1, p, h3, form {
	text-align: center;
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
</script>
<meta charset="ISO-8859-1">
<title>Doctor Signup</title>
</head>
<body>
	<p style="font-size:50px;margin-left:10px;">SignUp</p>
	<p style="color: red;">${msg }</p>
	
	<div class="container mt-3">
		<div class="row" >
			<div class="col-md-6 offset-md-3" style="text-align:center; border:2px solid #dd5e89; padding:25px; border-radius:5px;background-image:linear-gradient(40deg,#eacda3,#d6ae7b);">
				<form:form action="doctor-signup-form" modelAttribute="doc" enctype="multipart/form-data">
					<form:hidden path="id" />
					<div class="form-group">
						<label for="name"><h5>Doctor Name:</h5></label>
						<form:input path="name" placeholder="Enter Name" 
						class="form-control" required="true" />
					<form:errors path="name" style="color:red;" />
					</div>
					<br>
					<div class="form-group">
						<label for="email"><h5>Email:</h5></label>
						<form:input type="email" class="form-control" path="email" placeholder="Enter Email"
						required="true" />
					<form:errors path="email" style="color:red;" />
					</div>
					<br>
						<div class="form-group">
						<label for="experience"><h5>Experience:</h5></label>
						<form:input type="number" class="form-control" path="experience"
						placeholder="Enter Experience" min="1" value="1" required="true" />
					<form:errors path="experience" style="color:red;" />
					</div>
					<br>
					<div class="form-group">
						<label for="exampleFormControlFile1"><h5>Choose Your Profile Pic:</h5></label>
						<br>
						<input type="file" name="image" class="form-control"
							id="exampleFormControlFile1"
							accept="image/gif, image/jpeg, image/png"  required>
					</div>
					<br>
						<div class="form-group">
						<label for="licenseNo"><h5>LicenseNo:</h5></label>
						<form:input path="licenseNo"
						class="form-control" placeholder="Enter licenseNo" required="true" />
					<form:errors path="licenseNo" style="color:red;" />
					</div>
					<br>
					<div class="form-group">
						<label for="exampleFormControlFile1"><h5>Upload your license PDF</h5></label>
						 <input
							type="file" name="pdf" class="form-control"
							id="exampleFormControlFile1" accept="application/pdf" required>
					</div>
					<br>
						<div class="form-group">
						<label for="appointmentFee"><h5>Appointment Fee:</h5></label>
						<form:input path="appointmentFee"
						class="form-control" placeholder="Enter Your Appointment fee" required="true" />
					<form:errors path="appointmentFee" style="color:red;" />
					</div>
					<br>
					<div class="form-group">
						<label for="speciality"><h5>Specialist:</h5></label><form:select path="speciality" class="form-control">
						<form:options items="${item}" />
					</form:select>
				</div>
				<br>
				<div class="form-group">
						<label for="password"><h5>Password</h5></label>
						<form:password path="password" placeholder="Enter Password"
						required="true" class="form-control"/>
					<form:errors path="password" style="color:red;" />
					</div>
					<br>
					<input type="checkbox" onclick="myFunction()"><h5>Show Password</h5><br>
					<input type="submit" class="btn btn-success" value="Submit" style="background-image:linear-gradient(90deg,#de6262 ,#ffb88c)"/>
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>