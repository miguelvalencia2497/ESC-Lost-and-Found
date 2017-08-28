<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:useBean id="announcementslist" type="java.sql.ResultSet" scope="request"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
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
	.announcement{
		width: 400px;
	}
	.glyphicon{
		font-size: 30px;
		color: black;
		-webkit-transition-duration: 0.3s;
		transition-duration: 0.3s;
		-webkit-transition-property: transform;
		transition-property: transform;
		-webkit-transform: translateZ(0);
		transform: translateZ(0);
		box-shadow: 0 0 1px rgba(0, 0, 0, 0);
	}
					
	.glyphicon:hover, .glyphicon:focus, .glyphicon:active{
		-webkit-transform: translateY(-3px);
		transform: translateY(-3px);
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
			  <div class="panel-heading" style="background-color: #292929;"><h3>ESC Lost and Found Management System</h3></div>
			  <div class="panel-body" style="margin-top:padding-bottom: 30px;">
				<h2>List of Announcements</h2>
				<% while(announcementslist.next()) {%>
					<img src="imageservlet.html?id=<%=announcementslist.getInt("id")%>" class="announcement"/><br>
					<strong>ID:</strong> <%=announcementslist.getString("id")%><br>		
					<strong>Title:</strong> <%=announcementslist.getString("title")%><br>
					<strong>Body:</strong> <%=announcementslist.getString("body") %><br><br>
					<a href="announcementmaintenance.html?id=<%=announcementslist.getInt("id")%>&action=delete"><span class="glyphicon glyphicon-trash"></span></a><br><br>
					<hr style="height: 2px; background-color: black">
				<%} %>
				<a href="index3.jsp">Click here to go back home</a>
			</div>
		</div>
				
		</center>
		</div>
	</div>
</body>
</html>