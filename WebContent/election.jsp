<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">

<script>
function logout(){
	window.location.replace("logout");
}


    function validateForm()
{
     
   var x = document.forms["election"]["facultyname1"];
   var y = document.forms["election"]["facultyname2"];
   var z = document.forms["election"]["facultyname3"];
   var l = document.forms["election"]["facultyname4"];
   var m = document.forms["election"]["facultyname5"];
   var n = document.forms["election"]["facultyname6"];

  if (x.value == "" && y.value == "" && z.value == "" && l.value == "" && m.value == "" && n.value == "") {
    window.alert("Atleast two faculties are to be selected"); // confirm // prompt
    
  }
  if (x.value == "" && y.value == "" && z.value == "" && l.value == "" && m.value == "" ) {
    window.alert("Atleast two faculties are to be selected"); // confirm // prompt
    
  }
  if (x.value == "" && y.value == "" && z.value == "" && l.value == ""  && n.value == "") {
    window.alert("Atleast two faculties are to be selected"); // confirm // prompt
    
  }
  if (x.value == "" && y.value == "" && z.value == ""  && m.value == "" && n.value == "") {
    window.alert("Atleast two faculties are to be selected"); // confirm // prompt
    
  }
  if (x.value == "" && y.value == "" && l.value == "" && m.value == "" && n.value == "") {
    window.alert("Atleast two faculties are to be selected"); // confirm // prompt
    
  }
  if (x.value == "" &&  z.value == "" && l.value == "" && m.value == "" && n.value == "") {
    window.alert("Atleast two faculties are to be selected"); // confirm // prompt
    
  }
  if (y.value == "" && z.value == "" && l.value == "" && m.value == "" && n.value == "") {
    window.alert("Atleast two faculties are to be selected"); // confirm // prompt
    
  }

 else {
	window.alert("Successfully Selected Election Members");
 }	

}

</script>
</head>
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


.header{
  background-color: grey;
  color: white;
  padding: 15px;
}
.column {
  float: left;
  padding: 15px;
}
.menu ul {
  list-style-type: none;
  margin: 0;
  padding: 0;
}
.menu li {
  padding: 8px;
  margin-bottom: 8px;
  background-color: #33b5e5;
  color: #ffffff;
}
.mo{
  background-color: grey;
  text-align: center;
  color: white;
  padding: 15px;
}
.footer-inner {
    margin: auto;
    text-align: center;
    padding: 12px;
    width: 922px;
}
</style>


<body onsubmit="validateForm()" style="margin: 0;">
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
<% 
String url = "jdbc:mysql://localhost:3306/election";
String username = "root";
String password = "tshkoushik" ;
String sql = "select * from electionmem"; 
Class.forName("com.mysql.jdbc.Driver"); 
Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ncpproj","root","Rdsaccount#1");
Statement st = con.createStatement();
ResultSet rsche = st.executeQuery(sql);
if(rsche.next()){
	response.sendRedirect("./electionstart.jsp");
}

%>
    <div class="header">
        <h1 > ELECTION PAGE</h1>
    </div>


