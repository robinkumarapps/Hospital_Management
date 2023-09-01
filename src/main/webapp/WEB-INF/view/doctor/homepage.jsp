<%@include file="header.jsp"%>
<%
int num = (int) request.getAttribute("pending");
System.out.println(num);
%>
<html>
<head>
<style>
h1, h2, h3, p {
	text-align: center;
}
</style>
<meta charset="ISO-8859-1">
<title>HomePage</title>
</head>
<body>
	<h1>Hello, Dr. ${name}</h1>
	<br>
	<%
	if (num > 0) {
	%>
	<div class="alert alert-warning alert-dismissible fade show"
		role="alert" style="text-align:center; width:450px;  margin: auto;">
		<strong>You have <%=num%> pending bookings.
		</strong>
		<button type="button" class="btn-close" data-bs-dismiss="alert"
			aria-label="Close"></button>
	</div>
	<%
	}
	%>
	<br>
	<h2>You are on Doctor HomePage</h2>
	<%-- <h3>Your Pending Bookings: ${num}</h3> --%>

</body>
</html>