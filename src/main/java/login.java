import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.ServletException;
import java.io.*;


//@WebServlet("/Register")
public class login extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();

        Connection conn=null;
        
        try{
        	String uname = (String)request.getParameter("uname");
            String pass = (String)request.getParameter("psw");
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugfixingportal","root","1234");
             
            if (conn!=null){
                try{
                	
                PreparedStatement ps= conn.prepareStatement("select * from user_details where username=? and password=?");
                
                ps.setString(1,uname);
                ps.setString(2,pass);
                ResultSet x = ps.executeQuery();
                out.print("in");

                String y1="";
                int y2=0;
                
                if(x!=null){
                			x.next();
                			y1=x.getString("username");
                			y2=x.getInt("points");
                			
                            HttpSession log = request.getSession();
                            log.setAttribute("user", uname);
                            if (y2<2000) {
                            	log.setAttribute("msg", "0");
                            }
                            response.sendRedirect("dashboard.jsp");
                        
                    }
                    
                
                else{
                    ps = conn.prepareStatement("select * from sp where email=? and pwd=?");

                    ps.setString(1,uname);
                    ps.setString(2,pass);
                    
                    x = ps.executeQuery();
                    
                    if(x != null)
                    {
                    	x.next();
                    	HttpSession log = request.getSession();
                        log.setAttribute("user", x.getString("username"));
                        response.sendRedirect("sp_dashboard.jsp");
                    }
                    	
                    	
                    	
                    else
                    {
                    	String msg="Login failed . Invalid Credentials";
                        response.sendRedirect("login.jsp?msg="+msg);
                    }
                    
                   
                }
                }catch(Exception e){
                    out.print(e);
                    e.printStackTrace();
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }

    	}}