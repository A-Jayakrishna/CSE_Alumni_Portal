import java.io.*;  
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  
import java.sql.*;
  
@WebServlet("/changedata")
public class alumni extends HttpServlet
 {    
public void doPost(HttpServletRequest req, HttpServletResponse res)  
{
        try
		{  
        	PrintWriter out = res.getWriter();           
            
        	String fname = req.getParameter("fn");
            String lname = req.getParameter("ln");
         
            String mail = req.getParameter("mailid");
            String mob = req.getParameter("phno");
            
            String qual = req.getParameter("qua");
            String achieve = req.getParameter("ach");
            String work = req.getParameter("com");
            String role = req.getParameter("role");
            String exp = req.getParameter("exp");
            String aoi = req.getParameter("area");
        	String lin = req.getParameter("linked");
        	Class.forName("com.mysql.jdbc.Driver");

            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ncpproj","root","Rdsaccount#1");
            PreparedStatement ps=con.prepareStatement("update alumniinformation set email=? ,mobileno=?, qualification=? , achievement=? ,  company=? , roles=? , experience=? , areaofint=? , linkedin=?  where firstname=? and lastname=?");
            ps.setString(1, mail);
            ps.setString(2, mob);
            ps.setString(3, qual);
            ps.setString(4, achieve);
            ps.setString(5, work);
            ps.setString(6, role);
            ps.setString(7, exp);
            ps.setString(8, aoi);
            ps.setString(9, lin);
            ps.setString(10, fname);
            ps.setString(11, lname);
       
            int i=ps.executeUpdate();
            if(i>0) {
            	System.out.println("updated");
            	HttpSession session = req.getSession();
            	session.setAttribute("isupdated", "yes");
            	res.sendRedirect("alumni.jsp");
            	}
            else {
            	HttpSession session = req.getSession();
            	session.setAttribute("isupdated", "no");
            	res.sendRedirect("alumni.jsp");
            }

            con.close();
        
        }
		catch(Exception e)
		{
			System.out.println(e);
		}  
}   
  
}  