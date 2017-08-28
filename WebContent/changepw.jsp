<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <jsp:useBean id="rs" type="java.sql.ResultSet" scope="request"/>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form action="updatepassword" method="post">
	<select name="id">
	<% while(rs.next()){ %>
	<option value="<%=rs.getInt("id")%>"><%=rs.getString("username") %></option>
	<%} %>
	</select>
	<input type="hidden" name="action" value="edit">
	<input type="submit" value="Submit">
	</form>
	

</body>
</html>