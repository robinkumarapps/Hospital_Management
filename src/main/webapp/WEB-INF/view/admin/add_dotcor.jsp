<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@include file="base.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<% String[] arr = (String[])request.getAttribute("item"); %>
<!DOCTYPE html>
<html>
<head>
</head>
<body>

	<div class="container mt-3">
		<div class="row">
			<div class="col-md-6 offset-md-3">


				<h1 class="text-center mb-3">Add New Doctor</h1>

				<form action="handle-doc" method="post"
					enctype="multipart/form-data">

					<h3>${invld}</h3>
					<p style="color:red; text-align:center;">${pdfmsg }</p>
					<!-- <div class="form-group">
						<label for="name">Doctor Id</label> <input type="text"
							class="form-control" id="name" aria-describedby="emailHelp"
							name="id" placeholder="Enter the 4 digit doctor Id"
							pattern="[0-9]{4}"
							oninvalid="this.setCustomValidity('Enter 4 digit id..')" required>
					</div> -->

					<div class="form-group">
						<label for="name">Doctor Name</label> <input type="text"
							class="form-control" id="name" aria-describedby="emailHelp"
							name="name" placeholder="Enter the doctor Name"     pattern="[A-Za-z]{3}+"   required >
					</div>

					<div class="form-group">
						<label for="exampleFormControlFile1">Select doctor image..</label>
						<input type="file" name="image" class="form-control-file"
							id="exampleFormControlFile1"
							accept="image/gif, image/jpeg, image/png"  required>
					</div>


					<div class="form-group">
						<label for="name">Doctor Experience</label> <input type="number"
							class="form-control" id="name" aria-describedby="emailHelp"
							name="experience" placeholder="Enter the doctor experience"
							min="0"							
							required>
					</div>

					<div class="form-group">
						<label for="price">Appointment Fee</label> <input type="number"
							placeholder="Enter doctor fee" name="appointmentFee"
							class="form-control" id="price" 	min="0" required>
					</div>
					
					<div class="form-group">
						<label for="speciality">Speciality</label>
					  <select name="speciality" class="form-control">
					    <%for(int i =0; i < arr.length; i++){%>
					   <option value="<%=arr[i]%>"><%=arr[i]%></option>
					   <%} %>
					  </select>
					</div>
					<div class="form-group">
						<label for="password">Password:</label>
						<input type="password" id="pwd" name="password" class="form-control" required>
					</div>

					<div class="form-group">
						<label for="name">Doctor License</label> <input type="text"
							class="form-control" id="name" aria-describedby="emailHelp"
							name="licenseNo" placeholder="Enter the doctor licence" required>
					</div>


				 	<div class="form-group">
						<label for="exampleFormControlFile1">Upload doctor license pdf</label>
						 <input
							type="file" name="pdf" class="form-control-file"
							id="exampleFormControlFile1" accept="application/pdf" required>
					</div>
 


					<div class="form-group">
						<label for="name">Doctor Email</label> <input type="email"
							class="form-control" id="name" aria-describedby="emailHelp"
							name="email" placeholder="Enter the doctor email-id"
							pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
							 required>
					</div>

					<div class="container text-center">

						<a onclick="history.back()"
							class="btn btn-outline-danger">Back</a>


						<button type="submit" class="btn btn-primary">Add</button>

					</div>
				</form>


			</div>
		</div>
	</div>
</body>
</html>