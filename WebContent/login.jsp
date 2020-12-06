<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="./login.css">
    <style>

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
	var al = '<%=session.getAttribute("islogged")%>';
	if(al != "null"){
		alert("Wrong credentials");
		<%session.removeAttribute("islogged");%>
	}
}
</script>
<script language="javascript" type="text/javascript" src="index.js">
    </script>
</head>
<body class="logbody" onload="callalert()" style="margin: 0;">
<nav>
<div class="topnav">
  <a href='HOME.html' target="_self">Home</a>
  <a href='login.jsp' target="_self">Login</a>
  <a href='./info_pages/info.html' target="_self">Information</a>
  <a href='contact.jsp' target="_self">Contact Us</a>
  <a href='./aboutus.html' target="_self">About Us</a>
</div>
</nav>
    <section>
        <div class = "outerdiv">
          <div class = "headdiv">
            <h1>CSE ALUMNI PORTAL</h1>
          </div>
          <div class = "reg">
            <p><b>If you do not have an account then register here</b><input class = "regbut" type="button" onclick="registersel()" value="Register"/></p>
          </div>
          <aside class="formdiv">
            <h2 class ="inhead">Login</h2>
            <form id = "logform" name="logform" action="logcheck" method="post"> 
                <input class="loginp" type="text" name="loguser" placeholder="username"/><br/>
                <input class="loginp" placeholder="Password" name="logpass" type="password"><br/>
                <input type="radio" id="alumni" name="user" value="alu"><label>ALUMNI</label><br/>
                <input type="radio" id="coordinator" name="user" value="cor"><label>COORDINATOR</label><br/>
                <input class="logsub btn" type="submit" value="Log In"/>
            </form>
          </aside>
        </div>
        
      </section>
</body>
</html>