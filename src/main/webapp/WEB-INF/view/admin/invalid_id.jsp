<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html>
<html>
<head>
<%@include file="base.jsp"%>



<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page isELIgnored="false"%>
</head>
<body>


	<div class="container mt-5">


		<div class="card text-center">
			<div class="card-header">Error</div>
			<div class="card-body">
				<h5 class="card-title">Invalid</h5>
				<p class="card-text">This doctor id or email are already avalable in
					database</p>
				<a href="${pageContext.request.contextPath}/add_dotcor"
					class="btn btn-primary text-center " >Re add</a>
					
					 <a
					href="${pageContext.request.contextPath}/home"
					class="btn btn-primary text-center">Home</a>
			</div>
			<div class="card-footer text-muted">Thanks</div>
		</div>
	</div>



	

</body>
</html>