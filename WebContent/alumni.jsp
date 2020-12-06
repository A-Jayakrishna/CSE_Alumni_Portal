<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
  input[type=text],input[type=number],input[type=email],select, textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type=date]
{
  width:20%;
  padding: 12px;
  border: 1px solid #ccc;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}
input[type=email]{
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;

}

.lgoutalu{
margin-top:15px;
margin-left:900px;
width:80px;
}



.container {
  
  background-color:#f2f2f2;
  
  max-width: 800px;
  margin: auto;
  padding: 80px;
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
<script>
function logout(){
	window.location.replace("logout");
}
 function change(name) {
        //Reference the Button.
        var btnSubmit = document.getElementById("btnSubmit");
 
        //Verify the TextBox value.
        if (name.value.trim() != "") {
            //Enable the TextBox when TextBox has value.
            btnSubmit.disabled = false;
        } else {
            //Disable the TextBox when TextBox is empty.
            btnSubmit.disabled = true;
        }
};

function fun(){  
  var fname = document.forms["myForm"]["fname"].value;
  var lname = document.forms["myForm"]["fname"].value;
  var reg=document.forms["myForm"]["reg"].value;
  
  var mob_no = document.forms["myForm"]["mob"].value;
  var mob_no_len = mob_no.length;
  


  if (fname == "" & lname == "") {
    alert("Name must be filled out");
    return false;
  }
  else  if (reg == "") {
    alert("Invalid reg Number");
    return false;
  }
  else  if (mob_no_len != 10) {
	    alert("Invalid Mobile Number");
	    return false;
	  }
  
 
 
  }

function callalert(){
	var al = '<%=session.getAttribute("isupdated")%>';
	if(al != "null"){
		if(al === "yes"){
			alert("Updation sccessful");
		}
		else{
			alert("Updation not sucessful");
		}
		<%session.removeAttribute("isupdated");%>
	}
}
</script>
</head>


<!-- <div class="topnav">
  <a href="#home">Home</a>
  <a href='news.html'>News</a>
  <a href='evenys_temp2.html'>Events</a>
  <a href='contact.html'>Contact</a>
  <a href='aboutus.html'>About Us</a>
</div>
<br>
<br> -->
<body onload="callalert()" style="margin: 0;">

<%String u = (String)session.getAttribute("utype"); 
if((String)session.getAttribute("utype") == null){
	response.sendRedirect("./error.html");
}
else{
%>
<nav>
<div class="topnav">
<a href='profile.jsp' target= "_self">Events</a>
  <a href='./cal.jsp' target= "_self">Calendar</a>
  <a href='./allalumni.jsp' target= "_self">Alumni</a>
  <a href='./alumni.jsp' target= "_self">Profile</a>
  <a href='./payment.jsp' target= "_self">Donation</a>
  <a href='./voting.jsp' target= "_self">Election</a>
  <input type="button" onclick="logout()" class="lgoutalu" value="LOGOUT"/>
</div>
</nav>
<%} %>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ncpproj","root","Rdsaccount#1");
Statement stmt=con.createStatement();
String usr = (String)session.getAttribute("uname");
String sql = "select * from alumniinformation where usern='"+usr+"'";
ResultSet rs=stmt.executeQuery(sql);
rs.next();
%>
  <div class="container">
<h1  style="text-align: center;">Student Profile</h1>
  <br>
  <br>
<form id = "proform" name="myForm" action = "changedata" method="POST" onsubmit="return(fun());">
  <table>
    <img  src="profile.jpg" width="200" height="200" />
    <br>

    <tr><td><input type="file" name="image" ></td></tr>
    
    </table>
  
     <h3>Personal Details</h3>
     <br>

      <label>First Name :</label> <input type="text" name="fn" onkeyup="change(this)" id="fname" placeholder="First Name"   required pattern="[a-zA-Z]+" value=<%= rs.getString(2)%> /><br/>
      <label>Last Name :</label> <input type="text" name="ln" onkeyup="change(this)" id="lname"  placeholder="Last Name"  required pattern="[A-Za-z]+" value=<%= rs.getString(3)%> /><br/>
      <label>Registration No :</label> <input type="text" name="reg" value=<%= rs.getString(4)%> onkeyup="change(this)" placeholder="-----" /><br/>
      <label>Date Of Birth :</label> <input type="text" name="ddate" placeholder="dd-mm-yyyy"/><br/>
      <label>Email ID :</label> <input type="email" name="mailid" onkeyup="change(this) " id="mail"   placeholder="xyz@gmail.com" pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" value=<%= rs.getString(6)%> required/><br/>
   
      
      <label>Mobile Number :</label> <input type="text" name="phno" onkeyup="change(this)"  id="mob" require pattern="{10}"  value=<%= rs.getString(7)%>  /><br/>
    
   

      <br>
      <br>
      <br>
      
      
    
      <h3>Academic Details</h3>
      <br>

      <label>Year Of Passing :</label> <input type="number"  name="yr" value=<%= rs.getString(8)%> pattern="^\d{4}$"/><br/>
      <label>
        Qualification :
        <select name="qua">
      <option>B.Tech</option>
      <option>M.Tech</option>
      <option>M.B.A</option>
    </select>
      </label><br>
      <label>Achievements  :</label> <input type="text" name="ach" value=<%= rs.getString(10)%> /><br/>
      <br>
      <br>
      <br>
      <h3>Professional Details</h3>
      <br>
      <label>Working At :</label> <input type="text" name="com" onkeyup="change(this)" placeholder="Name of the Company" value=<%= rs.getString(11)%> /><br/>
      
      <label>Role :</label> <input type="text" onkeyup="change(this)" name="role" placeholder="xxxxxxx" value=<%= rs.getString(12)%>/><br/>
      
      <label>Experience :</label>  <select name="exp" onkeyup="change(this)">
        <option>less than 2</option>
        <option>less than 5</option>
        <option>less  than 8</option>
      </select>
      <br>
      

      <label>Areas of Interest :</label> <input type="text" name="area" onkeyup="change(this)" placeholder="xxxxxxx" value=<%= rs.getString(14)%>/><br/>
      
      <label>LinkedIn Account :</label> <input type="text" name="linked" onkeyup="change(this)" placeholder="xxxxxxx" value=<%= rs.getString(15)%>/><br/>

      <br>
      <br>
      <input id="btnSubmit" type="submit" value="Update" disabled="disabled"  />
      







      
      
  </form></div>
 <%con.close(); %>>
</body>






   





</html>
