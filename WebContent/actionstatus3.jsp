<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="css/bootstrap.min.css" rel="stylesheet">

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

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
	
	h4{
		font-family: Trebuchet MS;
		color: #404040;
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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Announcement Registration Status</title>
</head>
<body style="background-image: url('Images/bg.jpg'); background-size:100% 100%; background-attachment:fixed; background-repeat:repeat-x;">
	<div class = "main">
	
		<div class="container-fluid c">
			<a href="#"><center><img src="Images/logo.png" style="width: 50px;"></center></a>
		</div>
	
		<div class="container d" style="padding-bottom: 50px;">
		<center>
			<div class="panel panel-default" style="width: 50%; border: 0; margin-top: 50px;">
			  <div class="panel-heading" style="background-color: #292929;"><h3>ESC Lost and Found Management System</h3></div>
			  <div class="panel-body" style="margin-top:padding-bottom: 30px;">
				<%
				if (request.getParameter("success").equals("true")) { %>
					<h2>Successful Upload</h2> 
				<% } else { %>
				  	<h1>Something went wrong while processing your request</h1>		
				<% } %>
				<hr>
				<p><a href="index3.jsp">Click here to display the menu.</a></p>
				</div>
			</div>
		</center>
		</div>
	</div>
	
</body>
</html>