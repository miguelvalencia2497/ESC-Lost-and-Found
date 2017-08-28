<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	
	<%
		if (request.getParameter("success").equals("true")) { %>
	  	<h2 align="center">Successful record update.</h2>
		<p align="center">Item: ${item.item}</p>
		<p align="center">Description: ${item.description}</p>
		<p align="center">Date: ${item.date}</p>
		<p align="center">Found At: ${item.foundat}</p>
		<p align="center">Found By: ${item.foundby}</p>
		
	<% } else { %>
	  <h1>Item record update failed</h1>		
	<% } %>
</body>
</html>