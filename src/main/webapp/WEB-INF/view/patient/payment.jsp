<%@page import="com.model.Doctor"%>
<%@page import="java.util.List"%>
<%@page import="java.time.LocalDate"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./base.jsp"%>
<style>
.headerbook {
	margin-top: 40px;
	background-image:linear-gradient(90deg,#bdc3c7,#2c3e50);
	font-size: 16px;
	text-align: center;
	height: 50px;
	width: 500px;
	margin-left: 400px;
}
</style>
</head>
<body>
<%@include file="navbar.jsp"%>
<br><br>
<div class="col-md-6 offset-md-3" style="text-align:center; border:2px solid #dd5e89; padding:25px; border-radius:5px;background-image:linear-gradient(40deg,#eacda3,#d6ae7b);">
<h3 style="color:grey;">Please pay the Amount</h3>
<form action="payment" method="post" style="text-align:center;">
  <label for="payment">Amount to be paid:</label><br>
  <input type="text" value="${pay}" readonly  class="form-control"><br>
  <label for="card">Enter 16 digit card number: </label><br>
  <input type="text" value="" placeholder="Enter card details"  class="form-control"><br><br>
  <input  class="btn btn-success" type="submit" value="Pay">
</form> 
</div>
</body>
</html>