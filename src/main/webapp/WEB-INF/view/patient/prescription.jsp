<%@include file="navbar.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String[] desc = (String[]) request.getAttribute("desc");
String[] med = (String[]) request.getAttribute("med");
String[] dose = (String[]) request.getAttribute("dose");
String[] timing = (String[]) request.getAttribute("timing");
%>
<spring:url value="/resources/js/addform.js" var="js" />
<script src="${js}" type="text/javascript"></script>
<html>
<head>
<style>
h1, h5, p, h3 {
	text-align: center;
}

table {
	width: 100%;
}

th {
	height: 70px;
}
.label,h5,#patientName,#patientDisease,#patientId{
font-size:20px;
color:#1b1c1b;
}
</style>
<meta charset="ISO-8859-1">
<title>Prescription</title>
</head>
<body style=" background-image:linear-gradient(40deg,#eacda3,#d6ae7b); color:white;">
	<br>
	<h5>Hello, Dear ${patient.patientName }</h5>
	<h3>View Prescription</h3>
	<br>
	<br>
	<p style="color:yellow; font-size:30px;">${msg}</p>
	<div style="margin-left:20px">
	<div class="mb-3 row">
		<label class="col-sm-2 col-form-label label">Patient Name:</label>
		<div class="col-sm-4">
			<input type="text" readonly class="form-control-plaintext"
				id="patientName" value="${patient.patientName}">
		</div>	
		<label class="col-sm-2 col-form-label label">Disease:</label>
		<div class="col-sm-4">
			<input type="text" class="form-control-plaintext"
				id="patientDisease" value="${patient.getCheckup().getDisease() }" readonly>
		</div>
	</div>
	<div class="mb-3 row">
		<label class="col-sm-2 col-form-label label">Patient Id:</label>
		<div class="col-sm-4">
			<input type="text" readonly class="form-control-plaintext"
				id="patientId" value="${patient.patientId}" >
		</div>
		<label class="col-sm-2 col-form-label label">Gender:</label>
		<div class="col-sm-4">
			<input type="text" readonly class="form-control-plaintext"
				id="patientDisease" value="${patient.gender}" >
		</div>
		<!-- <label class="col-sm-2 col-form-label label">Age:</label>
		<div class="col-sm-4">
			<input type="text" readonly class="form-control-plaintext"
				id="patientDisease" value="">
		</div> -->
	</div>
	<div class="mb-3 row">
		<label class="col-sm-2 col-form-label label">Prescription Date:</label>
		<div class="col-sm-4">
			<input type="text" readonly class="form-control-plaintext"
				id="patientId" value="${patient.getPrescription().getPrescDate()}">
		</div>
	</div>
	</div>
	<%if(desc != null){ %>
	<form action="#" method="post" style="margin: 35px;"
		id="pres">
		<table class="table table-hover" id="p">
			<tr>
				<th>Description</th>
				<th>Medicine</th>
				<th>Dose</th>
				<th>Timing</th>
			</tr>
			<%
			try {
			for(int i = 0; i < timing.length; i++){%>
			<tr>
				<td><input type="text" name="desc"
					value="<%=desc[i]%>" readonly placeholder="No data"></td>
				<td><input type="text" name="med" required value="<%=med[i]%>"
					placeholder="No data" readonly></td>
				<td><input type="number" name="dose"
					value="<%=dose[i]%>" placeholder="No data" readonly></td>
				<td><input type="text" name="dose" 
					value="<%=timing[i]%>" readonly placeholder="No data"></td>
			</tr>
			<%}
			} catch (Exception e) {
			}%>
		</table>
	</form>
	<%}%>
</body>
</html>