<%@include file="header.jsp"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%
String[] desc = (String[]) request.getAttribute("desc");
String[] med = (String[]) request.getAttribute("med");
String[] dose = (String[]) request.getAttribute("dose");
String[] timing = (String[]) request.getAttribute("timing");
String temp1 = "", temp2 = "", temp3 = "";
if (timing[0].equals("Morning")) {
	temp1 = "Morning";
	temp2 = "Evening";
	temp3 = "AfterNoon";
} else if (timing[0].equals("Evening")) {
	temp1 = "Evening";
	temp2 = "Morning";
	temp3 = "AfterNoon";
} else if (timing[0].equals("AfterNoon")) {
	temp1 = "AfterNoon";
	temp2 = "Morning";
	temp3 = "Evening";
} else {
	temp1 = "Morning";
	temp2 = "Evening";
	temp3 = "AfterNoon";
}
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
</style>
<meta charset="ISO-8859-1">
<title>Prescription</title>
</head>
<body style="background-color:#D3D3D3;">
	<br>
	<h5 style="text-align:center; color:red;">${msg}</h5>
	<h5>Hello, Dr. ${name}</h5>
	<h3>Prescription Page</h3>
	<br>
	<br>
	<p style="color:green;"></p>
	<div style="margin-left:20px">
	<div class="mb-3 row">
		<label class="col-sm-2 col-form-label">Patient Name:</label>
		<div class="col-sm-4">
			<input type="text" readonly class="form-control-plaintext"
				id="patientName" value="${pname}">
		</div>	
		<label class="col-sm-2 col-form-label">Disease:</label>
		<div class="col-sm-4">
			<input type="text" readonly class="form-control-plaintext"
				id="patientDisease" value="${disease}" style="background-color:white; border-radius:10px; width:400px" required>
		</div>
	</div>
	<div class="mb-3 row">
		<label class="col-sm-2 col-form-label">Patient Id:</label>
		<div class="col-sm-4">
			<input type="text" readonly class="form-control-plaintext"
				id="patientId" value="${pid}">
		</div>
		<label class="col-sm-2 col-form-label">Gender:</label>
		<div class="col-sm-4">
			<input type="text" readonly class="form-control-plaintext"
				id="patientDisease" value="${gender}">
		</div>
		<!-- <label class="col-sm-2 col-form-label">Age:</label>
		<div class="col-sm-4">
			<input type="text" readonly class="form-control-plaintext"
				id="patientDisease" value="">
		</div> -->
	</div>
	<div class="mb-3 row">
		<label class="col-sm-2 col-form-label">Prescription Date:</label>
		<div class="col-sm-4">
			<input type="text" readonly class="form-control-plaintext"
				id="patientId" value="${pdate}">
		</div>
	</div>
	</div>
	<form action="addprescription" method="post" style="margin: 35px;"
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
			%>
			<tr>
				<td><input type="text" name="desc" required
					value="<%=desc[0]%>" placeholder="Write here"></td>
				<td><input type="text" name="med" required value="<%=med[0]%>"
					placeholder="Write here"></td>
				<td><input type="number" name="dose" min="1" required
					value="<%=dose[0]%>" placeholder="Write here"></td>
				<td><select name="timing">
						<option value="<%=temp1%>"><%=temp1%></option>
						<option value="<%=temp2%>"><%=temp2%></option>
						<option value="<%=temp3%>"><%=temp3%></option>
				</select></td>
			</tr>
			<%
			for (int i = 1; i < desc.length; i++) {
				if (timing[i].equals("Morning")) {
					temp1 = "Morning";
					temp2 = "Evening";
					temp3 = "AfterNoon";
				} else if (timing[i].equals("Evening")) {
					temp1 = "Evening";
					temp2 = "Morning";
					temp3 = "AfterNoon";
				} else if (timing[i].equals("AfterNoon")) {
					temp1 = "AfterNoon";
					temp2 = "Morning";
					temp3 = "Evening";
				} else {
					temp1 = "Morning";
					temp2 = "Evening";
					temp3 = "AfterNoon";
				}
			%>
				<tr id="count">
					<td><input type="text" name="desc" value="<%=desc[i]%>"
						placeholder="Write here"></td>
					<td><input type="text" name="med" value="<%=med[i]%>"
						placeholder="Write here"></td>
					<td><input type="number" name="dose" min="1"
						value="<%=dose[i]%>" placeholder="Write here"></td>
					<td><select name="timing">
							<option value="<%=temp1%>"><%=temp1%></option>
							<option value="<%=temp2%>"><%=temp2%></option>
							<option value="<%=temp3%>"><%=temp3%></option>
					</select></td>
				</tr>
			<%
			}
			} catch (Exception e) {
			}
			%>
		</table>
	</form>
		<button type="button" style="position:absolute; right:140px;  margin-top:0;" onclick="addPrescriptionField()" class="btn btn-secondary">+Add Field</button><br><br>	
		<button type="button" style="position:absolute; right:120px;  margin-top:0;" onclick="removePrescriptionField()" class="btn btn-secondary">-Remove Field</button><br><br>	
	 <button type="submit" style="position:relative; left:600px;" form="pres" class="btn btn-success">Add/Update</button>
</body>
</html>