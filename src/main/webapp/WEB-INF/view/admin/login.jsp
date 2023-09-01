<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="base1.jsp"%>

<%@page isELIgnored="false"%>

<link href='<c:url value="/resources/css/style.css"></c:url>' >

<script src='<c:url value="/resources/js/test.js"></c:url>'></script>

</head>
<body>

<%-- <img alt="my image" src='<c:url value="/resources/image/dog.jpg"></c:url>'> --%>


	<section class="vh-100" style="background-color: #9A616D;">
		<div class="container py-5 h-100">
			<div
				class="row d-flex justify-content-center align-items-center h-100">
				<div class="col col-xl-10">
					<div class="card" style="border-radius: 1rem;">
						<div class="row g-0">
							<div class="col-md-6 col-lg-5 d-none d-md-block">
								<img
									src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/img2.jpg"
									alt="login form" class="img-fluid"
									style="border-radius: 1rem 0 0 1rem;" />
							</div>
							<div class="col-md-6 col-lg-7 d-flex align-items-center">
									<form action="admin_valid" method="post">
											<p style="text-align:center; color:red">${msg}</p>
										<div class="d-flex align-items-center mb-3 pb-1">
											<i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
											<span class="h1 fw-bold mb-0">CyberHealth </span>
										</div>

										<h5 class="fw-normal mb-3 pb-3" style="letter-spacing: 1px;">Admin
											login</h5>

										<div class="form-outline mb-4">
											<input type="email" id="form2Example17"
												class="form-control form-control-lg" 
												name="user_email" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$"
												placeholder="Abcd@gmail.com"
												required /> <label
												class="form-label" for="form2Example17">Email
												address</label>
										</div>

										<div class="form-outline mb-4">
											<input type="password" id="form2Example27"
												class="form-control form-control-lg"
												 name="user_password" minlength="4" maxlength="16"
												 placeholder="****"
												   required />
											<label class="form-label" for="form2Example27">Password</label>
										</div>

										<div class="pt-1 mb-4">

											<button class="btn btn-dark btn-lg btn-block" type="submit">Login</button>
										</div>

										 
                 <a class="small text-muted" href="#!">Forgot password?</a>
                  <p class="mb-5 pb-lg-2" style="color: #393f81;">Don't have an account? <a href="${pageContext.request.contextPath}/signup" style="color: #393f81;">Register here</a></p>
                  <a href="#!" class="small text-muted">Terms of use.</a>
                  <a href="#!" class="small text-muted">Privacy policy</a>
 
									</form>

								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>

</body>
</html>