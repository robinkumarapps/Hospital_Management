<%@page import="java.util.List"%>
<%@page import="java.time.LocalDate"%>
<%@page import="com.model.Doctor"%>
<%@include file="header.jsp"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%
	String[] d = (String[])request.getAttribute("busydate");
	String min = LocalDate.now().plusDays(1).toString();
	String msg = (String)request.getAttribute("msg");
	if(msg == null)
		msg="";
%>
<html>
<head>
<style>
h1, h2, p, h3, form {
	text-align: center;
}

* {
	margin: 0;
	padding: 0
}

.card {
	width: 350px;
	background-image:linear-gradient(40deg,#eacda3,#d6ae7b);
	border: none;
	cursor: pointer;
	transition: all 0.5s
}

/* .image img {
    transition: all 0.5s
} */
.name {
	font-size: 22px;
	font-weight: bold
}

.idd {
	font-size: 14px;
	font-weight: 600
}

.number {
	font-size: 22px;
	font-weight: bold
}

.text span {
	font-size: 13px;
	color: #545454;
	font-weight: 500
}

.container {
	heigth: 200px;
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
<title>Set Status</title>
</head>
<body>
	<h2>Set Unavailability Status</h2>
	<%if(msg.equals("Status set successfully")) {
	%>
	<p style="color: green;">${msg}</p>
	<%}else{
		%>
		<p style="color: red;">${msg}</p>
	<% }%>
	<h3>Hello, Dr.</h3>
	<div class="container mt-4 mb-4 p-3 d-flex justify-content-center">
		<div class="card p-4">
			<form action="setstatus" method="post">
				Date:<br><input type="date" name="adate" required min="<%=min%>"/><br>
				<br> <input type="hidden" name="status" value="false"><input
					type="submit" class="btn btn-secondary" value="Unavailable">

			</form>
		</div>
	</div>

	
	<div class="card-group" style="margin:35px;">
		<% 
		if(d != null){
			for(int i = 0; i < d.length; i++)
	{%>
	
		<div class="card-body" id="date<%=i %>" style="background-image:linear-gradient(40deg,#eacda3,#d6ae7b);">
			<h5 class="card-title">Unavailable on:</h5>
			<input type="text" readonly value="<%=d[i] %>"/>
			<form action="setstatus/<%=d[i] %>" style="text-align:left;">
			<br><input type="submit" class="btn btn-danger" value="Delete">
			</form>
		</div>
		<%}}else{%>
			<h4 style="text-align:center;">Nothing to show here</h4>
		<%}	%>
		</div>
	
</body>
</html>