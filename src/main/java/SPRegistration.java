import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.ServletException;
import java.io.*;
import javax.servlet.annotation.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SPRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public SPRegistration() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		Connection conn = null;
		PrintWriter out= response.getWriter();
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugfixingportal","root","1234");
            String email = (String)request.getParameter("email");
			String uname = (String)request.getParameter("uname");
			String psw = (String)request.getParameter("psw");

			HttpSession session = request.getSession();
			PreparedStatement ps= conn.prepareStatement("select level from user_details where username=?");
			ps.setString(1,(String)session.getAttribute("user"));
			ResultSet rs = ps.executeQuery();
			
			String level = "";
			while(rs.next())
			{
				level = rs.getString("level");
			}
			
			if(level.equals("diamond") || level.equals("platinum"))
			{
				ps= conn.prepareStatement("insert into SP(email,username,pwd) values(?,?,?)");
	            ps.setString(1,email);
	            ps.setString(2,uname);
	            ps.setString(3,psw);
	            int x = ps.executeUpdate();
	            response.sendRedirect("sp_page.jsp");
	            session.setAttribute("msg","1");
			}
			
			else
			{	
			response.sendRedirect("sp_page.jsp");
			session.setAttribute("msg","0");
			}
		}
		
		catch(Exception e) {
			response.sendRedirect("Test.jsp?error="+e);
		}
	}

}
