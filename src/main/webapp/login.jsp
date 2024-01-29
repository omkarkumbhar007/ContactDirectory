<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<!doctype html>
<html lang="en">
 <head>
	<title>Login</title>
	<!-- Latest compiled and minified CSS -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" href="assets/css/style.css">
 	<!-- 	<script src="Service.js"></script>  -->
	<script src="login.js"></script>
 </head>

 <body >
		<div class="container" id="login"  >
			<div class="col-sm-10 col-md-6 login-form" style="box-shadow:7px 7px 5px black ;background-color:#6495ED">
				<h2 class="col-md-offset-5" style="font-family:cursive; font-weight:bold;color:white">Login</h2>
				<br />
				<form class="form-horizontal" method="post" action="login_check.jsp">
					<div class="form-group">
						<label class="control-label col-md-4 col-sm-4" for="username" style="font-family:cursive; font-weight:bold;color:white">Username<sup>*</sup></label>
						<div class="col-sm-8 col-md-8">
							<input class="form-control" type="text" name="username" id="username" required autocomplete="off"/>
						</div>
					</div>
	
					<div class="form-group">	
						<label class="control-label col-md-4 col-sm-4"  for="password" style="font-family:cursive; font-weight:bold;color:white">Password<sup>*</sup></label>
						<div class="col-sm-8 col-md-8">
							<input class="form-control"  type="password" name="password" id="password" required/>
						</div>
					</div>
					<br />
					<div class="form-group">
						<div class="col-md-offset-4 col-sm-offset-2">
							<input class="btn btn-success col-md-6" type="submit"   value="Login"/>
						</div>
					</div>
					<div class="form-group">
						<div class="col-md-offset-4 col-sm-offset-2">
							<a onclick="showRegistration(true)"style="font-family:cursive; font-weight:bold;color:white">New User ? Register here</a>
						</div>
					</div>
					<div class="form-group" id = "message">
						<div class="col">
							<span id="error" class="custom-alert alert alert-danger text-center">Invalid username  and password</span>
						</div>
					</div>
				</form>
			</div>
		</div>

	<div class="container" id="registration">
		<div class="col-sm-10 col-md-6 login-form" style="background-color:#6495ED;box-shadow:7px 7px 5px black ">
			<h2 class="col-md-offset-5"style="font-family:cursive; font-weight:bold;color:white">Registration</h2>
			<br />
			<form class="form-horizontal" action="Register_User.jsp" method="post">
				<div class="form-group">
					<label class="control-label col-md-4 col-sm-4" for="fullname"  style="font-family:cursive; font-weight:bold;color:white">Full Name<sup>*</sup></label>
					<div class="col-sm-8 col-md-8">
						<input class="form-control" type="text" name="fullname" id="fullname" required autocomplete="off"/>
					</div>
				</div>
				
				<div class="form-group">
					<label class="control-label col-md-4 col-sm-4" for="emailid" style="font-family:cursive; font-weight:bold;color:white">Email Id<sup></sup></label>
					<div class="col-sm-8 col-md-8">
						<input class="form-control" type="email" name="emailid" id="emailid" autocomplete="off" />
					</div>
				</div>

				<div class="form-group">
					<label class="control-label col-md-4 col-sm-4" for="username" style="font-family:cursive; font-weight:bold;color:white">Username<sup>*</sup></label>
					<div class="col-sm-8 col-md-8">
						<input class="form-control" type="text" name="username" id="reg-username" required autocomplete="off"/>
					</div>
				</div>

				<div class="form-group">	
					<label class="control-label col-md-4 col-sm-4"  for="password" style="font-family:cursive; font-weight:bold;color:white">Password<sup>*</sup></label>
					<div class="col-sm-8 col-md-8">
						<input class="form-control"  type="password" name="password" id="reg-password" required/>
					</div>
				</div>
				<br />
				<div class="form-group">
					<div class="col-md-offset-4 col-sm-offset-2">
						<input class="btn btn-success col-md-6" type="submit" value="Submit"/>
					</div>
				</div>
				<div class="form-group">
					<div class="col-md-offset-4 col-sm-offset-2">
						<a onclick="showRegistration(false)" style="font-family:cursive; font-weight:bold;color:white;">Go to Login</a>
					</div>
				</div>
				<div class="form-group" id = "message">
					<div class="col-md-offset-4 col-sm-offset-2">
						<span id="success" class="custom-alert alert alert-success">User added successfully</span>
						
					</div>
				</div>
			</form>
		</div>
	</div>
	
	<!-- jQuery library 
	<script src="assets/js/jquery.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="assets/js/bootstrap.js"></script>
	
 </body>
</html>



