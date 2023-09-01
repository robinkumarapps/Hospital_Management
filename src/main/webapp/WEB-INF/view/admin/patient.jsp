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
<h3 style="text-align:center;">All Patients</h3>
	<div class="card-group">
		<c:forEach items="${patient}" var="d">
		<div class="card  mt-5 bg-normal" style="max-width: 18rem; margin:20px;">
			<ul class="list-group">
				<li class="list-group-item active">Patient id : ${d.patientId}</li> 
				<li class="list-group-item">Name - ${d.patientName }</li>
				<li class="list-group-item">Gender - ${d.gender }</li>
				<li class="list-group-item">Mobile - ${d.contactNumber }</li>
				<li class="list-group-item">Email - ${d.email }</li>
				<li class="list-group-item">Current/Recent Doctor - 
					<c:set var="check" value="${d.getDoctor().getName()}"/>
					<c:choose> 
					  <c:when test="${check == null}">
					   No Doctor
					  </c:when>
					  <c:otherwise>
					   <a href="/cyberhealth/${d.getDoctor().getId()}/profile1">Dr. ${d.getDoctor().getName()}</a>
					  </c:otherwise>
					</c:choose>
								
				</li>
				<li class="list-group-item">Booking Status - 
					<c:set var="check" value="${d.getBooking().getBookingId()}"/>
								<c:choose> 
								  <c:when test="${check == null}">
								   No Appointment
								  </c:when>
								  <c:otherwise>
								   ${d.getBooking().getBookingStatus() }
								  </c:otherwise>
								</c:choose>
				</li>
			</ul>
			</div>
		</c:forEach>
	</div>
</body>
</html>