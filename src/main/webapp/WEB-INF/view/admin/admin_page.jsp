<%@page import="com.model.Doctor"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@include file="base.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
<h3 style="text-align:center;">You are viewing all the doctors</h3>
	<div class="card-group">
		<c:forEach items="${doctor }" var="d">
		<div class="card  mt-5 bg-normal" style="max-width: 18rem; margin:20px;">
			<ul class="list-group">
				<li class="list-group-item active">Doctor id : ${d.id }</li>
				<li class="list-group-item">Name - ${d.name }</li>
				<li class="list-group-item">Experience - ${d.experience }</li>
				<li class="list-group-item">Fee - ${d.appointmentFee }</li>
				<li class="list-group-item">License - ${d.licenseNo }</li>
				<li class="list-group-item">Email - ${d.email }</li>
				<li class="list-group-item"><b>Status</b>
				<c:set var="on" value="${d.status}"/>
				<c:choose>
					<c:when test="${(on == true)}">
					<button type="button" class="btn btn-success">Active</button>
					</c:when>
					<c:otherwise>
					<button type="button" class="btn btn-danger">Offline</button>
					</c:otherwise>
				</c:choose>
				</li>
				<c:set var="arr" value="${d.availabilityDate}"/>
				<c:choose>
					<c:when test="${(arr != null)}">
					<li class="list-group-item"><b>Doctor Unavailability: </b>
					  <select id="cars" name="cars">
					<c:forEach var="temp" items="${arr}">
			        	<option>${temp}</option>
					</c:forEach>
				  </select>
					</c:when>
				</c:choose>
			</ul>
			</div>
		</c:forEach>
	</div>
</body>
</html>