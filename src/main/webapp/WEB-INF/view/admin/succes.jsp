<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<h1>Success...</h1>
	<h1>${msgg }</h1>


	<%-- 
<a href="<c:url  value="/resources/image/${file }"></c:url>">
  <img src='<c:url  value="/resources/image/${file }"></c:url>' alt="HTML tutorial" style="width:72px;height:72px;">
</a> --%>

	<%--  <img alt="profile image..." src='<c:url  value="/resources/image/${file }"></c:url>'>  --%>


	<%--  <embed src="<c:url  value="/resources/image/${file }"></c:url>" width="800px" height="2100px" />  --%>



	<a href="<c:url  value="/resources/pdf/${file }"></c:url>"> <img
		src="https://upload.wikimedia.org/wikipedia/commons/8/87/PDF_file_icon.svg"
		alt="Doctor licence" style="width: 72px; height: 42px;">
	</a>

</body>
</html>