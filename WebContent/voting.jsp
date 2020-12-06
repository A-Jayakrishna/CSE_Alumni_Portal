<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>VOTING SYSTEM</title>
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


        table {
  font-family: arial, sans-serif;
  border-collapse: collapse;
  width: 100%;
}

td, th {
  border: 1px solid #dddddd;
  text-align: left;
  padding: 8px;
}

tr:nth-child(even) {
  background-color: #dddddd;
}
</style>
<body style="background-color:powderblue;margin: 0;">

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
String url = "jdbc:mysql://localhost:3306/election";
String username = "root";
String password = "tshkoushik" ;
String sql = "select * from electionmem"; 
Class.forName("com.mysql.jdbc.Driver"); 
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ncpproj","root","Rdsaccount#1");
Statement st = con.createStatement();
String chu = (String)session.getAttribute("uname");
String selu = "select * from voted where usern='"+chu+"'";
ResultSet rsche = st.executeQuery(selu);
if(rsche.next()){
	response.sendRedirect("./voted.jsp");
}
ResultSet rs = st.executeQuery(sql);

%>

<h2 align="center" style="color:white" >Faculties Participating</h2>
<table>
    <tr>
      <th>Faculty Name</th>
      <th>Faculty ID</th>
    </tr>
    <%if(rs.next()){
    	do{ %>
    <tr>
      <td><%= rs.getString(1) %></td>
      <td><%= rs.getString(2) %></td>
    </tr>
    <%}while(rs.next());
    	}else{
    		response.sendRedirect("./noelection.jsp");
    	}%>
  </table>
  <form name="election"  action="voting"  method="post" >
    <label for="voteid">Enter The ID of Faculty You Want To Vote</label>
    <input type="text" name="VoteID" size="12" /><br>
    <button type="submit">Submit</button>
  </form>
 <%con.close(); %>
</body>
</html>