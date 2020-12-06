import javax.servlet.http.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;

@WebServlet("/facultyelection")


public class election extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		try {
			
		
		PrintWriter out = res.getWriter();  
		
		String facultyname1 = req.getParameter("facultyname1");
        String facultyid1 = req.getParameter("facultyid1");
        String facultyname2 = req.getParameter("facultyname2");
        String facultyid2 = req.getParameter("facultyid2");
        String facultyname3 = req.getParameter("facultyname3");
        String facultyid3 = req.getParameter("facultyid3");
        String facultyname4 = req.getParameter("facultyname4");
        String facultyid4 = req.getParameter("facultyid4");
        String facultyname5 = req.getParameter("facultyname5");
        String facultyid5 = req.getParameter("facultyid5");
        String facultyname6 = req.getParameter("facultyname6");
        String facultyid6 = req.getParameter("facultyid6");
        int count = 0;

        Class.forName("com.mysql.jdbc.Driver");
        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ncpproj","root","Rdsaccount#1");
        Statement stmt=connection.createStatement();

        if(facultyname1  != ""){
            String query = String.format("insert into electionmem values ('%s', '%s', '%d') ;",facultyname1,facultyid1,count);
            stmt.executeUpdate(query);
            System.out.println("inserted");
        }
        if(facultyname2  != ""){
            String query = String.format("insert into electionmem values ('%s', '%s', '%d') ;",facultyname2,facultyid2,count);
            stmt.executeUpdate(query);
            System.out.println("inserted");
        }
        if(facultyname3  != ""){
            String query = String.format("insert into electionmem values ('%s', '%s', '%d') ;",facultyname3,facultyid3,count);
            stmt.executeUpdate(query);
            System.out.println("inserted");
        }
        if(facultyname4  != ""){
            String query = String.format("insert into electionmem values ('%s', '%s', '%d') ;",facultyname4,facultyid4,count);
            stmt.executeUpdate(query);
            System.out.println("inserted");
        }
        if(facultyname5  != ""){
            String query = String.format("insert into electionmem values ('%s', '%s', '%d') ;",facultyname5,facultyid5,count);
            stmt.executeUpdate(query);
            System.out.println("inserted");
        }
        if(facultyname6  != ""){
            String query = String.format("insert into electionmem values ('%s', '%s', '%d') ;",facultyname6,facultyid6,count);
            stmt.executeUpdate(query);
            System.out.println("inserted");
        }
        
        res.sendRedirect("election.jsp");
		}
		catch(Exception e)
		{
			System.out.println(e);
		}  
        
		
	}
}