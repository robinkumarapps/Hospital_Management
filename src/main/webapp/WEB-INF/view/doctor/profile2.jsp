<%@page import="com.model.Doctor"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@include file="header3.jsp"%>
<% 
	Doctor d = (Doctor)request.getAttribute("doc"); 
	%>
<!DOCTYPE html>
<html>
<head>
<style>
h1,h2, p, h3, form {
	text-align: center;
}

* {
    margin: 0;
    padding: 0
}

.card {
    width: 350px;
    background-color: #efefef;
    border: none;
    cursor: pointer;
    transition: all 0.5s
}

/* .image img {
    transition: all 0.5s
} */

.card:hover .image img {
    transform: scale(1.5)
}	

.name {
    font-size: 22px;
    font-weight: bold
}

.idd {
    font-size: 14px;
    font-weight: 600
}


.number {
    font-size: 22px;
    font-weight: bold
}

.text span {
    font-size: 13px;
    color: #545454;
    font-weight: 500
}

</style>
<meta charset="ISO-8859-1">
<title>Doctor Profile</title>
</head>
<body>
<br>
<h2>Doctor Profile</h2>
	<div class="container mt-4 mb-4 p-3 d-flex justify-content-center" >
    <div class="card p-4">
        <div class=" image d-flex flex-column justify-content-center align-items-center"> 
       <%-- <img src="<%=img%>" height="100" width="100" /> --%>
        <span class="name mt-3">Dr. <%=d.getName() %></span> <span class="idd"><br>Doctor_Email: <%=d.getEmail()%></span>
            <div class="d-flex flex-row justify-content-center align-items-center mt-3"><%=d.getPatient().size()%> Patients </div>
            <div class="text mt-3"> <span>Dr. <%=d.getName() %> is a <%=d.getSpeciality() %> specialist having an experience of <%=d.getExperience() %> years.<br><br></span>LicenseId: <%=d.getLicenseNo() %></div>
            <br><br><br><br><br><br>
            </div>
            <button onClick="history.back()">
					Back<i class="far fa-hand-point-right"></i>
				</button>
    </div>
</div>
				
</body>
</html>