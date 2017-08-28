<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<jsp:useBean id="items" type="java.sql.ResultSet" scope="request"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
 <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ESC Lost And Found</title>

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
				<h4>Click <a href="home.html">here</a> to go back home</h4>
				<br>
				
				<table class="table table-hover" style="text-align: center; width: 100%;">
					<thead>
					  <tr>
						<th>Item</th>
						<th>Description</th>
						<th>Date</th>
						<th>Found at</th>
						<th>Found by</th>
						<th>Action-Edit</th>
						<th>Action-Delete</th>
					</tr>
					</thead>
					<tbody>
			
					<% 	while(items.next()) {	%>
				<tr>
					<td><%=items.getString("item")%></td>
					<td><%=items.getString("description")%></td>
					<td><%=items.getString("date")%></td>
					<td><%=items.getString("foundat")%></td>
					<td><%=items.getString("foundby")%></td>
					<td align="center">
					  <a href="itemmaintenance.html?id=<%=items.getInt("id")%>&action=edit">
					  	<span class="glyphicon glyphicon-pencil"></span>
					  </a>
					</td>
					<td align="center">
					  <a href="itemmaintenance.html?id=<%=items.getInt("id")%>&action=delete">
					  	<span class="glyphicon glyphicon-trash"></span>
					  </a>
					</td>
				</tr>			
					<% } %>
					</tbody>
				</table>
				<hr>
				Click <a href="index3.jsp">here</a> to go back home.
			</div>
			</div>
		</div>
	</div>
	

	</div>
	</div>
	
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <script src="js/bootstrap.min.js"></script>
  </body>
</html>