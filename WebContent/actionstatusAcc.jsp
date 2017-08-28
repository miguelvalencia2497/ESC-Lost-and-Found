<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
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
		h4{
			font-family: Trebuchet MS;
			color: #404040;
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
		
	</style>
   
   </head>
  <body style="background-image: url('Images/bg.jpg'); background-size:100% 100%; background-attachment:fixed; background-repeat:repeat-x;">
    
	<div class = "main">
	
		<div class="container-fluid c">
			<a href="#"><center><img src="Images/logo.png" style="width: 50px;"></center></a>
		</div>
	
		<div class="container d" style="padding-bottom: 50px;">
		<center>
			<div class="panel panel-default" style="width: 50%; border: 0; margin-top: 50px;">
			  <div class="panel-heading" style="background: #292929;"><h3>ESC Lost and Found Management System</h3></div>
			  <div class="panel-body" style="padding-bottom: 30px;">
				<h4>Successful Saved User Account</h4>
				<br/>
				<%
	if (request.getParameter("success").equals("true")) { %>
		<h2>Successful Registration</h2>
		<br/>
		<p>Username: ${ab.username}</p>
		<p>Password: ${ab.password}</p>
		<p>Admin: ${ab.admin}</p>

		
	<% } else { %>
	  <h1>Registration Failed</h1>		
	<% } %>				
				<hr style="border-color: #D0D0D0;">
				Click <a href="index3.jsp">here</a> to go back home
			  </div>
			</div>
		</center>
		</div>
		
	</div>
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</body>
</html>