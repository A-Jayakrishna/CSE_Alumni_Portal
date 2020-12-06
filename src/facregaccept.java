import java.io.*;  
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  
import java.sql.*;

@WebServlet("/facaccept")
public class facregaccept extends HttpServlet
 {    
public void doGet(HttpServletRequest req, HttpServletResponse res)  
{
        try
		{  
        	PrintWriter out = res.getWriter();           
        	String user = req.getParameter("acfuser");
        	//out.print(user);
        	Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ncpproj","root","Rdsaccount#1");
            Statement stmt=con.createStatement();
            String sql = "select * from regform where uid='"+user+"'";
            ResultSet rs=stmt.executeQuery(sql);
            if(rs.next()) {
            	String sql2 = "insert into login values ('"+rs.getString(1)+"','"+rs.getString(2)+"','cor')";
                stmt.executeUpdate(sql2);
            }
            String sql3 = "delete from regform where uid= '"+user+"'";
            stmt.executeUpdate(sql3);
            con.close();
            res.sendRedirect("val_reg.jsp");
        }
		catch(Exception e)
		{
			System.out.println(e);
		}  
}   
  
}

