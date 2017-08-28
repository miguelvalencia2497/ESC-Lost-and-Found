<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<jsp:useBean id="lostitems" type="java.sql.ResultSet" scope="request"/>

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

 <link rel="stylesheet" href="/resources/demos/style.css">
	 
	
<style>
	.inner-addon { 
		position: relative; 
	}
	
	
	
	.mh3{
		font-family: Trebuchet MS;
		color: white;
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
	
	.c{
		background: #292929;
		padding: 8px;
	}
	
	.main{
		height: 100%;
	}
	
	.d{
		margin-top: 50px;
		width: 70%;
		padding-bottom: 50px;
	}
	h3{
		font-family: Trebuchet MS;
		color: #404040;
	}
	
	.i{
		text-align: center;
	}
	
	li{
		font-size: 12px;
		text-align: left;
	}
	
	th{
		text-align: center;
		color: #CC9933;
	}
	
	td{
		text-align: center;
	}
	
	.table-hover tbody tr:hover td, .table-hover tbody tr:hover th {
		background-color: #C0C0C0;
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

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lost Items List</title>
</head>
<body style="background-image: url('Images/bg.jpg'); background-size:100%; background-attachment:fixed; background-repeat:repeat-x;">
  	<div class = "main">
	
		<div class="container-fluid c">
			<a href="#"><center><img src="Images/logo.png" style="width: 50px;"></center></a>
		</div>
	
		<div class="container d">
			
			<div class="row" style="text-align: center; background-color:  #F0F0F0; padding: 20px;">
				<div class="col-lg-12">
				<h3>List of all items</h3>
				<h4>Click <a href="index3.jsp">here</a> to go back home</h4>
				<br>
		
		<table class="table table-hover" style="text-align: center; width: 100%;">
			<tr>
				<th align="center">Item</th>
				<th align="center">Description</th>
				<th align="center">Date Lost</th>
				<th align="center">Lost At</th>
				<th align="center">Student Number</th>
				<th align="center">Contact Number</th>
				<th align="center">Delete</th>
				
			</tr>
		
			<% 
				while(lostitems.next()) {	
			%>
				<tr>
					<td><%=lostitems.getString("item")%></td>
					<td><%=lostitems.getString("description")%></td>
					<td><%=lostitems.getString("datelost")%></td>
					<td><%=lostitems.getString("lostat")%></td>
					<td><%=lostitems.getString("studentnum")%></td>
					<td><%=lostitems.getString("contactnum")%></td>
					<td align="center">
					  <a href="lostitemmaintenance.html?id=<%=lostitems.getInt("id")%>">
					  	<span class="glyphicon glyphicon-trash"></span>
					  </a>
					</td>
				</tr>			
		<% } %>
			
		</table>
</body>
</html>