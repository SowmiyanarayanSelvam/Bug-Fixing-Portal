

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class IssuePage
 */
@WebServlet("/IssuePage")
public class IssuePage extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//PrintWriter out = response.getWriter();
		HttpSession session=request.getSession(false);
        Connection conn=null;
        
        try{
        	Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugfixingportal","root","1234");
        	String user=(String)session.getAttribute("user");
        	int issueno=Integer.parseInt((String)request.getParameter("issueval"));
        	String content=(String)request.getParameter("addcomment");
        	int x1=0;
        	 PreparedStatement ps= conn.prepareStatement("SELECT COUNT(*) AS L FROM INTERACTION");
        	 ResultSet x =ps.executeQuery();
        	 while(x.next()) {
        		 x1=x.getInt("L");
        	 }
        	 PreparedStatement ps1= conn.prepareStatement("INSERT INTO INTERACTION(problem_id , inter_num , username , response) VALUES (?,?,?,?)");
        	 ps1.setInt(1,issueno);
        	 ps1.setInt(2,x1+1);
        	 ps1.setString(3,user);
        	 ps1.setString(4,content);
        	 int x2=ps1.executeUpdate();
        	 //out.print("<p> reached till here -"+x2+</p>)
        	 if(x2>0) {
        		 response.sendRedirect("issue.jsp?issue="+issueno);
        	 }
        	 
        	//out.print("<p>"+user+"mp"+issueno+"</p>");
        	
        }catch(Exception e) {
        	
        }
	}

}
