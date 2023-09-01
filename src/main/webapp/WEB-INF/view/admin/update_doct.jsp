<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@include file="./base.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<script>
function editName() {
  document.getElementById("name").readOnly = false;
}
</script>
</head>
<body>

	<div class="container mt-3">
	
		<div class="row">
			<div class="col-md-6 offset-md-3"> 

				<h1 class="text-center mb-3">Update Doctor</h1>

				<form action="${pageContext.request.contextPath }/update-doctor"
					method="post" enctype="multipart/form-data">


					<%-- <div class="alert alert-secondary" role="alert" style="height: 54px;">
						<h5>Doctor ID:${doctor.id }</h5>
					</div> --%>
					
					<div class="form-group">
						<label for="name">Doctor Name<i class="fas fa-pen-nib text-success" onclick="editName()"></i></label> <input type="text"
							class="form-control" id="name" aria-describedby="emailHelp"
							name="name" placeholder="Enter the doctor Name"
							value="${doctor.name}" readonly>
					</div>
					
					
					
					
					<div class="form-group">
						<label for="exampleFormControlFile1">Select doctor image..</label>
						<input type="file" name="image" class="form-control-file"
							id="exampleFormControlFile1"
							accept="image/gif, image/jpeg, image/png"    >
					</div>
					

					<div class="form-group">

						<label for="name">Doctor Experience</label> <input type="text"
							class="form-control" id="name" aria-describedby="emailHelp"
							name="experience" placeholder="Enter the doctor Name"
							value="${doctor.experience }">

					</div>



					<div class="form-group">
						<label for="speciality">Speciality</label>
						<input type="text" name="speciality" class="form-control" value="${doctor.speciality}" readonly/>
					</div>
					<div class="form-group">
						Password:
						<input type="password" id="pwd" name="password" class="form-control" 	value="${doctor.password}" />
					</div>

					<div class="form-group">
						<label for="name">Doctor License</label> <input type="text"
							class="form-control" id="name" aria-describedby="emailHelp"
							name="licenseNo" value="${doctor.licenseNo }" readonly>
					</div>
					
					<div class="form-group">

						<label for="price">Appointment Fee</label> <input type="text"
							placeholder="Enter Product Price" name="appointmentFee"
							class="form-control" id="price" value="${doctor.appointmentFee }">

					</div>
					
					
					
				 	<div class="form-group">
						<label for="exampleFormControlFile1">Upload doctor licence pdf</label>
						 <input
							type="file" name="pdf" class="form-control-file"
							id="exampleFormControlFile1" accept="application/pdf"  value='<c:url  value="/resources/pdf/${doctor.id }.pdf"></c:url>' >
					</div>
 


					<div class="form-group">

						<label for="name">Doctor Email</label> <input type="email"
							class="form-control" id="name" aria-describedby="emailHelp"
							name="email" placeholder="Enter the doctor Name"
							value="${doctor.email }" readonly>

					</div>
					
			


					<div class="container text-center">

						<a href="${pageContext.request.contextPath}/home"
							class="btn btn-outline-danger">Back</a>


						<button type="submit" class="btn btn-success">Update</button>

					</div>
					
					
						<div class="form-group">
						<label for="name"></label> <input type="hidden"
							class="form-control" id="name" aria-describedby="emailHelp"
							name="id" placeholder="Enter the doctor Name"
							value="${doctor.id }">

					</div>
					

				</form>

			</div>
		</div>
	</div>

</body>
</html>