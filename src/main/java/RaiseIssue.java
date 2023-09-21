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


public class RaiseIssue extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public RaiseIssue() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		Connection conn = null;
		PrintWriter out = response.getWriter();
		
		try {
			String prob = (String)request.getParameter("problem");
			String domain = (String)request.getParameter("probdomain");
			String desc = (String)request.getParameter("probdesc");
			String type = (String)request.getParameter("ticktype");
			
			Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugfixingportal","root","1234");
            
            HttpSession session = request.getSession();
            
            PreparedStatement ps= conn.prepareStatement("insert into issues(username,prob,domain,description,type) values(?,?,?,?,?)");
            ps.setString(1,(String)session.getAttribute("user"));
            ps.setString(2,prob);
            ps.setString(3,domain);
            ps.setString(4,desc);
            ps.setString(5,type);
            int x = ps.executeUpdate();
            if(type.equals("direct")){
            	PreparedStatement temp= conn.prepareStatement("select points,level from user_details where username=?");
                temp.setString(1,(String)session.getAttribute("user"));
                ResultSet rs=temp.executeQuery();
                int pts=0;
                String lvl="";
                while(rs.next()) {
                	pts=rs.getInt("points");
                	lvl=rs.getString("level");
                }
                pts=pts-3;
                if(pts>=0 && pts<10){
                    lvl="Bronze";
                }
                if(pts>=10 && pts<20){
                    lvl="Silver";
                }
                if(pts>=20 && pts<30){
                    lvl="Gold";
                }
                if(pts>=30 && pts<40){
                    lvl="Platinum";
                }
                if(pts>40){
                    lvl="Diamond";
                }
                PreparedStatement item=conn.prepareStatement("update user_details set points=?, level=? where username=?");
                item.setInt(1, pts);
                item.setString(2, lvl);
                item.setString(3, (String)session.getAttribute("user"));
                x=item.executeUpdate();
                if(x>0) {
                	out.print(pts+" "+lvl+" "+(String)session.getAttribute("user"));
                	//response.sendRedirect("myissues");
                    //session.setAttribute("msg","1");
                }
                
            }
            response.sendRedirect("myissues");
            session.setAttribute("msg","1");
		}
		
		catch (Exception e) {
			response.sendRedirect("Test.jsp?error="+e);
		}
	}

}
