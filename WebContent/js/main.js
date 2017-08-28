function validateLogin()
		{
			var unBox = document.querySelector("#un");
			var pwBox = document.querySelector("#pw");
			var a = document.getElementById("notice").value;
			var b = document.getElementById("un").value;
			var c = document.getElementById("pw").value;
			
			var count = 0;
				
			// U S E R N A M E
				if (b=="username" || b==null || b== "") {
					unBox.style.backgroundColor = "#B40431";
					unBox.style.color = "white";
					unBox.style.border = "1px solid black";
					document.getElementById("notice").value = "Enter username.";
					return false;
				}
				
				if (b.length >= 6) {
					for(var i=0; i<b.length; i++) {
						if (isNaN(b.charAt(i))== false) {
							count++;
						}
					}
					if (count == 0) {
					unBox.style.backgroundColor = "#B40431";
					unBox.style.color = "white";
					unBox.style.border = "1px solid black";
					document.getElementById("notice").value = "Username must contain at least 1 number.";
					return false;
					} else {
						document.getElementById("notice").value = "";
					}
					
				} else {
					unBox.style.backgroundColor = "#B40431";
					unBox.style.color = "white";
					unBox.style.border = "1px solid black";
					document.getElementById("notice").value = "Username must contain at least 6 characters.";
					return false;
				}
			
			
			
			// P A S S W O R D 
				if (c=="password" || c==null || c== "") {
					unBox.style.backgroundColor = "#F7F6F6";
					unBox.style.color = "grey";
					unBox.style.border = "none";
					pwBox.style.backgroundColor = "#B40431";
					pwBox.style.color = "white";
					pwBox.style.border = "1px solid black";
					document.getElementById("notice").value = "Enter password.";
					return false;
				}
				
				count = 0;
				
				if (c.length >= 8) {
					for(var i=0; i<c.length; i++) {
						if (isNaN(c.charAt(i))== false) {
							count++;
						}
					}
					if (count == 0) {
						pwBox.style.backgroundColor = "#B40431";
						pwBox.style.color = "white";
						pwBox.style.border = "1px solid black";
						document.getElementById("notice").value = "Password must contain at least 1 number.";
						return false;
					} else {
						pwBox.style.backgroundColor = "#F7F6F6";
						pwBox.style.color = "grey";
						pwBox.style.border = "none";
						document.getElementById("notice").value = "";
						
					}
					
				} else {
					pwBox.style.backgroundColor = "#B40431";
					pwBox.style.color = "white";
					pwBox.style.border = "1px solid black";
					document.getElementById("notice").value = "Password must contain at least 8 characters.";
					return false;
				}
				
		alert("Success");
		return true;
		
	}	
	
