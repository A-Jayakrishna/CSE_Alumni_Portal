import java.io.*;  
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  
import java.sql.*;
  
@WebServlet("/logcheck")
public class loginserv extends HttpServlet
 {    
public void doPost(HttpServletRequest req, HttpServletResponse res)  
{
        try
		{  
        	PrintWriter out = res.getWriter();           
            
        	String use = req.getParameter("loguser");
        	String pas = req.getParameter("logpass");
        	String typ = req.getParameter("user");
        	Class.forName("com.mysql.jdbc.Driver");

            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ncpproj","root","Rdsaccount#1");

            Statement stmt=con.createStatement();
            String sql = "select usern from login where usern='"+use+"' AND passw='"+pas+"' AND typ='"+typ+"'";
            ResultSet rs=stmt.executeQuery(sql);

            if(rs.next()) {
//            	System.out.println(rs.getString(1));
            	HttpSession session = req.getSession();
            	session.setAttribute("uname", rs.getString(1));
            	//System.out.println(typ.equalsIgnoreCase("cor"));
            	if(typ.equalsIgnoreCase("cor")) {
            		//System.out.println("here");
            		session.setAttribute("utype", "cor");
            		//res.sendRedirect("faculty_nav.html");
            		res.sendRedirect("profile.jsp");
            	}
            	else {
            		//System.out.println("there");
            		session.setAttribute("utype", "alu");
            		//res.sendRedirect("nav-using-frames.html");
            		res.sendRedirect("profile.jsp");
            	}
            	}
            else {
            	System.out.println("nomatch");
            	HttpSession session = req.getSession();
            	session.setAttribute("islogged", "false");
            	res.sendRedirect("login.jsp");
            	//res.sendRedirect("login.html");
            }

            con.close();
        
        }
		catch(Exception e)
		{
			System.out.println(e);
		}  
}   
  
}  