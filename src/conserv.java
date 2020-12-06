import java.io.*;  
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  
import java.sql.*;
  
@WebServlet("/concheck")
public class conserv extends HttpServlet
 {    
public void doPost(HttpServletRequest req, HttpServletResponse res)  
{
        try
		{  
        	PrintWriter out = res.getWriter();           
            
        	String name = req.getParameter("name");
        	String mail = req.getParameter("mail");
            String roll_id = req.getParameter("roll_id");
            String subject = req.getParameter("subject");
        	Class.forName("com.mysql.jdbc.Driver");

            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ncpproj","root","Rdsaccount#1");

            Statement stmt=con.createStatement();
            String sql = "insert into condet (namen,mail,roll_id,subj) values('"+name+"','"+mail+"','"+roll_id+"','"+subject+"')";
            stmt.executeUpdate(sql);
            con.close();
            HttpSession session = req.getSession();
        	session.setAttribute("conalert", "yes");
            res.sendRedirect("contact.jsp");
       
        }
		catch(Exception e)
		{
			System.out.println(e);
		}  
}   
  
}  
