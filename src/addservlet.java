
import javax.servlet.http.*;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;


import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
@WebServlet("/faculty")

public class addservlet extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		try {
			
		
		PrintWriter out = res.getWriter();  
		
		String FirstName = req.getParameter("FirstName");
        String DateOfBirth = req.getParameter("DateOfBirth");
        String ResidentialAddress = req.getParameter("ResidentialAddress");
       
        String PersonalPhoneNumber = req.getParameter("PersonalPhoneNumber");
        String YearsOfExperience = req.getParameter("YearsOfExperience");
        String ResearchArea = req.getParameter("ResearchArea");
        String Achievements = req.getParameter("Achievements");
        String Qualification =req.getParameter("Qualification");
        Class.forName("com.mysql.jdbc.Driver");

        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ncpproj","root","Rdsaccount#1");
        Statement stmt=connection.createStatement();
//        String s="Drop table if exists faculty";
//        stmt.execute(s);
//        String  facultyprofile= "create table faculty"
//                + "("
//                + "FirstName varchar(50) not null unique,"
//                + "DateOfBirth varchar(50) not null ,"
//                +"ResidentialAddress varchar(50) not null ,"
//                + "PersonalPhoneNumber numeric,"
//                + "YearsOfExperience numeric,"
//                + "Research varchar(50) not null,"
//                + "Achievement varchar(50) not null,"
//                + "Qualification varchar(50) not null"
//                
//                + ")";
//            
//            stmt.execute(facultyprofile);
//            System.out.println("created");
        String query = String.format("insert into faculty values ('%s', '%s', '%s', %s,%s,'%s','%s','%s') ;",FirstName,DateOfBirth,ResidentialAddress,PersonalPhoneNumber,YearsOfExperience,ResearchArea,Achievements, Qualification);
        stmt.executeUpdate(query);
        System.out.println("inserted");
        HttpSession session = req.getSession();
    	session.setAttribute("insertcheck","yes");
        res.sendRedirect("faculty_profilejsp.jsp");
        
		}
		catch(Exception e)
		{
			System.out.println(e);
		}  
        
		
	}
}


