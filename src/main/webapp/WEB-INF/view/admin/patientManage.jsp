<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@include file="base.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<p style="text-align: center; color: red;">${msg}</p>
	<h3 style="text-align: center;">You can manage all patients from
		here:</h3>
	<div class="container mt-3">

		<div class="row">

			<div class="col-md-12">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Patient Name</th>
							<th scope="col">Gender</th>
							<th scope="col">Mobile</th>
							<th scope="col">Email</th>
							<th scope="col">Current/Previous Doctor</th>
							<th scope="col">Booking History</th>
							<th scope="col">Booking Status</th>
							<th scope="col">Delete</th>
							<th scope="col">Modify</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${patient}" var="d">
							<tr>
								<th scope="row">${d.patientId }</th>
								<td>${d.patientName}</td>
								<td>${d.gender}</td>
								<td class="font-weight-bold">${d.contactNumber}</td>
								<td>${d.email }</td>
								<td><c:set var="check" value="${d.getDoctor().getName()}" />
									<c:choose>
										<c:when test="${check == null}">
								   No Doctor
								  </c:when>
										<c:otherwise>
											<a href="/cyberhealth/${d.getDoctor().getId()}/profile1">Dr.
												${d.getDoctor().getName()}</a>
										</c:otherwise>
									</c:choose></td>

								<td><c:set var="view" value="${d.getDoctor().getId()}" /> <c:choose>
										<c:when test="${view == null}">
								   No History
								  </c:when>
										<c:otherwise>
											<a
												href="/cyberhealth/${d.patientId}/${d.getDoctor().getId()}/booking-history-admin">View
												History</a>

										</c:otherwise>
									</c:choose></td>


								<td><c:set var="check"
										value="${d.getBooking().getBookingId()}" /> <c:choose>
										<c:when test="${check == null}">
								   No Appointment
								  </c:when>
										<c:otherwise>
								   ${d.getBooking().getBookingStatus() }
								  </c:otherwise>
									</c:choose></td>
								<td><a href="delete-patient/${d.patientId }"><i
										class="fas fa-trash text-danger"></i></a></td>
								<td><a href="update-patient/${d.patientId}"><i
										class="fas fa-pen-nib text-success"></i></a></td>
							</tr>
						</c:forEach>
					</tbody>
				</table>

				<div class="container text-center">

					<a href="add_patient" class="btn btn-outline-success">Add
						Patient</a> <a href="${pageContext.request.contextPath}/allpatient"
						class="btn btn-outline-success">Home</a>

				</div>
			</div>
		</div>
	</div>
</body>
</html>