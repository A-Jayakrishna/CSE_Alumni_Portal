import javax.servlet.http.*;


import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
@WebServlet("/payment")

public class donate extends HttpServlet {
	public void doPost(HttpServletRequest req,HttpServletResponse res) throws IOException
	{
		try {
			
		
		PrintWriter out = res.getWriter();  
		
		String FirstName = req.getParameter("FirstName");
        String Email = req.getParameter("Email");
        String Address = req.getParameter("Address");
       
        String  City= req.getParameter("City");
        String State = req.getParameter("State");
        String  Zip = req.getParameter("Zip");
        String  Name = req.getParameter("Card_Holder_Name");
        String number  =req.getParameter("Credit_card_number");
        String Month = req.getParameter("Exp_Month");
        String Year = req.getParameter("Exp_Year");
        String CVV  =req.getParameter("CVV");
        
        Class.forName("com.mysql.jdbc.Driver");

        Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/ncpproj","root","Rdsaccount#1");
        Statement stmt=connection.createStatement();
        
        String sql = "insert into payment values ('"+FirstName+"','"+Email+"','"+Address+"','"+City+"','"+State+"','"+Zip+"','"+Name+"','"+number+"','"+Month+"','"+Year+"','"+CVV+"')";
        stmt.executeUpdate(sql);
        System.out.println("inserted");
        HttpSession session = req.getSession();
    	session.setAttribute("payalert", "yes");
        res.sendRedirect("payment.jsp");
       
        connection.close();
    
    }
	catch(Exception e)
	{
		System.out.println(e);
		
	}  
}   



}
 