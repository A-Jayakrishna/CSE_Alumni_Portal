import javax.servlet.http.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/endvote")

public class endvoting extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		  try
	        {
	        	Class.forName("com.mysql.jdbc.Driver");
	            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ncpproj","root","Rdsaccount#1");
	            Statement stmt=con.createStatement();
	            stmt.executeUpdate("TRUNCATE electionmem");
	            stmt.executeUpdate("TRUNCATE voted");
	            con.close();
	            res.sendRedirect("election.jsp");
	        }
			catch(Exception e)
			{
				System.out.println(e);
			} 
        
		
	}
}