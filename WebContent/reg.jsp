<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Registration</title>
    <script>
function callalert(){
	var al = '<%=session.getAttribute("regalert")%>';
	if(al != "null"){
		if(al === "yes"){
			alert("Registration sccessful");
		}
		else{
			alert("Registration not sucessful");
		}
		<%session.removeAttribute("regalert");%>
	}
}
</script>
</head>
<style>

input[type=text],input[type=password],input[type=date],input[type=number],input[type=email],select, textarea {
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
  margin-top:90px;
}

body{background: #bdc3c7;
background: -webkit-linear-gradient(to bottom, #2c3e50, #bdc3c7);
background: linear-gradient(to bottom, #2c3e50, #bdc3c7);

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
<body onload="callalert()" style="margin: 0;">
<nav>
<div class="topnav">
  <a href='HOME.html' target="_self">Home</a>
  <a href='login.jsp' target="_self">Login</a>
  <a href='./info_pages/info.html' target="_self">Information</a>
  <a href='contact.jsp' target="_self">Contact Us</a>
  <a href='./aboutus.html' target="_self">About Us</a>
</div>
</nav>
    <div class="container">
	<h3 align="center">Register</h3>
	<form id = "regform" action = "addalumni" method="post">
        <label>FIRST NAME :</label> <input type="text" name="inp_fname" placeholder="FIRST NAME"/><br/>
        <label>LAST NAME :</label> <input type="text" name="inp_lname" placeholder="LAST NAME"/><br/>
        <label>REG NO :</label> <input type="text" name="inp_reg" placeholder="CB.EN.U4CSE-----"/><br/>
        <label>USERNAME :</label> <input type="text" name="inp_user" /><br/>
        <label>PASSWORD :</label> <input type="password" name="inp_pass" /><br/>
        <label>DOB :</label> <input type="date" name="inp_date" placeholder="dd-mm-yyyy"/><br/>
        <label>PHONE NUMBER :</label> <input type="number" name="inp_num" /><br/>
        <label>EMAIL :</label> <input type="email" name="inp_email" placeholder="abc@gmail.com"/><br/>
        <label>LINKED IN ACCOUNT :</label> <input type="text" name="inp_link" placeholder="link"/><br/>
        <input type="submit" />
    </form></div>
</body>
</html>