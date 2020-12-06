import java.io.*;  
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;  
import java.sql.*;

@WebServlet("/accept")
public class regaccept extends HttpServlet
 {    
public void doGet(HttpServletRequest req, HttpServletResponse res)  
{
        try
		{  
        	PrintWriter out = res.getWriter();           
        	String user = req.getParameter("acuser");
        	//out.print(user);
        	Class.forName("com.mysql.jdbc.Driver");
            Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ncpproj","root","Rdsaccount#1");
            Statement stmt=con.createStatement();
            String sql = "select * from register where usern='"+user+"'";
            ResultSet rs=stmt.executeQuery(sql);
            if(rs.next()) {
            	
            	String fn= rs.getString(1);
            	String ln= rs.getString(2);
            	String re= rs.getString(3);
            	String un= rs.getString(4);
            	String ps= rs.getString(5);
            	String d= rs.getString(6);
            	String em= rs.getString(8);
            	String mo= rs.getString(7);
            	String lin= rs.getString(9);
            	String noth= "unknown";
            	
            	String sql2 = "insert into login values ('"+un+"','"+ps+"','alu')";
                stmt.executeUpdate(sql2);
                //String s = "insert into alumniinformation (usern,firstname,lastname,dob,email,mobileno,linkedin) values('"+un+"','"+fn+"','"+ln+"','"+d+"','"+em+"','"+mo+"','"+lin+"')";
                //stmt.executeUpdate(s);
                String query = "insert into alumniinformation values (?, ?, ?, ?, ?,?, ?, ?, ?, ?,?, ?, ?, ?, ?)";
                //Creating a Prepared Statement object
                PreparedStatement pstmt = con.prepareStatement(query);
                pstmt.setString(1, un);
                pstmt.setString(2, fn);
                pstmt.setString(3, ln);
                pstmt.setString(4, re);
                pstmt.setString(5, d);
                pstmt.setString(6, em);
                pstmt.setString(7, mo);
                pstmt.setInt(8, 0);
                pstmt.setString(9, noth);
                pstmt.setString(10, noth);
                pstmt.setString(11, noth);
                pstmt.setString(12, noth);
                pstmt.setString(13, noth);
                pstmt.setString(14, noth);
                pstmt.setString(15, lin);
                pstmt.execute();
                
            }
            String sql3 = "delete from register where usern = '"+user+"'";
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