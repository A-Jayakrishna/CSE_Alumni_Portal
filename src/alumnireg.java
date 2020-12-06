import java.io.*;  
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  
import java.sql.*;

@WebServlet("/addalumni")
public class alumnireg extends HttpServlet
{    
public void doPost(HttpServletRequest req, HttpServletResponse res)  
{
       try
		{  
       	PrintWriter out = res.getWriter();           
           
       	String fn = req.getParameter("inp_fname");
       	String ln = req.getParameter("inp_lname");
       	String reg = req.getParameter("inp_reg");
       	String usern = req.getParameter("inp_user");
       	String passw = req.getParameter("inp_pass");
       	String dob = req.getParameter("inp_date");
       	String phno = req.getParameter("inp_num");
       	String email = req.getParameter("inp_email");
       	String lia = req.getParameter("inp_link");
       	//out.print("insert into register values ('"+fn+"','"+ln+"','"+reg+"','"+usern+"','"+passw+"','"+passw+"','"+dob+"','"+phno+"','"+lia+"')");
       	Class.forName("com.mysql.jdbc.Driver");

           Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ncpproj","root","Rdsaccount#1");

           Statement stmt=con.createStatement();
           String sql = "insert into register values ('"+fn+"','"+ln+"','"+reg+"','"+usern+"','"+passw+"','"+dob+"','"+phno+"','"+email+"','"+lia+"')";
           stmt.executeUpdate(sql);
           System.out.println("inserted");
           HttpSession session = req.getSession();
       	   session.setAttribute("regalert", "yes");
           res.sendRedirect("reg.jsp");
           con.close();

       
       }
		catch(Exception e)
		{
			System.out.println(e);
		}  
}   
 
}
