<%@include file="header2.jsp" %>
<% String message= (String)request.getAttribute("msg"); 
if(message == null)
	message="";
%>
<!DOCTYPE html>
<html>
<head>
<style>
h1, p, h3, form {
	text-align:center;
}
.divider:after,
.divider:before {
  content: "";
  flex: 1;
  height: 1px;
  background: #eee;
}
</style>
<script>
	function myFunction() {
		var x = document.getElementById("password");
		if (x.type === "password") {
			x.type = "text";
		}else{
			x.type = "password";
		}
	}
</script>
<meta charset="ISO-8859-1">
<title>Doctor Login</title>
</head>
<body>
	<br>
	<p style="font-size:50px;margin-left:10px;">Login</p>
	<%if(message.equals("Signup Successful")){%>
	<p style="color:green;"><%=message%></p>
	<%}
	else{%>
	<p style="color:red; ">${msg}</p>
	<%}%>
	<!-- <form action="doctor-login-form" method="post">
		<label for="email">Email:</label><br><br> <input type="text"
			 name="email" placeholder="Enter Your UserName" required><br><br> <label
			for="password">Password:</label><br><br> <input type="password"
			id="password" name="password" placeholder="Enter password" required><br>
			<input type="checkbox" onclick="myFunction()">Show Password <br>
		<br> <input type="submit" value="Submit">
	</form> -->
	<!-- <section class="vh-100">
  <div class="container py-5 h-100">
    <div class="row d-flex align-items-center justify-content-center h-100">
      <div class="col-md-8 col-lg-7 col-xl-6">
        <img src="https://mdbcdn.b-cdn.net/img/Photos/new-templates/bootstrap-login-form/draw2.svg" class="img-fluid" alt="Phone image">
      </div>
      
    </div>
  </div>
</section> -->
<br>
<div class="col-md-6 offset-xl-3" id="form" style="text-align:center; border:2px solid #dd5e89; padding:25px; border-radius:5px;background-image:linear-gradient(40deg,#eacda3,#d6ae7b);">
        <form action="doctor-login-form" method="post" style="text-align:left;">
          <div class="form-outline mb-4">
          Email address:
            <input type="email" name="email" class="form-control form-control-lg" required placeholder="Enter email here" />
          </div>
          <div class="form-outline mb-4">
          Password:
            <input type="password" id="password" name="password" required class="form-control form-control-lg" placeholder="Enter password here"/>
          </div>

          <div class="d-flex justify-content-around align-items-center mb-4">
          
            <div class="form-check">
              <input class="form-check-input" type="checkbox" onclick="myFunction()"/>
             Show Password
            </div>
          <!--   <a href="#!">Forgot password?</a> -->
          </div>

          <!-- Submit button -->
          <button type="submit" class="btn btn-primary btn-lg btn-block" style="background-image:linear-gradient(90deg,#de6262 ,#ffb88c)">Sign in</button>
        </form>
      </div>
</body>
</html>