<%@ page language="java" contentType="text/html; charset=UTF-8"
	isELIgnored="false"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<html lang="en">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<title>Error Page</title>
<spring:url value="/resources/css/error.css" var="errorCss" />
<link rel="stylesheet" href="${errorCss }" />
<script src="https://kit.fontawesome.com/66aa7c98b3.js"
	crossorigin="anonymous"></script>
</head>
<body>
	<div class="container">
		<div class="gif">
			<img src="https://i.postimg.cc/2yrFyxKv/giphy.gif" alt="gif_ing" />
		</div>
		<div class="content">
			<h1 class="main-heading">Exception Occur</h1>
			<p>${ex}</p>
				<button onClick="history.back()">
					Back<i class="far fa-hand-point-right"></i>
				</button>
		</div>
	</div>
</body>
</html>
