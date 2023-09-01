<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<%@include file="base1.jsp"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
</head>
<body>



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


								<form action="signup_valid" method="post">
									<p style="text-align: center; color: red">${msg}</p>
									<div class="d-flex align-items-center mb-3 pb-1">
										<i class="fas fa-cubes fa-2x me-3" style="color: #ff6219;"></i>
										<span class="h1 fw-bold mb-0"> Admin Singup</span>
									</div>


									<div class="mb-3">
										<label for="exampleInputPassword1" class="form-label">Name</label>
										<input type="text" class="form-control"
											placeholder="Enter your name" id="exampleInputPassword1"
											name="adminName" pattern="[A-Za-z]{1,32}+" required>
									</div>


									<div class="mb-3">
										<label for="exampleInputPassword1" class="form-label">Mobile
										</label> <input type="tel" class="form-control"
											id="exampleInputPassword1" name="mobile"
											placeholder="Enter 10 digit mobile number"
											pattern="[0-9]{10}" required>
									</div>



									<div class="mb-3">
										<label for="exampleInputEmail1" class="form-label">Email
											address</label> <input type="email" class="form-control"
											id="exampleInputEmail1" aria-describedby="emailHelp"
											name="adminEmail" placeholder="Enter your email"
											pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,4}$" required>

									</div>

									<div class="mb-3">
										<label for="exampleInputPassword1" class="form-label">Password</label>
										<input type="password" class="form-control"
											id="exampleInputPassword1" name="adminPass"
											placeholder="Enter your password" minlength="4"
											maxlength="16" required>
									</div>

									<button type="submit" class="btn btn-primary">Submit</button>
									<p></p>

									<p class="mb-5 pb-lg-2" style="color: #393f81;">
										Back to login page ? <a
											href="${pageContext.request.contextPath}/login"
											style="color: #393f81;">Back</a>
									</p>

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