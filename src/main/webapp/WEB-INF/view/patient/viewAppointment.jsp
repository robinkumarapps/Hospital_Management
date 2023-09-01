<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="./base.jsp"%>
<style>
.container{
height:26rem;
border-radius:12px;
 background-image:linear-gradient(40deg,#eacda3,#d6ae7b);
 margin-top:60px;
}
h1{
color:white; text-align:center;
}
#col{
color:white;
}
th{
width:10rem;}
</style>
</head>
<body >
<%@include file="navbar.jsp"%>

<div class="container">
<h1 >Booking details</h1>
<p style="text-align:center; color:red;">${msg }</p>
<div  align="center" id="col">

<table border="3" padding="5">

<tr>
<th>Booking Id</th>
<th>Booking Date</th>
<th>Booking Slot</th>
<th>Doctor</th>
<th>Status</th>
<th>Delete</th>
</tr>
<%-- <c:forEach items="${books}" var="booking"> --%>
<tr>
<td><c:out value="${books.bookingId}"></c:out></td>
<td>${books.appDate}</td>
<td>${books.appTime}</td>
<c:set var="on" value="${spec}"/>
				<c:choose>
					<c:when test="${(on != null)}">
					<td><a href="/cyberhealth/${spec}/profile1">View Doctor</a></td>
					</c:when>
				</c:choose>
<td>${books.bookingStatus }</td>
				<c:set var="on1" value="${books.appDate}"/>
				<c:choose>
					<c:when test="${(on1 != null)}">
					<td><a href="/cyberhealth/${patient.patientId}/delete">Delete</a></td>
					</c:when>
				</c:choose>
</tr><%-- 
</c:forEach>
 --%>
</table>
</div>

</div>
</body>
</html>