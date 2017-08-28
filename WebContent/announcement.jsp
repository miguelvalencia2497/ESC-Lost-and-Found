<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link href="css/bootstrap.min.css" rel="stylesheet">

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

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

<title>Insert title here</title>
</head>
<body style="background-image: url('Images/bg.jpg'); background-size:100% 100%; background-attachment:fixed; background-repeat:repeat-x;">
  	<div class = "main">
	
		<div class="container-fluid c">
			<a href="#"><center><img src="Images/logo.png" style="width: 50px;"></center></a>
		</div>
	
		<div class="container d" style="padding-bottom: 50px;">
		<center>
			<form action="addannouncement.html" method="post" enctype="multipart/form-data">
			<div class="panel panel-default" style="width: 50%; border: 0; margin-top: 50px;">
				  <div class="panel-heading" style="background: #292929;"><h3>ESC Lost and Found Management System</h3></div>
				  <div class="panel-body" style="padding-bottom: 30px;">
						<h2>Announcement</h2>
						<br>
						<h4><strong>Title</strong></h4>
						<input type="text" name="title" id="title" required="required">
						<h4><strong>Body</strong></h4>
						<textarea name="body" id="body" rows="10" cols="50"></textarea><br/>
						<h4><strong>Upload Photo</strong></h4>
						<input type="file" name="image" id="image" style="width:30%;"> 
						<br/>
						<hr style="border-color: #D0D0D0;">
						<input type="submit" class="button" value="Submit">
					</div>
					</div>
				</form>
			</center>
		</div>
		
	</div>
</body>
</html>