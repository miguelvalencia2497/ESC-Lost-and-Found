<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>

<link href="css/bootstrap.min.css" rel="stylesheet">
<link rel="stylesheet" href="css/jquery-ui.css">
<script src="js/html5shiv.min.js"></script>
<script src="js/respond.min.js"></script>
<script src="js/scroll.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/validate.js"></script>

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
	.form-control{
		color:   #989898 
	}
</style>

<title>Add Found Item</title>
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
			  <div class="panel-body" style="margin-top: 30px; padding-bottom: 30px;">
				<form action="additem.html" method="post">
					<h4>Add Lost Item</h4>
					<br>		
					<div class="inner-addon left-addon" style="width: 50%;">
							<input type="text" id="item" name="item" class="form-control" placeholder="Item" required="required"/>
							<span class="glyphicon glyphicon-phone"></span>
					</div>
					<br>
					<div class="inner-addon left-addon" style="width: 50%;">
							<input type="text" id="description" name="description" class="form-control" placeholder="Description" required="required"/>
							<span class="glyphicon glyphicon-list-alt"></span>
					</div>
					<br>
					<div class="inner-addon left-addon" style="width: 50%;">
							<input type="date" id="date" name="date" class="form-control" id="bd" required="required" style="padding:0; padding-left: 30px;">
							<span class="glyphicon glyphicon-calendar"></span>
					</div>
					<br>
					<div class="inner-addon left-addon" style="width: 50%;">
							<input type="text" id="foundat" name="foundat" class="form-control" placeholder="Found At" required="required"/>
							<span class="glyphicon glyphicon-map-marker"></span>
					</div>
					<br>
					<div class="inner-addon left-addon" style="width: 50%;">
							<input type="text" id="foundby" name="foundby" class="form-control" placeholder="Found By" required="required"/>
							<span class="glyphicon glyphicon glyphicon-user"></span>
					</div>
					<br>	
					
					<input type="submit" class="button" value="Submit">
					<hr style="border-color: #D0D0D0;">
					Click <a href="index3.jsp">here</a> to go back home
				</form>
				</div>
			</div>
		</center>
		</div>
	</div>
			
</body>
</html>