import java.io.*;  
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  
import java.sql.*;

@WebServlet("/reject")
public class regreject extends HttpServlet
 {    
public void doGet(HttpServletRequest req, HttpServletResponse res)  
{
        try
        {
        	PrintWriter out = res.getWriter();           
        	String user = req.getParameter("rjuser");
        	//out.print(user);
        	Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ncpproj","root","Rdsaccount#1");
            Statement stmt=con.createStatement();
            String sql = "delete from register where usern = '"+user+"'";
            stmt.executeUpdate(sql);
            con.close();
            res.sendRedirect("val_reg.jsp");
        }
		catch(Exception e)
		{
			System.out.println(e);
		}  
}   
  
}