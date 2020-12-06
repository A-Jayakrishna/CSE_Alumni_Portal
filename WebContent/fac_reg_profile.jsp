<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
 <head>
 <meta charset="ISO-8859-1">
   <meta charset="utf-8">
   <title>Registration form</title>
   <link rel="stylesheet" href="formvalidation.css" type="text/css">
   <script src="formvalidation.js"></script>
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
 </head>

   <body onload="document.registration.userid.focus();" style="margin: 0;">
   <nav>
<div class="topnav">
  <a href='HOME.html' target="_self">Home</a>
  <a href='login.jsp' target="_self">Login</a>
  <a href='./info_pages/info.html' target="_self">Information</a>
  <a href='contact.jsp' target="_self">Contact Us</a>
  <a href='./aboutus.html' target="_self">About Us</a>
</div>
</nav>
    <h1>Faculty Registration Form</h1>
   <form name='registration' action="SignupServlet" method="get" onSubmit="return formValidation() ">
     <ul>
       <li><label for="userid">User id:</label></li>
       <li><input type="text" name="userid" size="12" /></li>
       <li><label for="passid">Password:</label></li>
        <li><input type="password" name="passid" size="12" /></li>
        <li><label for="username">Name:</label></li>
        <li><input type="text" name="username" size="50" /></li>
        <li><label for="address">Address:</label></li>
        <li><input type="text" name="address" size="50" /></li>
        <li><label for="country">Country:</label></li>
        <li><select name="country">
            <option selected="" value="Default">(Please select a state)</option>
            <option value="AF">Andhra Pradesh</option>
            <option value="AD">Arunachal Pradesh</option>
            <option value="AD">Delhi</option>
            <option value="AL">Maharashtra</option>
            <option value="DZ">Karanataka</option>
            <option value="AS">Kerala</option>
            <option value="AD">Tamilnadu</option>
            <option value="AD">Rajasthan</option>
            <option value="AD">UttaraKhand</option>
            <option value="AD">Uttar Pradesh</option>

          </select></li>
        <li><label for="zip">ZIP Code:</label></li>
        <li><input type="text" name="zip" /></li>
        <li><label for="email">Email:</label></li>
        <li><input type="text" name="email" size="50" /></li>
        <li><label id="gender">Sex:</label></li>
        <li><input type="radio" name="msex" value="Male" /><span>Male</span></li>
        <li><input type="radio" name="fsex" value="Female" /><span>Female</span></li>
        <li><label>Language:</label></li>
        <li><input type="checkbox" name="en" value="en" checked /><span>English</span></li>
        <li><input type="checkbox" name="nonen" value="noen" /><span>Telugu</span></li>
        <li><input type="checkbox" name="nonen" value="noen" /><span>Hindi</span></li>
        <li><input type="checkbox" name="nonen" value="noen" /><span>Kannada</span></li>
        <li><label for="desc">About Yourself:</label></li>
        <li><textarea name="desc" id="desc"></textarea></li>
        <li><input type="submit" name="submit" value="Submit" /></li>
      </ul>
    </form>
  </body>

</html>

