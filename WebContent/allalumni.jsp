<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="javax.servlet.http.*,javax.servlet.*,java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>all alumni</title>
<script>
function logout(){
	window.location.replace("logout");
}

</script>
<style>
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
.card {
  box-shadow: 0 4px 8px 0 rgba(0,0,0,0.2);
  float:middle;
  background: #373B44;

}
.proimg{
background:white;
}
.card:hover {
  box-shadow: 0 8px 16px 0 rgba(0,0,0,0.2);
}
.data{
background: #373B44;  /* fallback for old browsers */
background: -webkit-linear-gradient(to left, #4286f4, #373B44);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to left, #4286f4, #373B44);
}
.container {
  padding-left: 250px;
  padding-right: 150px;
  float:right;
  color:white;
  font-size: large;
}
body{
background: #373B44;  /* fallback for old browsers */

}
</style>
</head>
<body style="margin: 0;">
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
String sql = "select * from alumniinformation";
ResultSet rs=stmt.executeQuery(sql);
%>
<div class="profilecontainer">
<center>
<table>

<%while (rs.next()) {%>

<tr class="card">
<td>
  <img src="profile.jpg" alt="Avatar" class="proimg">
  </td>
  <td class="data">
  <div class="container">
    <p>NAME: <%=rs.getString(2)%> <%=rs.getString(3) %></p>
    <p>YEAR OF PASSING: <%=rs.getInt("yop")%></p>
	<p>COMPANY: <%=rs.getString(11) %></p>
	<p>EXPERIANCE: <%=rs.getString(13) %></p>
	<p>EMAIL: <%=rs.getString(6) %></p>
  </div>
  </td>
</tr>


<%}
con.close();%>

</table>
</center>
</div>
</body>
</html>