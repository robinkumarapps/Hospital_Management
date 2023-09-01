<%@include file="header.jsp"%>
<html>
<head>
<style>
h1, h5, p {
	text-align: center;
}
table {
  width: 100%;
}

th {
  height: 70px;
}
</style>
<script>
	function Openform() {
		document.getElementById('form1').style.display = 'block';
	}
</script>
<meta charset="ISO-8859-1">
<title>Prescription</title>
</head>
<body>
	<h5>Hello, Dr. ${name}</h5>
	<br><br>
	<form action="addprescription" method="post" style="text-align:center;">
		<div class="mb-3 row">
			<label class="col-sm-2 col-form-label">Patient Name</label>
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
			<label class="col-sm-2 col-form-label">Prescription Date:</label>
			<div class="col-sm-5">
				<input type="text" readonly class="form-control-plaintext"
					id="patientId" value="${pdate}">
			</div>
		</div>
		<%-- <div class="mb-3 row">
			<label class="col-sm-2 col-form-label">Prescription</label>
			<div class="col-sm-5">
				<input type="text" style="height: 200px;" class="form-control"
					name="prescription" value="${pres}">
			</div>
		</div>
		<div class="mb-3 row">
			<label class="col-sm-2 col-form-label">Precautions</label>
			<div class="col-sm-5">
				<input type="text" class="form-control" name="precaution"
					value="${prec}">
			</div>
		</div> --%>
		<table class="table table-striped">
		  		<tr>
		    <th>S.No.</th>
		    <th>Medicine</th>
		    <th>Dose</th>
		    <th>Timing</th>
		  </tr>
		  <tr>
		    <td contenteditable='true'>Alfreds Futterkiste</td>
		    <td>Maria Anders</td>
		    <td>Germany</td>
		  </tr>
		  <tr>
		    <td>Centro comercial Moctezuma</td>
		    <td>Francisco Chang</td>
		    <td>Mexico</td>
		  </tr>
		  <tr>
		    <td>Ernst Handel</td>
		    <td>Roland Mendel</td>
		    <td>Austria</td>
		  </tr>
		  <tr>
		    <td>Island Trading</td>
		    <td>Helen Bennett</td>
		    <td>UK</td>
		  </tr>
		  <tr>
		    <td>Laughing Bacchus Winecellars</td>
		    <td>Yoshi Tannamuri</td>
		    <td>Canada</td>
		  </tr>
		  <tr>
		    <td>Magazzini Alimentari Riuniti</td>
		    <td>Giovanni Rovelli</td>
		    <td>Italy</td>
		  </tr>
		</table>
		<input style="position: relative; left: 600px;" type="submit"
			class="btn btn-outline-success" value="Add/Update">
	</form>
</body>
</html>