<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


</head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<head>
<title>Profile</title>

</head>
<script>
function logout(){
	window.location.replace("logout");
}

function callalert(){
	var al = '<%=session.getAttribute("insertcheck")%>';
	if(al != "null"){
		if(al === "yes"){
			alert("Insertion sccessful");
		}
		else{
			alert("Insertion not sucessful");
		}
		<%session.removeAttribute("insertcheck");%>
	}
}

    function validateForm()
{
     
  var x = document.forms["newad"]["FirstName"];
  var y=document.forms["newad"]["ResearchArea"];
   var z=document.forms["newad"]["YearsOfExperience"];
   var phone=document.forms["newad"]["PersonalPhoneNumber"];
  if (x.value == "") {
    window.alert("Name field is mandatory"); // confirm // prompt
    
  }
  
  if (y.value == "" ) {
    window.alert("Research area field is mandatory"); // confirm // prompt
   
  }
  if (z.value == "" ) {
    window.alert("Year of experience field is mandatory"); // confirm // prompt
    
  }
  
  if (phone.value == "")                           
                { 
                    window.alert("Please enter your telephone number."); 
                    
                } 
 if (z.value.length>2)                           
 { 
                    window.alert("Please Enter a valid years of experience"); 
                    
 } 
 if (phone.value.length!=10)                           
 { 
                    window.alert("Please Enter a valid Phone Number"); 
                   
 } 
 else
	 
				window.alert("Successfully updated");
			
  
//   if (x != "" || x != null && y!=null || y!="" && z!=null || !="") {
     // confirm // prompt
//     return false;}

}

</script>
</head>
<style >
.lgout{
margin-top:10px;
margin-left:1400px;
width:80px;
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
.profile {
   width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
  /* opacity: 0.8; */
}
.search {
  font-size: inherit;
  border: 2px solid #ddd;
  background-color: #ddd;
  /* border-left: 0; */
  border-radius:  0.5cm;
  outline: 0;
  padding: 0 0.45cm;
  cursor: pointer;
  font-weight: bold;
  height:40px;
  width:300px;
}
form h1 {
color: black;
text-align: center;
}
form {
font-size: 15px;
color: black;
}
input {
display: block;
clear: both;
}

label input {
display: block;
color: red;
}
body {
background: #bdc3c7;
background: -webkit-linear-gradient(to bottom, #2c3e50, #bdc3c7);
background: linear-gradient(to bottom, #2c3e50, #bdc3c7);
}
</style>


<body onload="callalert()" "onsubmit="validateForm()" style="margin: 0;">

<%String u = (String)session.getAttribute("utype"); 
if((String)session.getAttribute("utype") == null){
	response.sendRedirect("./error.html");
}
else{%>
<nav>
<div class="topnav">
  <a href='profile.jsp' target= "_self">Events</a>
  <a href='./cal.jsp' target= "_self">Calendar</a>
  <a href='./faculty_profilejsp.jsp' target= "_self">Profile</a>
  <a href='./val_reg.jsp' target= "_self">Registration Details</a>
  <a href='./election.jsp' target= "_self">Hosting election</a>
  <input type="button" onclick="logout()" class="lgout" value="LOGOUT"/>
</div>
</nav>
<%} %>
<h1 style="text-align:center">AMRITA SCHOOL OF ENGINEERING</h1>
<h1 style="text-align:center">CSE</h1>
<h2 style="text-align:center">Faculty Profile</h2>
<table>
<img style="margin-left:25px;" src="profile.jpg" width="100" height="100" />
<tr><td><input type="file" name="image" ></td></tr>
<tr><td><input name="Submit" type="submit" value="Upload image"></td></tr>
</table>


<form name="newad"  action="faculty"  method="post" >

<fieldset>
<center><div class="profile">
<h2>Personal Details</color></h2>

<p>
<label for="fullname">Full Name</label>
<input type="text"  name="FirstName" class="search" >
</p>
<p>
<label for="dob">Date Of Birth</label>
<input type="datetime-local" name="DateOfBirth" class="search">
</p>
<p>
<label for="address">Residential Address</label>
<input type="textarea" name="ResidentialAddress" class="search">
</p>
<p>
<label for="full name">Personal Phone Number </label>
<input type="tel" name="PersonalPhoneNumber" class="search" >
</p>
</fieldset>
<fieldset>
<center><div class="profile">
<h2>Acadamic Information</h2>
<p>
<label for="ptin">Years of Experience </label>
<input type="text" id="yr" name="YearsOfExperience" class="search" >
</p>
<p>
<label for="bname">Research area</label>
<input type="text" id="ra" name="ResearchArea" class="search">
</p>
<label for="full baddress">Achivements</label>
<input type="textarea" id="ac"name="Achievements"class="search">
</p>
<p>
<label for="option">Qualification </label>
<select>
<option id="sector" class="search" name="Qualification">
<option value="edu">M.Tech </option>
<option value="env">M.E</option>
<option value="tourism">Other</option>
</select>
</p>
<p>
</fieldset>

<p><input type="submit">  <br>  <br>  
                              
</form>




</body>
</html>