function validateRegister()
		{
			var unBox = document.querySelector("#un");
			var pwBox = document.querySelector("#pw");
			var fnBox = document.querySelector("#fn");
			var lnBox = document.querySelector("#ln");
			var bdBox = document.querySelector("#bd");
			var a = document.getElementById("notice").value;
			var b = document.getElementById("un").value;
			var c = document.getElementById("pw").value;
			var d = document.getElementById("fn").value;
			var e = document.getElementById("ln").value;
			var f = document.getElementById("bd").value;
			var count = 0;
				
			// U S E R N A M E
				if (b=="username" || b==null || b== "") {
					unBox.style.backgroundColor = "#B40431";
					unBox.style.color = "white";
					unBox.style.border = "1px solid black";
					document.getElementById("notice").value = "Enter username.";
					return false;
				}
				
				if (b.length >= 6) {
					for(var i=0; i<b.length; i++) {
						if (isNaN(b.charAt(i))== false) {
							count++;
						}
					}
					if (count == 0) {
					unBox.style.backgroundColor = "#B40431";
					unBox.style.color = "white";
					unBox.style.border = "1px solid black";
					document.getElementById("notice").value = "Username must contain at least 1 number.";
					return false;
					} else {
						document.getElementById("notice").value = "";
					}
					
				} else {
					unBox.style.backgroundColor = "#B40431";
					unBox.style.color = "white";
					unBox.style.border = "1px solid black";
					document.getElementById("notice").value = "Username must contain at least 6 characters.";
					return false;
				}
			
			
			
			// P A S S W O R D 
				if (c=="password" || c==null || c== "") {
					unBox.style.backgroundColor = "#F7F6F6";
					unBox.style.color = "grey";
					unBox.style.border = "none";
					pwBox.style.backgroundColor = "#B40431";
					pwBox.style.color = "white";
					pwBox.style.border = "1px solid black";
					document.getElementById("notice").value = "Enter password.";
					return false;
				}
				
				count = 0;
				
				if (c.length >= 8) {
					for(var i=0; i<c.length; i++) {
						if (isNaN(c.charAt(i))== false) {
							count++;
						}
					}
					if (count == 0) {
						pwBox.style.backgroundColor = "#B40431";
						pwBox.style.color = "white";
						pwBox.style.border = "1px solid black";
						document.getElementById("notice").value = "Password must contain at least 1 number.";
						return false;
					} else {
						pwBox.style.backgroundColor = "#F7F6F6";
						pwBox.style.color = "grey";
						pwBox.style.border = "none";
						document.getElementById("notice").value = "";
						
					}
					
				} else {
					pwBox.style.backgroundColor = "#B40431";
					pwBox.style.color = "white";
					pwBox.style.border = "1px solid black";
					document.getElementById("notice").value = "Password must contain at least 8 characters.";
					return false;
				}
				
			// F I R S T N A M E
				count = 0;
				
				if (d=="First Name" || d==null || d== "") {
					fnBox.style.backgroundColor = "#B40431";
					fnBox.style.color = "white";
					fnBox.style.border = "1px solid black";
					document.getElementById("notice").value = "Enter first name.";
					return false;
				} else {
				
					for(var i=0; i<d.length; i++) {
						if (isNaN(d.charAt(i))== false) {
							count++;
						}
					}
					
					if (count > 0) {
						fnBox.style.backgroundColor = "#B40431";
						fnBox.style.color = "white";
						fnBox.style.border = "1px solid black";
						document.getElementById("notice").value = "Invalid first name.";
						return false;
					} else {
						fnBox.style.backgroundColor = "#F7F6F6";
						fnBox.style.color = "grey";
						fnBox.style.border = "none";
						document.getElementById("notice").value = "";
						
					}
					
				}
			
			// L A S T N A M E
				count = 0;
				
				if (e=="Last Name" || e==null || e== "") {
					lnBox.style.backgroundColor = "#B40431";
					lnBox.style.color = "white";
					lnBox.style.border = "1px solid black";
					document.getElementById("notice").value = "Enter last name.";
					return false;
				} else {
				
					for(var i=0; i<e.length; i++) {
						if (isNaN(e.charAt(i))== false) {
							count++;
						}
					}
					
					if (count > 0) {
						lnBox.style.backgroundColor = "#B40431";
						lnBox.style.color = "white";
						lnBox.style.border = "1px solid black";
						document.getElementById("notice").value = "Invalid last name.";
						return false;
					} else {
						lnBox.style.backgroundColor = "#F7F6F6";
						lnBox.style.color = "grey";
						lnBox.style.border = "none";
						document.getElementById("notice").value = "";
						
					}
					
				}
				
			// B I R T H D A Y
				
				if (f=="Last Name" || f==null || f== "") {
					bdBox.style.backgroundColor = "#B40431";
					bdBox.style.color = "white";
					bdBox.style.border = "1px solid black";
					document.getElementById("notice").value = "Enter birthday.";
					return false;
				}
				
			
				
		alert("Success");
		return true;
		
	}

	$(document).ready(function(){
		 $("clr").click(function(){
			document.getElementById("pw").value = "";
			document.getElementById("un").value = "";
			document.getElementById("fn").value = "";
			document.getElementById("ln").value = "";
			document.getElementById("bd").value = "mm/dd/yyyy";
		 });
	 }); 
	 
	$(function() {
		$( "#datepicker" ).datepicker();
	});

		