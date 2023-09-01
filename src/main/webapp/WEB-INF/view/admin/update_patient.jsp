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

function editGender() {
	  document.getElementById("gender").readOnly = false;
	}
	
function editPass() {
	  document.getElementById("pwd").readOnly = false;
	}
	
function f(v)
{
    if(v=='F' || v=='M' || v=='f' || v=='m')
    {
        document.getElementById("t").value=v;
    }
    else
    {
        document.getElementById("t").value="";   
    }
}
</script>
</head>
<body>

	<div class="container mt-3">
	
		<div class="row">
			<div class="col-md-6 offset-md-3"> 

				<h1 class="text-center mb-3">Update Patient</h1>

				<form action="${patient.patientId}"
					method="post">
					
					<!--Patient Name-->
					<div class="form-group">
						<label for="name">Patient Name<i class="fas fa-pen-nib text-success" onclick="editName()"></i></label> <input type="text"
							class="form-control" id="name" aria-describedby="emailHelp"
							name="patientName" placeholder="Enter the doctor Name"
							value="${patient.patientName}" readonly>
					</div>

					<!--Contact Number  -->
					<div class="form-group">
						<label for="name">Contact Number</label><input type="text"
							class="form-control" id="contactNumber" aria-describedby="emailHelp"
							name="contactNumber" placeholder="Enter the doctor Name"
							value="${patient.contactNumber}">
					</div>
					
					<!--Gender  -->
					<div class="form-group">
						<label for="name">Gender<i class="fas fa-pen-nib text-success" onclick="editGender()"></i></label><input type="text"
							class="form-control" id="gender"
							name="gender" pattern="M|F" title="only letter M or F is allowed"
							value="${patient.gender}" readonly>
					</div>
					
					<!--Email  -->
					<div class="form-group">
						<label for="name">Patient Email</label> <input type="email"
							class="form-control" id="name" aria-describedby="emailHelp"
							name="email"
							value="${patient.email}" readonly>
					</div>
					
				<div class="form-group">
						Password:<i class="fas fa-pen-nib text-success" onclick="editPass()"></i>
						<input type="password" id="pwd" name="password" class="form-control" 	value="${patient.password}" readonly/>
					</div>


					<div class="container text-center">

					<a href="${pageContext.request.contextPath}/admin-patient"
							class="btn btn-outline-danger">Back</a>


						<button type="submit" class="btn btn-success">Update</button>
					</div>
				</form>

			</div>
		</div>
	</div>

</body>
</html>