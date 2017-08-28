<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Report Lost Item</title>
</head>
<body>
	<form action="reportitem.html" method="post">
		<p>Item: <input type="text" id="item" name="item"></p>
		<p>Description: <input type="text" id="description" name="description"></p>
		<p>Date Lost: <input type="date" id="date" name="date"></p>
		<p>Lost At: <input type="text" id="lostat" name="lostat"></p>
		<p>Student Number: <input type="text" id="studnum" name="studnum"></p>
		<p>Contact Number: <input type="text" id="contact" name="contact"></p>
		
		<p><input type="submit" value="submit"></p>
	</form>
</body>
</html>