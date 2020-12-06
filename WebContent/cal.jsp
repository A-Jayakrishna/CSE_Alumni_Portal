<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.util.*,javax.servlet.http.*,javax.servlet.*,java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Calendar</title>

    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" href="./cal.css"/>
<script>
function logout(){
	window.location.replace("logout");
}

</script>
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
</style>  
</head>
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
<div class="container">
    <div class="card">
        <h3 class="card-header" id="monthAndYear"></h3>
        <table class="table" id="calendar">
            <thead>
            <tr>
                <th>Sun</th>
                <th>Mon</th>
                <th>Tue</th>
                <th>Wed</th>
                <th>Thu</th>
                <th>Fri</th>
                <th>Sat</th>
            </tr>
            </thead>

            <tbody id="calendar-body">

            </tbody>
        </table>

        <div class="form-inline">

            <button class="btn" id="previous" onclick="previous()">Previous</button>

            <button class="btn" id="next" onclick="next()">Next</button>
        </div>
        <br/>
        <form class="form-inline jump">
            <label for="month"><b>Jump To: </b></label>
            <select class="form-control" name="month" id="month" onchange="jump()">
                <option value=0>Jan</option>
                <option value=1>Feb</option>
                <option value=2>Mar</option>
                <option value=3>Apr</option>
                <option value=4>May</option>
                <option value=5>Jun</option>
                <option value=6>Jul</option>
                <option value=7>Aug</option>
                <option value=8>Sep</option>
                <option value=9>Oct</option>
                <option value=10>Nov</option>
                <option value=11>Dec</option>
            </select>


            <label for="year"></label><select class="form-control" name="year" id="year" onchange="jump()">
            <option value=1990>1990</option>
            <option value=1991>1991</option>
            <option value=1992>1992</option>
            <option value=1993>1993</option>
            <option value=1994>1994</option>
            <option value=1995>1995</option>
            <option value=1996>1996</option>
            <option value=1997>1997</option>
            <option value=1998>1998</option>
            <option value=1999>1999</option>
            <option value=2000>2000</option>
            <option value=2001>2001</option>
            <option value=2002>2002</option>
            <option value=2003>2003</option>
            <option value=2004>2004</option>
            <option value=2005>2005</option>
            <option value=2006>2006</option>
            <option value=2007>2007</option>
            <option value=2008>2008</option>
            <option value=2009>2009</option>
            <option value=2010>2010</option>
            <option value=2011>2011</option>
            <option value=2012>2012</option>
            <option value=2013>2013</option>
            <option value=2014>2014</option>
            <option value=2015>2015</option>
            <option value=2016>2016</option>
            <option value=2017>2017</option>
            <option value=2018>2018</option>
            <option value=2019>2019</option>
            <option value=2020>2020</option>
            <option value=2021>2021</option>
            <option value=2022>2022</option>
            <option value=2023>2023</option>
            <option value=2024>2024</option>
            <option value=2025>2025</option>
            <option value=2026>2026</option>
            <option value=2027>2027</option>
            <option value=2028>2028</option>
            <option value=2029>2029</option>
            <option value=2030>2030</option>
        </select></form>
    </div>
</div>

<script>

<%
Class.forName("com.mysql.jdbc.Driver");
Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ncpproj","root","Rdsaccount#1");
Statement stmt=con.createStatement();
String sql = "select eventname,daten from eventdet";
ResultSet rs=stmt.executeQuery(sql);
List<List<String>> ed = new ArrayList<List<String>>();
ArrayList<String> tempe=new ArrayList<String>();
ArrayList<String> tempd=new ArrayList<String>();

while(rs.next()){
	tempe.add(rs.getString(1));
	tempd.add(rs.getString(2));
	//System.out.println(rs.getString(1)+" "+rs.getString(2));
	//temp.clear();
}
ed.add(tempe);
ed.add(tempd);
//System.out.println(ed.get(1).get(0));
%>
    let today = new Date();
    let currentMonth = today.getMonth();
    let currentYear = today.getFullYear();
    let selectYear = document.getElementById("year");
    let selectMonth = document.getElementById("month");

    let months = ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"];

    let monthAndYear = document.getElementById("monthAndYear");
    showCalendar(currentMonth, currentYear);


    function next() {
        currentYear = (currentMonth === 11) ? currentYear + 1 : currentYear;
        currentMonth = (currentMonth + 1) % 12;
        showCalendar(currentMonth, currentYear);
    }

    function previous() {
        currentYear = (currentMonth === 0) ? currentYear - 1 : currentYear;
        currentMonth = (currentMonth === 0) ? 11 : currentMonth - 1;
        showCalendar(currentMonth, currentYear);
    }

    function jump() {
        currentYear = parseInt(selectYear.value);
        currentMonth = parseInt(selectMonth.value);
        showCalendar(currentMonth, currentYear);
    }

    function showCalendar(month, year) {

        let firstDay = (new Date(year, month)).getDay();
        let daysInMonth = 32 - new Date(year, month, 32).getDate();

        var tbl = document.getElementById("calendar-body"); 

        tbl.innerHTML = "";

        monthAndYear.innerHTML = months[month] + " " + year;
        selectYear.value = year;
        selectMonth.value = month;

        let date = 1;
        for (let i = 0; i < 6; i++) {
            
            let row = document.createElement("tr");

            
            for (let j = 0; j < 7; j++) {
                if (i === 0 && j < firstDay) {
                    let cell = document.createElement("td");
                    let cellText = document.createTextNode("");
                    cell.appendChild(cellText);
                    row.appendChild(cell);
                }
                else if (date > daysInMonth) {
                    break;
                }

                else {
                    let cell = document.createElement("td");
                    let cellText = document.createTextNode(date);
                    if (date === today.getDate() && year === today.getFullYear() && month === today.getMonth()) {
                        cell.classList.add("today");
                        let para = document.createElement("p");
                        let paraText = document.createTextNode("no event");
                        para.appendChild(paraText);
                        cell.appendChild(para);
                        console.log(String(date)+"-"+String(month)+"-"+String(year));
                    }
                    //var cd = String(date)+"-"+String(month)+"-"+String(year);
                    //console.log(cd);
                    <% 
                    String evn;
                    String evd;
                    for(int i=0;i<tempe.size();i++){
                    	evn = tempe.get(i);
                    	evd = tempd.get(i);%>
                    	var x = '<%=evn%>';
                    	var y = '<%=evd%>';
                    	var dbda=y.split("-");
                    	if(date === parseInt(dbda[0]) && month === (parseInt(dbda[1])-1) && year === parseInt(dbda[2])){
                    		cell.classList.add("today");
                            let para = document.createElement("p");
                            let paraText = document.createTextNode(x);
                            para.appendChild(paraText);
                            cell.appendChild(para);
                    	}
                    	
                        <%}%>
                    
                    
              
                    cell.appendChild(cellText);
                    row.appendChild(cell);
                    date++;
                }


            }

            tbl.appendChild(row);
        }

    }
<%con.close();%>
    </script>
<!--  <script src="cal.js"></script>-->


</body>
</html>