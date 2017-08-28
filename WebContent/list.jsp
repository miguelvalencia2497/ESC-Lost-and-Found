<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<jsp:useBean id="list" type="java.sql.ResultSet" scope="request"/>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link href="css/bootstrap.min.css" rel="stylesheet">

<script src="js/jquery.min.js"></script>
<script src="js/bootstrap.min.js"></script>

<title>Item Listing</title>

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
			width: 70%;
			padding-bottom: 50px;
		}
		h3{
			font-family: Trebuchet MS;
			color: #404040 ;
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
		
		.table-hover tbody tr:hover td, .table-hover tbody tr:hover th {
			background-color: #C0C0C0;
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
			<h3>SEARCH RESULTS</h3>
			<h4>Click <a href="index.jsp">here</a> to go back home</h4>
			<br>
	
	<table class="table table-hover table-responsive" style="text-align: center;">
		<thead>
			<tr>
				<th align="center">ID</th>
				<th align="center">Item</th>
				<th align="center">Description</th>
				<th align="center">Date Found</th>
				<th align="center">Found At</th>
				<th align="center">Found By</th>
			</tr>
		</thead>
		<tbody>
			<% 
				while(list.next()) {	
			%>
		
				<tr>
					<td><%=list.getString("id")%></td>
					<td><%=list.getString("item")%></td>
					<td><%=list.getString("description")%></td>
					<td><%=list.getString("date")%></td>
					<td><%=list.getString("foundat")%></td>
					<td><%=list.getString("foundby")%></td>
				</tr>
	<% } %>
		</tbody>
	</table>
	</div>
	</div>
	</div>
</body>
</html>