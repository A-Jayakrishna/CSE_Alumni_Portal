import java.io.*;  
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  
import java.sql.*;
  
@WebServlet("/logout")
public class logoutserv extends HttpServlet
 {    
public void doGet(HttpServletRequest req, HttpServletResponse res)  
{
        try
		{  
        	PrintWriter out = res.getWriter();           
            out.print("logout");
        	HttpSession session = req.getSession();
        	session.removeAttribute("uname");
        	session.removeAttribute("utype");
        	res.sendRedirect("login.jsp");
        
        }
		catch(Exception e)
		{
			System.out.println(e);
		}  
}   
  
}  

