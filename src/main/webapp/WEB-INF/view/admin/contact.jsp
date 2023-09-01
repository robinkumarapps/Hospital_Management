<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<%@include file="nav.jsp" %>
<%@include file="base3.jsp" %>

<style>
.container{

margin-top:60px;
background-image:linear-gradient(40deg,#eacda3,#d6ae7b);
color:white;
font-size:20px;
}
.btn{
padding:10px;
font-size:30px;

text-align:center;
margin-left:500px;
margin-bottom:30px;

}
h2{
text-align:center;
font-size:50px;
}
</style>
</head>
<body>
<form:form action="postSubmit" modelAttribute="contact" method="post">
<div class="container m:5" style="border:2px solid;">
<h2>Emergency contact Form</h2>
<form class="container" >

  <div class="form-row">
    <div class="form-group col-md-6">
      <form:label for="inputEmail4" path="FirstName" name="FirstName">FirstName</form:label>
      <form:input type="text"  path="FirstName" name="FirstName" class="form-control" id="inputEmail4" placeholder="Enter FirstName" required="required"></form:input>
    </div>
   
  
   <div class="form-group col-md-6">
      <form:label for="inputEmail4" path="LastName" name="LastName">LastName</form:label>
      <form:input type="text" class="form-control" path="LastName" name="LastName" id="inputEmail4" placeholder="Enter LastName" required="required"></form:input>
    </div>
    </div>
   
  <div class="row">
   <div class="form-group col-md-6">
      <form:label for="inputEmail4" path="emergencyEmail" name="emergencyEmail">Email</form:label>
      <form:input type="email" class="form-control" path="emergencyEmail" name="emergencyEmail" id="inputEmail4" placeholder="Email" required="required"></form:input>
    </div>
   
  </div>

  <div class="form-row">
    <div class="form-group col-md-6">
      <form:label for="inputCity" path="Address" name="Address">Address</form:label>
      <form:input type="text" path="Address" class="form-control"  name="Address" id="inputCity" placeholder="Enter address" required="required"></form:input>
    </div>
    <div class="form-group col-md-4" >
      <form:label for="inputState" path="state" name="state" >State</form:label>
      <form:select id="inputState" class="form-control" path="state"  name="state" required="required">
        <option selected>Choose...</option>
       <option value="Andhra Pradesh">Andhra Pradesh</option>
        <option value="Arunachal Pradesh">Arunachal Pradesh</option>
        <option value="Assam">Assam</option>
         <option value="Bihar">Bihar</option>
        <option value="Chhattisgarh">Chhattisgarh</option>
        <option value="Goa">Goa</option>
         <option value="Gujarat">Gujarat</option>
        <option value="Haryana">Haryana</option>
        <option value="Himachal Pradesh">Himachal Pradesh</option>
         <option value="Jammu & Kashmir">Jammu & Kashmir</option>
        <option value="Jharkhand">Jharkhand</option>
        <option value="Karnataka">Karnataka</option>
         <option value="Kerala">Kerala</option>
        <option value="Madhya Pradesh">Madhya Pradesh</option>
        <option value="Maharashtra">Maharashtra</option>
         <option value="Manipur	">Manipur</option>
        <option value="Meghalaya">Meghalaya</option>
        <option value="Mizoram	">Mizoram</option>
         <option value="Nagaland">Nagaland</option>
        <option value="Orissa	">Orissa</option>
        <option value="Punjab	">Punjab</option>
         <option value="Rajasthan">Rajasthan</option>
        <option value="Sikkim">Sikkim</option>
        <option value="Tamil Nadu">Tamil Nadu</option>
         <option value="Telangana">Telangana</option>
        <option value="Tripura">Tripura</option>
        <option value="Uttarakhand">Uttarakhand</option>
           <option value="Uttar Pradesh">Uttar Pradesh</option>
              <option value="West Bengal">West Bengal</option>
        
      </form:select>
    </div>
    <div class="form-group col-md-2">
      <form:label for="inputZip" path="mobileNumber" name="mobileNumber">MobileNumber</form:label>
      <form:input type="text" class="form-control" path="mobileNumber" name="mobileNumber" id="inputZip" placeholder="Enter contact number" required="required"></form:input>
    </div>

  <div class="form-group col-md-6">
      <form:label path="primaryMobileNumber" name="primaryMobileNumber" for="inputZip">Primary Emergency Contact Number</form:label>
      <form:input  path="primaryMobileNumber" type="text"  name="primaryMobileNumber" class="form-control" id="inputZip" placeholder="Enter primary contact number" required="required"></form:input>
    </div>
  
  <form:button type="submit" class="btn btn-primary" style="background-image:linear-gradient(90deg,#de6262 ,#ffb88c);"><a href="homeSubmit">Submit</a></form:button>
</form>
</div>
</form:form>

</body>
</html>