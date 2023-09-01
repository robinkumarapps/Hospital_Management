<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@include file="base.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

</head>
<body>
	<p style="text-align:center;">${msg }</p>
	<h3 style="text-align:center;">You can manage all the doctors from here:</h3>
	<div class="container mt-3">

		<div class="row">

			<div class="col-md-12">
				<table class="table">
					<thead class="thead-dark">
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Photo</th>
							<th scope="col">Doctor Name</th>
							<th scope="col">Experience</th>
							<th scope="col">Appointment Fee</th>
							<th scope="col">License</th>
							<th scope="col">Email</th>
							<th scope="col">Speciality</th>
							<th scope="col">Booking History</th>
							<th scope="col">Delete</th>
							<th scope="col">Modify</th>
						</tr>
					</thead>
					<tbody>

						<c:forEach items="${doctor }" var="d">

							<tr>
								<th scope="row">Doctor Id-${d.id }</th>


								<td><a
									href="<c:url  value="/resources/image/${d.email}.jpg"></c:url>">
										<img
										src='<c:url  value="/resources/image/${d.email}.jpg"></c:url>'
										alt="Doctor photo" style="width: 72px; height: 72px;">
								</a></td>
								<td>${d.name }</td>
								<td>${d.experience }</td>
								<td class="font-weight-bold">&#x20B9; ${d.appointmentFee }</td>

								<td><a
									href="<c:url  value="/resources/pdf/${d.email}.pdf"></c:url>">
										<img
										src="https://upload.wikimedia.org/wikipedia/commons/8/87/PDF_file_icon.svg"
										alt="Doctor license" style="width: 72px; height: 42px;">
								</a></td>


								<td>${d.email }</td>
								<td>${d.speciality }</td>
								<td>
									<c:set var="view" value="${d.getPatient().size()}" /> <c:choose>
										<c:when test="${view == null}">
										   No History
										  </c:when>
												<c:otherwise>
													<a href="/cyberhealth/${d.getId()}/booking-history-patient">View History</a>
										</c:otherwise>
									</c:choose>
								</td>
								<td><a href="delete/${d.id }"><i class="fas fa-trash text-danger"></i></a></td>
								<td><a href="update/${d.id }"><i class="fas fa-pen-nib text-success"></i></a></td>
							</tr>
						</c:forEach>

					</tbody>
				</table>

				<div class="container text-center">

					<a href="add_dotcor" class="btn btn-outline-success">Add Doctor</a>
					<a href="${pageContext.request.contextPath}/admin"
						class="btn btn-outline-success">Home</a>

				</div>






			</div>


		</div>


	</div>


</body>
</html>