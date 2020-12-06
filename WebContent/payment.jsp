<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>PAYMENT</title>
</head>

<script type="text/javascript">
function logout(){
	window.location.replace("logout");
}

function EnableDisable(fname) {
    //Reference the Button.
    var btnSubmit = document.getElementById("btnSubmit");

    //Verify the TextBox value.
    if (fname.value.trim() != "") {
        //Enable the TextBox when TextBox has value.
        btnSubmit.disabled = false;
    } else {
        //Disable the TextBox when TextBox is empty.
        btnSubmit.disabled = true;
    }
};
function validateForm()
{
 
var x = document.forms["newad"]["Card_Holder_Name"];
var y=document.forms["newad"]["Credit_card_number"];
var z=document.forms["newad"]["Exp_Month"];
var e=document.forms["newad"]["Exp_Year"];
var c=document.forms["newad"]["CVV"];
if (x.value == "") {
window.alert("Name field is mandatory"); // confirm // prompt
x.focus();
return false;
}

if (y.value == "" ) {
window.alert("card number field is mandatory"); // confirm // prompt
y.focus();
return false;
}
if (z.value == "" ) {
window.alert(" mandatory feild"); // confirm // prompt
z.focus();
return false;
}
if (sector.value == "" ) {
window.alert(" mandatory feild"); // confirm // prompt
sector.focus();
return false;
}
if (ep.value == "" ) {
window.alert(" mandatory feild"); // confirm // prompt
ep.focus();
return false;
}
if (cvv.value == "" ) {
window.alert(" mandatory feild"); // confirm // prompt
z.focus();
return false;
}
alert("Thanks For Donating"); 
}

function callalert(){
	var al = '<%=session.getAttribute("payalert")%>';
	if(al != "null"){
		if(al === "yes"){
			alert("Payment sccessful");
		}
		else{
			alert("Payment not sucessful");
		}
		<%session.removeAttribute("payalert");%>
	}
}
</script>


<style >
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
body {
 
  
  background: #bdc3c7;
background: -webkit-linear-gradient(to bottom, #2c3e50, #bdc3c7);
background: linear-gradient(to bottom, #2c3e50, #bdc3c7);
}

* {
  box-sizing: border-box;
}

.row {
  display: -ms-flexbox; /* IE10 */
  display: flex;
  -ms-flex-wrap: wrap; /* IE10 */
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  -ms-flex: 75%; /* IE10 */
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  background-color: #f2f2f2;
  padding: 5px 20px 15px 20px;
  border: 1px solid lightgrey;
  border-radius: 3px;
}

input[type=text] {
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}

label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: #4CAF50;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
background: #bdc3c7;
background: -webkit-linear-gradient(to bottom, #2c3e50, #bdc3c7);
background: linear-gradient(to bottom, #2c3e50, #bdc3c7);
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: grey;
}

/* Responsive layout - when the screen is less than 800px wide, make the two columns stack on top of each other instead of next to each other (also change the direction - make the "cart" column go on top) */
@media (max-width: 800px) {
  .row {
    flex-direction: column-reverse;
  }
  .col-25 {
    margin-bottom: 20px;
  }
}
.required {
  color: red;
}

</style >

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

<h1 style="text-align:center;" >Payment Form</h1>
<p  style="text-align:center" style="background-color:white;"> You had Stepped forward to donate</p>
<div class="row">
  <div class="col-75">
    <div class="container">
      <form action="payment" onsubmit="return validateForm()" action="payment" method="post" name="newad">
      
        <div class="row">
          <div class="col-50">
            <h3>Donar Payment Details</h3>
            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
            <input type="text" id="fname" name="FirstName" placeholder="John M. Doe" onkeyup="EnableDisable(this)">
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="text" id="email" name="Email" placeholder="john@example.com">
            <label for="adr"><i class="fa fa-address-card-o"></i> Address</label>
            <input type="text" id="adr" name="Address" placeholder="542 W. 15th Street">
            <label for="city"><i class="fa fa-institution"></i> City</label>
            <input type="text" id="city" name="City" placeholder="New York">

            <div class="row">
              <div class="col-50">
                <label for="state">State</label>
                <input type="text" id="state" name="State" placeholder="NY">
              </div>
              <div class="col-50">
                <label for="zip">Zip</label>
                <input type="text" id="zip" name="Zip" placeholder="10001">
              </div>
            </div>
          </div>

          <div class="col-50">
            <h3>Payment</h3>
            <label for="fname">Accepted Cards</label>
            <table>
             <img style="margin-left:25px;" src="card.png" width="400" height="100" />
    
             </table>
            <label for="name">Card Holder Name<span class="required">*</span></label><input name="Card_Holder_Name" type="text" placeholder="John More Doe" />
          
          
			<label for="name">Credit card number<span class="required">*</span></label><input name="Credit_card_number" type="text" placeholder="1111-2222-3333-4444"/>
            
         
			<label for="name">Exp Month<span class="required">*</span></label>
		    <select>
                   <option name="Exp_Month"  >
                   <option value="edu">JAN.</option>
                    <option value="env">FEB.</option>
                   <option value="tourism">MAR.</option>
				   <option value="edu">APR.</option>
                    <option value="env">MAY</option>
                   <option value="tourism">JUNE</option>
				   <option value="edu">JULY</option>
                    <option value="env">AUG.</option>
                   <option value="tourism">SEP.</option>
				   <option value="edu">OCT.</option>
                    <option value="env">NOV.</option>
                   <option value="tourism">DEC.</option>
                     </select>
 
            <div class="row">
              <div class="col-50">

				<label for="name">Exp Year<span class="required">*</span></label><input name="Exp_Year" type="text" placeholder="2018"  />
        
              </div>
              <div class="col-50">
             
				<label for="name">CVV<span class="required">*</span></label><input name="CVV" type="text" placeholder="352" />
   
              </div>
            </div>
          </div>
          
        </div>
        <label>
          <input type="checkbox" checked="checked" name="sameadr"> Save details
        </label>
        <input id="btnSubmit" type="submit" value="DONATE" disabled="disabled" >
      </form>
    </div>
  </div>
  
</div>


</body>

</html>