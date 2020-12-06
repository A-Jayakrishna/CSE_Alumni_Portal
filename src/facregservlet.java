import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


/**
 * Servlet implementation class SignupServlet
 */
@WebServlet("/SignupServlet")
public class facregservlet extends HttpServlet {
	/*private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public facregservlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	
	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		try{
			
			 final String JDBC_DRIVER= "com.mysql.jdbc.Driver";
			 final String DB_URL="jdbc:mysql://localhost:3306/Ncpproj";
			int flag=0;
			 response.setContentType("text/html");
			PrintWriter out=response.getWriter();
			String uid=request.getParameter("userid"); 
			String pass=request.getParameter("passid");  
			String uname=request.getParameter("username");
			String address=request.getParameter("address");
			String zipcode=request.getParameter("zip");
			String email=request.getParameter("email");
			String about=request.getParameter("desc");
		
		try
		{
			
			Class.forName(JDBC_DRIVER);
			
		Connection conn =DriverManager.getConnection("jdbc:mysql://localhost:3306/ncpproj","root","Rdsaccount#1");
		
		
		PreparedStatement ps=conn.prepareStatement(  
				"insert into regform values(?,?,?,?,?,?,?)");  
				  
				ps.setString(1,uid);  
				ps.setString(2,pass);  
				ps.setString(3,uname);  
				ps.setString(4,address);  
				ps.setString(5,zipcode);
				ps.setString(6,email);
				ps.setString(7,about);
				int i=ps.executeUpdate();  
				if(i>0)  
				out.print("You are successfully registered..."); 
				
				response.sendRedirect("fac_reg_profile.jsp");
				   conn.close();      
				}catch (Exception e2) 
		{System.out.println(e2);}  
		
			          
				out.close(); 
		}
				catch(Exception e)
		{
			System.out.println(e);	
		}
	}

}