<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ESC Lost And Found</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">

	<style>
		.c{
			background: #292929;
			padding: 8px;
		}
		
		.main{
			height: 100%;
		}
		
		.d{
			margin-top: 50px;
			width: 100%;
			padding-bottom: 50px;
			text-align: center;
		}
		h3{
			font-family: Trebuchet MS;
			color: white;
		}
		.inner-addon { 
			position: relative; 
		}

		.inner-addon .glyphicon {
		  position: absolute;
		  padding: 10px;
		  pointer-events: none;
		}

		.left-addon .glyphicon  { left:  0px;}
		.right-addon .glyphicon { right: 0px;}

		.left-addon input  { padding-left:  30px; }
		.right-addon input { padding-right: 30px; }
		
		.i{
			text-align: center;
		}
		
		li{
			font-size: 12px;
			text-align: left;
		}
		.button{
			-webkit-transition: background 0.4s linear;
			-moz-transition: background 0.4s linear;
			-ms-transition: background 0.4s linear;
			-o-transition: background 0.4s linear;
			transition: background 0.4s linear;
			background-color: transparent;
			font-size: 15px;
			font-family: Trebuchet MS;
			border: 1px solid #292929 ;
			padding: 5px;
			width: 20%;
		}
		.button:hover{
			background-color:#292929 ;
			color: white;
		}
		button:focus {
		  outline: none
		}
	</style>
   
   </head>
  <body style="background-image: url('Images/bg.jpg'); background-size:100% 100%; background-attachment:fixed; background-repeat:repeat-x;">
    
	<div class = "main">
	
		<div class="container-fluid c">
			<a href="#"><center><img src="Images/logo.png" style="width: 50px;"></center></a>
		</div>
	
		<div class="container d" style="padding-bottom: 50px;">
		<center>
			<div class="panel panel-default" style="width: 50%; border:0; margin-top: 50px;">
			  <div class="panel-heading" style="background: #292929;"><h3>ESC Lost and Found Management System</h3></div>
			  <div class="panel-body" style="padding-bottom: 30px;">
				<h2>Add User Account</h2>
				<br>
				<form action="RegisterAccountServlet" method="post">
					<div class="inner-addon left-addon" style="width: 50%;">
							<input type="text" name="username" class="form-control" placeholder="Username" required="required"/>
							<span class="glyphicon glyphicon-user"></span>
					</div>
					<br>
					<div class="inner-addon left-addon" style="width: 50%;">
							<input type="password" name="password"class="form-control" placeholder="Password" required="required"/>
							<span class="glyphicon glyphicon-lock"></span>
					</div>
					<br>
					<div class="inner-addon left-addon" style="width: 50%;">
							<input type="password" name="confirmPass" class="form-control" placeholder="Confirm Password" required="required"/>
							<span class="glyphicon glyphicon-lock"></span>
					</div>						
				<br>
				<input type="checkbox" name="admin" value="true">&nbspadmin
				<br><br>
				<input type="submit" class="button" value="Submit">
				<br>
				<hr style="border-color: #D0D0D0;">
				Click <a href="home.html">here</a> to go back home
			</div>
			</div>
		</center>
		</div>
		</form>	
	</div>
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>