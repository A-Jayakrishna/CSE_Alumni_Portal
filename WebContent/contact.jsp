<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

body {font-family: Arial, Helvetica, sans-serif;
		background-color :  #efb050 ;}
* {box-sizing: border-box;}

input[type=text],input[type=email],select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=submit] {
  background-color: #4CAF50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type=submit]:hover {
  background-color: #45a049;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  max-width: 500px;
  margin: auto;
  padding: 10px;
  margin-top:140px;
}

body {
  margin: 0;
  font-family: Arial, Helvetica, sans-serif;
}

.topnav {
  overflow: hidden;
  background-color: #333;
}

.topnav a {
  float: left;
  color: #f2f2f2;
  text-align: center;
  padding: 14px 16px;
  text-decoration: none;
  font-size: 17px;
}

.topnav a:hover {
  background-color: #ddd;
  color: black;
}

.topnav a.active {
  background-color: #3ed7f2;
  color: white;
}


</style>
<script>
function callalert(){
	var al = '<%=session.getAttribute("conalert")%>';
	if(al != "null"){
		if(al === "yes"){
			alert("Complaint Registered");
		}
		else{
			alert("Complaint Registration not Sucessful");
		}
		<%session.removeAttribute("conalert");%>
	}
}
</script>
</head>
<body onload="callalert()">
<nav>
    <div class="topnav">
      <a href='HOME.html' target="_self">Home</a>
      <a href='login.jsp' target="_self">Login</a>
      <a href='./info_pages/info.html' target="_self">Information</a>
      <a href='contact.jsp' target="_self">Contact Us</a>
      <a href='aboutus.html' target="_self">About Us</a>
    </div>
    </nav>

<div class="container">
  <form action="concheck" method="post" name="conform">
  <h3 align="center">Contact Form</h3>
    <label for="fname">Name</label>
    <input type="text" id="name" name="name" placeholder="Your name.." required>

    <label for="lname">Email ID</label>
    <input type="email" id="mail" name="mail" placeholder="Your last name.." required>

    <label for="roll_id">Student ID</label>
    <input type="text" id="roll_id" name="roll_id" placeholder="Student Id" required>

    <label for="subject">Reason</label>
    <textarea id="subject" name="subject" placeholder="Write something.." style="height:200px" required></textarea>

    <input type="submit" value="Submit">
  </form>
</div>

</body>
</html>