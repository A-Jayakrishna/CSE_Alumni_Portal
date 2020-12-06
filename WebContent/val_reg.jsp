<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Registration validation</title>
<script>
function logout(){
	window.location.replace("logout");
}

function acceptuser(send){
	//alert("accepted "+send.value);
	var usern = send.value;
	window.location.replace("accept?acuser="+usern);
}
function rejectuser(send){
	//alert("reject "+send.value);
	var usern = send.value;
	window.location.replace("reject?rjuser="+usern);
}
function acceptfac(send){
	//alert("accepted "+send.value);
	var usern = send.value;
	window.location.replace("facaccept?acfuser="+usern);
}
function rejectfac(send){
	//alert("reject "+send.value);
	var usern = send.value;
	window.location.replace("facreject?rjfuser="+usern);
}
</script>
<style >
.lgout{
margin-top:15px;
margin-left:800px;
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
h2{
text-align: center;
}
hr { 
  display: block;
  margin-top: 0.5em;
  margin-bottom: 0.5em;
  margin-left: auto;
  margin-right: auto;
  border-style: inset;
  border-width: 2px;
  
} 
</style>
<link rel="stylesheet" href="./val_reg.css"/>
</head>
<body style="margin: 0;">
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
<h1>Registration validation</h1>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ncpproj","root","Rdsaccount#1");
Statement stmt=con.createStatement();
String sql = "select * from register";
ResultSet rs=stmt.executeQuery(sql);
%>
<h2>Alumni Registration</h2>
<table id="alumnitable">
        <tr>
            <th>FIRST NAME</th>
            <th>LAST NAME</th>
            <th>REGNO</th>
            <th>DOB</th>
            <th>PHONE NUMBER</th>
            <th>EMAIL</th>
            <th>ACCEPT</th>
            <th>REJECT</th>
        </tr>
<%while(rs.next()) { %>
		<tr>
            <th><%=rs.getString(1)%></th>
            <th><%=rs.getString(2)%></th>
            <th><%=rs.getString(3)%></th>
            <th><%=rs.getString(6)%></th>
            <th><%=rs.getString(7)%></th>
            <th><%=rs.getString(8)%></th>
            <th><button onclick="acceptuser(this)" value=<%=rs.getString(4)%> class="acbut">Accept</button></th>
            <th><button onclick="rejectuser(this)" value=<%=rs.getString(4)%> class="rjbut">Reject</button></th>
        </tr>
<% }
con.close();%>
</table>
<hr>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/ncpproj","root","Rdsaccount#1");
Statement stmt1=conn.createStatement();
String sql1 = "select * from regform";
ResultSet rs1=stmt1.executeQuery(sql1);
%>
<h2>Faculty Registration</h2>
<table id="alumnitable">
        <tr>
            <th>USER NAME</th>
            <th>ADDRESS</th>
            <th>ZIPCODE</th>
            <th>EMAIL</th>
            <th>ABOUT</th>
            <th>ACCEPT</th>
            <th>REJECT</th>
        </tr>
<%while(rs1.next()) { %>
		<tr>
            <th><%=rs1.getString(3)%></th>
            <th><%=rs1.getString(4)%></th>
            <th><%=rs1.getString(5)%></th>
            <th><%=rs1.getString(6)%></th>
            <th><%=rs1.getString(7)%></th>
            <th><button onclick="acceptfac(this)" value=<%=rs1.getString(1)%> class="acbut">Accept</button></th>
            <th><button onclick="rejectfac(this)" value=<%=rs1.getString(1)%> class="rjbut">Reject</button></th>
        </tr>
<% }
conn.close();%>
</table>

</body>
</html>