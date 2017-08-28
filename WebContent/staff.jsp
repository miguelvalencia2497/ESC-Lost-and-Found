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
			background-color: #292929;
			color: white;
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
		.button:focus {
		  outline: none
		}
		.menu{
			-webkit-transition: background 0.4s linear;
			-moz-transition: background 0.4s linear;
			-ms-transition: background 0.4s linear;
			-o-transition: background 0.4s linear;
			transition: background 0.4s linear;
			background-color: transparent;
			font-size: 15px;
			font-family: Trebuchet MS;
			border: 1px solid #d3732c;
			padding: 5px;
			width: 20%;
		}
		.menu:hover{
			background-color:#f3a80c;
			color: white;
			border: 1px solid #f3a80c;
			
		}
		.menu:focus {
		  outline: none
		}
		a{
			color: #d3732c;
			-webkit-transition: background 0.4s linear;
			-moz-transition: background 0.4s linear;
			-ms-transition: background 0.4s linear;
			-o-transition: background 0.4s linear;
			transition: background 0.4s linear;
		}
		a:hover{
			color: white;
			text-decoration: none;
		}
		
	</style>
   
   </head>
  <body style="background-image: url('Images/bg.jpg'); background-size:100%; background-attachment:fixed; background-repeat:repeat-x;">
    
	<div class = "main">
	
		<div class="container-fluid c">
			<a href="#"><center><img src="Images/logo.png" style="width: 50px;"></center></a>
		</div>
	
		<div class="container d" style="padding-bottom: 50px;">
		<center>
			<div class="panel panel-default" style="width: 50%; border: 0; margin-top: 50px;">
			  <div class="panel-heading" style="background-color: #292929;"><h3>ESC Lost and Found Management System</h3></div>
			  <div class="panel-body" style="margin-top: 30px; padding-bottom: 30px;">
			 
				<a href="listitems.html"><input type="button" class="menu" value="List all items"></a>
				
				<a href="add.jsp"><input type="button" class="menu" value="Add item"></a>
			
				<hr style="border-color: #D0D0D0;">
				<form action="LogoutServlet" method="post">
					<input type="submit" class="button" value="Logout">
				</form>
			 </div>
			</div>
		</center>
		</div>
		
	</div>
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>