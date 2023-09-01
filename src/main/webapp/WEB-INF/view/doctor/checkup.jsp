<%@include file="header.jsp"%>
<%String message =(String) request.getAttribute("msg"); 
if(message == null)
	message="";%>
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
<body>
	<br>
	<h5>Hello, Dr. ${name}</h5>
	<br><br>
	<h3>CheckUp Report Page</h3>
	<p style="color:green;"><%=message%></p>
	<form action="checkup" method="post" style="margin:35px;">
		<div class="mb-3 row">
			<label class="col-sm-2 col-form-label">Patient Name:</label>
			<div class="col-sm-5">
				<input type="text" readonly class="form-control-plaintext"
					id="patientName" value="${pname}">
			</div>
		</div>
		<div class="mb-3 row">
			<label class="col-sm-2 col-form-label">Patient Id</label>
			<div class="col-sm-5">
				<input type="text" readonly class="form-control-plaintext"
					id="patientId" value="${pid}">
			</div>
		</div>
		<div class="mb-3 row">
			<label class="col-sm-2 col-form-label">Report Date:</label>
			<div class="col-sm-5">
				<input type="text" readonly class="form-control-plaintext"
					id="patientId" value="${pdate}">
			</div>
		</div>
		<div class="mb-3 row">
			<label class="col-sm-2 col-form-label">Disease:</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" name="disease"
					required value="${disease}">
			</div>
		</div>
		<div class="mb-3 row">
			<label class="col-sm-2 col-form-label">Report:</label>
			<div class="col-sm-5">
				<input type="text" style="height: 200px;" class="form-control"
					required name="report" value="${report}">
			</div>
		</div>
		<input style="position: relative; left: 600px;" type="submit"
			class="btn btn-outline-success" value="Add/Update">
	</form>
</body>
</html>