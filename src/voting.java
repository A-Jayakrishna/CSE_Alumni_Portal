import javax.servlet.http.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/voting")


public class voting extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		try {
			
		
		PrintWriter out = res.getWriter();  
		
		String VoteID = req.getParameter("VoteID");

        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/ncpproj","root","Rdsaccount#1");
        PreparedStatement ps= con.prepareStatement("update electionmem set count=count+1 where facultyid=?");
            ps.setString(1, VoteID);
            int i=ps.executeUpdate();
            Statement stmt=con.createStatement();
            if(i>0) {
            	HttpSession session = req.getSession();
            	String x = (String)session.getAttribute("uname");
            	String query = String.format("insert into voted values ('%s') ;",x);
                stmt.executeUpdate(query);
            	res.sendRedirect("voted.jsp");
            	}
            else {
            	res.sendRedirect("voting.jsp");
            }
            con.close();
		}
		catch(Exception e)
		{
			System.out.println(e);
		}  
        
		
	}
}