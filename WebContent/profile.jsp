<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Events using JSP</title>

<script>
function logout(){
	window.location.replace("logout");
}

</script>
</head>
<style>
.lgout{
margin-top:15px;
margin-left:800px;
width:80px;
}
.lgoutalu{
margin-top:15px;
margin-left:900px;
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

* {
  box-sizing: border-box;
}

body {
 /* font-family: Arial, Helvetica, sans-serif;*/
  background: #373B44;  /* fallback for old browsers */
background: -webkit-linear-gradient(to bottom, #4286f4, #373B44);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to bottom, #4286f4, #373B44); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */




}

.column {
  float: left;
  width: 25%;
  padding: 0 10px;
}


.row {margin: 0 -5px;
padding-bottom:18px}


.row:after {
  content: "";
  display: table;
  clear: both;
}


@media screen and (max-width: 600px) {
  .column {
    width: 100%;
    display: block;
    margin-bottom: 20px;
  }
}


.card {
  box-shadow: 0 6px 10px 0 rgba(0, 0, 0, 0.8);
  padding: 16px;
  text-align: center;
  background-color: #f1f1f1;
}
.collapsible {
  background-color:  #e2ede2  ;
  color: black;
  cursor: pointer;
  padding: 18px;
  width: 100%;
  border: none;
  text-align: left;
  outline: none;
  font-size: 15px;
}

.active, .collapsible:hover {
  background-color:  #4dd647 ;
}
.image{
width: 300px;
}
.content {
  padding: 0 18px;
  display: none;
  overflow: hidden;
  background-color: #f1f1f1;
}
</style>
<body style="margin: 0;">
<%String u = (String)session.getAttribute("utype"); 
if((String)session.getAttribute("utype") == null){
	response.sendRedirect("./error.html");
}
else{
if(u.equals("cor")){%>
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
<%} 
else{%>
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
<%}} %>
<% 
String url = "jdbc:mysql://localhost:3306/ncpproj";
String username = "root";
String password = "Rdsaccount#1" ;
String sql = "select * from eventdet"; 
Class.forName("com.mysql.jdbc.Driver"); 
Connection con = DriverManager.getConnection(url,username,password);
Statement st = con.createStatement();
ResultSet rs = st.executeQuery(sql);
rs.next();
%>
<h2 align="center" style="color:white" >Events</h2>

<div class="row">
  <div class="column">
  <button type="button" class="collapsible"><div class="card">
      <img class="image" src="./event_image/hackathon.jpg" alt="Hackathon" style="height:200px">
      <p><%= rs.getString(2) %></p>
      <p><%= rs.getString(3) %></p>
    </div></button>
<div class="content">
  <p><%= rs.getString(5) %></p>
</div>
  </div>
<% rs.next(); %>
  <div class="column">
  <button type="button" class="collapsible"><div class="card">
      <img src="./event_image/dj.jpg" alt="Music Concert" style="height:200px">
      <p><%= rs.getString(2) %></p>
      <p><%= rs.getString(3) %></p>
    </div></button>
<div class="content">
  <p><%= rs.getString(5) %></p>
</div>
    
  </div>
  
  <div class="column">
  <button type="button" class="collapsible"><div class="card">
	  <img class="image" src="./event_image/tech_fest.jpg" alt="Tech Fest" style="height:200px">
      <p>Some text</p>
      <p>Some text</p>
    </div></button>
<div class="content">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>
    
  </div>
  
  <div class="column">
  <button type="button" class="collapsible"><div class="card">
      <img class="image" src="./event_image/amrito.jpg" alt="Amritotsavam" style="height:200px">
      <p>Some text</p>
      <p>Some text</p>
    </div></button>
<div class="content">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>
  </div>
</div>

<div class="row">
  <div class="column">
  <button type="button" class="collapsible"><div class="card">
      <img class="image" src="./event_image/hackathon.jpg" alt="Hackathon" style="height:200px">
      <p>Hackathon</p>
      <p>Date and Time</p>
    </div></button>
<div class="content">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>
  </div>

  <div class="column">
  <button type="button" class="collapsible"><div class="card">
      <img src="./event_image/dj.jpg" alt="Music Concert" style="height:200px">
      <p>Some text</p>
      <p>Some text</p>
    </div></button>
<div class="content">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>
    
  </div>
  
  <div class="column">
  <button type="button" class="collapsible"><div class="card">
	  <img class="image" src="./event_image/tech_fest.jpg" alt="Tech Fest" style="height:200px">
      <p>Some text</p>
      <p>Some text</p>
    </div></button>
<div class="content">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>
    
  </div>
  
  <div class="column">
  <button type="button" class="collapsible"><div class="card">
      <img class="image" src="./event_image/amrito.jpg" alt="Amritotsavam" style="height:200px">
      <p>Some text</p>
      <p>Some text</p>
    </div></button>
<div class="content">
  <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
</div>
  </div>
</div>

</body>
<script>
var coll = document.getElementsByClassName("collapsible");
var i;

for (i = 0; i < coll.length; i++) {
  coll[i].addEventListener("click", function() {
    this.classList.toggle("active");
    var content = this.nextElementSibling;
    if (content.style.display === "block") {
      content.style.display = "none";
    } else {
      content.style.display = "block";
    }
  });
}
</script>
</html>