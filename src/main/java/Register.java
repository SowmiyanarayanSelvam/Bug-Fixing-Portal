import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.ServletException;
import java.io.*;


//@WebServlet("/Register")
public class Register extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();

        Connection conn=null;
        
        try{
        	String uname = (String)request.getParameter("uname");
            String pass = (String)request.getParameter("psw");
            String name = (String)request.getParameter("name");
            Class.forName("com.mysql.jdbc.Driver");
            conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugfixingportal","root","1234");
             
            if (conn!=null){
                try{
                	
                PreparedStatement ps= conn.prepareStatement("insert into user_details(username,name,password) values(?,?,?)");
                
                ps.setString(1,uname);
                ps.setString(2,name);
                ps.setString(3,pass);
                int x = ps.executeUpdate();
                out.print("in");
                if(x>0){
                    //out.print("registered successfully");
                    
                        
                            //String msg="Registration success";
                            //String redirectURL = "hlogin.jsp";
                	HttpSession log = request.getSession();
                    log.setAttribute("user", uname);
                            response.sendRedirect("editprofile.jsp");
                        
                    }
                    
                
                else{
                    //out.print("registration failed .Acc already exists!:(((( ");
                    String msg="registration failed .Acc already exists!:(((( ";
                    String redirectURL = "http://localhost:8080/BFP/?msg="+msg;
                    response.sendRedirect(redirectURL);
                }
                }catch(Exception e){
                    String msg="registration failed .Acc already exists with error!:(((( "+e+name+uname+pass;
                    String redirectURL = "http://localhost:8080/BFP/?msg="+msg;
                    response.sendRedirect(redirectURL);
                }
            }
        }catch(Exception e){
            e.printStackTrace();
        }}}