<form name="election"  action="facultyelection"  method="post" >

    <div class="clearfix">
        <div class="column menu">
          <ul>
            <li><br>Dr. Sankaran K.</li><p1>Dr. Sankaran currently serves as Registrar of Amrita Vishwa Vidyapeetham.
                 Dr. Sankaran received his Ph.D. in Engineering from the Indian Institute of Science, Bangalore,
                  and has had a long and distinguished career as a Professor, Chairperson, Principal, and an Academician.</p1><br>
                  
                  <br>
                  <label for="ele1">Enter dr sankaran for Faculty Participation</label><br>
                  <label for="facultyname1">faculty name:</label>
                  <input type="text" name="facultyname1" size="12" /><br>
                  <label for="facultyid1">faculty id:</label>
                  <input type="text" name="facultyid1" size="12" /><br>

            <li><br>Dr. Shantikumar Nair</li><p1>Dr. Shantikumar V. Nair currently serves as the Dean of Research at th
                e Amrita Vishwa Vidyapeetham. He also holds the office of the Director of India's foremost research 
                institutes - Amrita Center for Nanosciences & Molecular Medicine at Kochi campus of the Amrita Vishwa 
                Vidyapeetham.</p1><br>

                <br>
                <label for="ele2">Enter dr shantikumar for Faculty Participation</label><br>
                <label for="facultyname2">faculty name:</label>
                <input type="text" name="facultyname2" size="12" /><br>
                <label for="facultyid2">faculty id:</label>
                <input type="text" name="facultyid2" size="12" /><br>

            <li><br>Dr. Jyothi S. N.</li><p1>Dr. Jyothi S. N. currently serves as Principal at the School of Engineering, Amritapuri Campus. She holds a PhD degree from IIT Madras, 
                and has served in Amrita Vishwa Vidyapeetham for over four years. </p1><br>

                <br>
                <label for="ele3">Enter dr jyothi for Faculty Participation</label><br>
                <label for="facultyname3">faculty name:</label>
                <input type="text" name="facultyname3" size="12" /><br>
                <label for="facultyid3">faculty id:</label>
                <input type="text" name="facultyid3" size="12" /><br>
               

            <li><br>Dr. Sivakumar V</li><p1>Dr. Sivakumar V. currently serves as Chairperson and Associate Professor at the Department of Aerospace Engineering, School of Engineering, 
              Amrita Vishwa Vidyapeetham, Coimbatore campus. </p1>Dr. Rabinarayan Tripathy is presently working as Vice Principal of Amrita School of Ayurveda and 
                Professor and Head of the Department of Shalya Tantra, Amrita School of Ayurveda.<br>

                <br>
                <label for="ele4">Enter dr sivakumar for Faculty Participation</label><br>
                <label for="facultyname4">faculty name:</label>
                <input type="text" name="facultyname4" size="12" /><br>
                <label for="facultyid4">faculty id:</label>
                <input type="text" name="facultyid4" size="12" /><br>
               

            <li><br>Dr. Beena Kumari</li><p1>Dr. Beena Kumari currently serves as Professor and Head in the Department of Oral Medicine and Radiology, School of Dentistry, Health Sciences Campus,
                 Kochi.</p1><br>

                  <br>
                  <label for="ele5">Enter dr beenakumari for Faculty Participation</label><br>
                  <label for="facultyname5">faculty name:</label>
                  <input type="text" name="facultyname5" size="12" /><br>
                  <label for="facultyid5">faculty id:</label>
                  <input type="text" name="facultyid5" size="12" /><br>
                

            <li><!--<img src="6.jpg" alt="Italian Trulli" width="200" height="200">--><br>Dr. Balagopal Varma R.</li><p1>Dr. Balagopal Varma R. currently serves as Principal, HOD & Professor in the Department of Paediatric Dentistry, School of Dentistry, Health Sciences 
                Campus, Kochi. </p1><br>
                <br>
                  <label for="ele6">Enter dr balagopal for Faculty Participation</label><br>
                  <label for="facultyname6">faculty name:</label>
                  <input type="text" name="facultyname6" size="12" /><br>
                  <label for="facultyid6">faculty id:</label>
                  <input type="text" name="facultyid6" size="12" /><br>
              
          </ul>
        </div>
          <button type="submit">Submit</button>
    </div>
</form>
        <hr style="height:2px;border-width:2px;color:gray;background-color:gray">
        <div class="mo" id="footer">
          <div id="footer-inner">
            <p >&copy; Copyright <a href="">HTML.am</a> &#124; <a href="">Privacy Policy</a></p>
            <div class="clr"></div>
            <div id="mobile-toggle">
              <b >Desktop</b> | <a href="" rel="nofollow">Mobile Site</a>
            <!-- //www.html.am,//www.html.am/privacy_policy.cfm,/html-codes/character-codes/html-copyright-code.cfm?newView=Mobile-->
            </div>
          </div>
        </div>
                              

</body>
</html>