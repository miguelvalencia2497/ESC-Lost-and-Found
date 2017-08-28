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
    
<script>
	function selectFunc(a) {
		if(a.value == "date") {
			document.getElementById("find2").style.display="inline";
			document.getElementById("find1").style.display="none";
		}
		else{
			document.getElementById("find1").style.display="inline";
			document.getElementById("find2").style.display="none";
		}
	}
</script>



<style>
	.announcement{
		width: 400px;
	}
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
	.inner-addon { 
		position: relative; 
	}

	.inner-addon .glyphicon {
	  position: absolute;
	  padding: 10px;
	  margin-top: 40px;
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
	
	.carousel-inner > .item > img,
  .carousel-inner > .item > a > img {
      margin: auto;
  }
  
  #myCarousel{
  	width: 100%;
  	height: 70%;
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
		width: 70%;
		text-align: center;
	}
	.button:hover{
		background-color:#292929 ;
		color: white;
	}
	button:focus {
	  outline: none
	}
</style>
</head>
<body style="background-image: url('Images/bg.jpg'); background-size:100% 100%; background-attachment:fixed; background-repeat:repeat-x;">
	<div class = "main">
	
		<div class="container-fluid c">
			<a href="#"><center><img src="Images/logo.png" style="width: 70px;"></center></a>
		</div>
		
		<div class="container d">
			
			<div class="row" style="text-align: center; background-color:  #F0F0F0;">
				
				<div class="col-lg-4">
					<div style="padding-bottom: 50px; margin-top: 50px;">
						<h3>SEARCH FOR LOST ITEM</h3>
						<br/>
						
							<form action="listfind.html" method="post">
								
								<div class="inner-addon right-addon">
								<select name="choice" id="choice" onchange="selectFunc(this)" style="float: left;">
									<option value="item">Item</option>
									<option value="description">Description</option>
									<option value="date">Date</option>
									<option value="foundat">Room Lost</option>
								</select>
								<br>
								<br>
									<input type="text" name="find" id="find1" class="form-control">
									<input type="date" name="find2" id="find2" style="display: none;" class="form-control">
									<span class="glyphicon glyphicon-search"></span>
								</div>
								<br>
									<input type="submit" class="button" value="Submit" style="float: left;">
								<br>
								<br>
							</form>
						
						<a data-toggle="modal" data-target="#reportItemModal"><p style="text-align: left;">Want to report your lost item?</p></a>
						
						<br/>
						<div style="padding-left: 15px;">
							<h4 style="text-align: left;">Guidelines:</h4>
							<ul>
								<li>Lorem ipsum dolor sit amet, te mea esse velit.</li>
								<li>Lorem ipsum dolor sit amet, te mea esse velit.</li>
								<li>Lorem ipsum dolor sit amet, te mea esse velit.</li>
								<li>Lorem ipsum dolor sit amet, te mea esse velit.</li>
							</ul>
						</div>
					</div>
				</div>		
				<div class="col-md-8">
					<div style="padding-bottom: 50px; margin-top: 50px; border-left: 1px solid  #D0D0D0;">
						<h3>ANNOUNCEMENTS</h3>
						<br>
						<div class="container-fluid" style="padding-bottom: 50px;">
							<br>
							<br>
							<div id="myCarousel" class="carousel slide" data-ride="carousel">
							  <!-- Indicators -->
							  <ol class="carousel-indicators">
							    	<%!int i = 0;%>
							    	<% while(announcementslist.next()) {%>
								      <li data-target="#myCarousel" data-slide-to="<%=i %>" class="active"></li>
								      <%i++;%>
								    <%} %>
							  </ol>
							  
								<%announcementslist.beforeFirst();%>
							
								<%announcementslist.next();%>
							
							
							 <div class="carousel-inner" role="listbox">
								<div class="item active">
									<img src="imageservlet.html?id=<%=announcementslist.getString("id")%>" alt="<%=announcementslist.getString("title")%>" style="height: 500px;"/>
									<div class="carousel-caption">	
									<h3 style="color: white;"><%=announcementslist.getString("title")%></h3>
									<p><%=announcementslist.getString("body") %></p>
									</div>
								</div>
							
							    <% while(announcementslist.next()) {%>
								<div class="item">
									<img src="imageservlet.html?id=<%=announcementslist.getString("id")%>" alt="<%=announcementslist.getString("title")%>" style="height: 500px;"/>
									<div class="carousel-caption">	
									<h3 style="color: white;"><%=announcementslist.getString("title")%></h3>
									<p><%=announcementslist.getString("body") %></p>
									</div>
								</div>
								<%} %>
							
							  </div>
							
							  <!-- Left and right controls -->
							    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
							      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
							      <span class="sr-only">Previous</span>
							    </a>
							    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
							      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
							      <span class="sr-only">Next</span>
							    </a>
							  </div>
							</div>
				</div>
			</div>
		</div>
		
		
		<!-- Repost Item Modal -->
		<div id="reportItemModal" class="modal fade" role="dialog">
		  <div class="modal-dialog">

			<!-- Modal content-->
			<div class="modal-content">
			  <div class="modal-header" style="text-align: center;">
				<button type="button" class="close" data-dismiss="modal">&times;</button>
				<h1 class="modal-title">Edit Student</h1>
			  </div>
			  <div class="modal-body" style="text-align: center;">				
				<form action="reportitem.html" method="post">
					<p>Item: <input type="text" id="item" name="item"></p>
					<p>Description: <input type="text" id="description" name="description"></p>
					<p>Date Lost: <input type="date" id="date" name="date"></p>
					<p>Lost At: <input type="text" id="lostat" name="lostat"></p>
					<p>Student Number: <input type="text" id="studnum" name="studnum"></p>
					<p>Contact Number: <input type="text" id="contact" name="contact"></p>
				
				<p><input type="submit" value="submit"></p>
				</form>
			  </div>
			  <div class="modal-footer">
				<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
			  </div>
			</div>

		  </div>
		</div>
</body>
</html>