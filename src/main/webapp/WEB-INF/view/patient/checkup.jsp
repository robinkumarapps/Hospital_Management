<%@page import="com.model.Patient"%>
<%@include file="navbar.jsp"%>
<% Patient patient = (Patient)request.getAttribute("patient");
String disease = "";
String report = "";
if(patient.getCheckup() != null){
	disease = patient.getCheckup().getDisease();
	report = patient.getCheckup().getReport();
}

if(disease == null)
{
	disease = "";
	report = "";
}
	%>
<html>
<head>
<style>
h1, h5, p, h3{
	text-align: center;
}
</style>
<meta charset="ISO-8859-1">
<title>Prescription</title>
</head>
<body style=" background-image:linear-gradient(40deg,#eacda3,#d6ae7b); color:white;">
	<br>
	<h5>Hello, Dear. ${patient.patientName}</h5>
	<h3>View CheckUp Report</h3>
	<p style="color:red;">${msg}</p>
	
	<form action="" method="post" style="margin:35px;">
		<div class="mb-3 row">
			<label class="col-sm-2 col-form-label">Patient Name:</label>
			<div class="col-sm-5">
				<input type="text" readonly class="form-control-plaintext"
					id="patientName" value="${patient.patientName}">
			</div>
		</div>
		<div class="mb-3 row">
			<label class="col-sm-2 col-form-label">Patient Id</label>
			<div class="col-sm-5">
				<input type="text" readonly class="form-control-plaintext"
					id="patientId" value="${patient.patientId}">
			</div>
		</div>
		<div class="mb-3 row">
			<label class="col-sm-2 col-form-label">Report Date:</label>
			<div class="col-sm-5">
				<input type="text" readonly class="form-control-plaintext"
					id="patientId" value="${patient.getCheckup().getCheckupDate()}">
			</div>
		</div>
		<div class="mb-3 row">
			<label class="col-sm-2 col-form-label">Disease:</label>
			<div class="col-sm-5">
				<input type="text" readonly class="form-control" name="disease"
					required value="<%=disease%>">
			</div>
		</div>
		<div class="mb-3 row">
			<label class="col-sm-2 col-form-label">Report:</label>
			<div class="col-sm-5">
				<input type="text" readonly style="height: 100px;" class="form-control"
					required name="report" value="<%=report%>">
			</div>
		</div>
	</form>

</body>
</html>