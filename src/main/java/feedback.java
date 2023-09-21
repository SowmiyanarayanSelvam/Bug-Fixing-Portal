import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.ServletException;
import java.io.*;


//@WebServlet("/Register")
public class feedback extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();

        Connection conn=null;
        HttpSession session=request.getSession(false); 
       try{
        	  String uname = (String)session.getAttribute("user");
              int rating=-1;
              //out.print((String)request.getAttribute("feedback1"));
              String desc = (String)request.getParameter("comments");
              Class.forName("com.mysql.jdbc.Driver");
              conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugfixingportal","root","1234");
              for (int i=0;i<5;i++) {
            	  String temp=(String)request.getParameter(Integer.toString(i));
            	  if(temp!=null && rating==-1) {
            		  rating =i+1;
            	  }
              }
           if (conn!=null){
              try{               	
               PreparedStatement ps= conn.prepareStatement("insert into feedback values(?,?,?)");
                
               ps.setString(1,uname);
                ps.setInt(2,rating);
                ps.setString(3,desc);
                int x = ps.executeUpdate();
                out.print("in");
                if(x>0){
                   //out.print("registered successfully");
                    
                       
                           String msg="success";
                           //String redirectURL = "hlogin.jsp";
                           response.sendRedirect("dashboard.jsp?msg="+msg);
                       
                   }
                    
                
               else{
                   //out.print("registration failed .Acc already exists!:(((( ");
            	   String msg="failed";
                   //String redirectURL = "hlogin.jsp";
                   response.sendRedirect("dashboard.jsp?msg="+msg);
                }
                }catch(Exception e){
                	String msg="error";
                    //String redirectURL = "hlogin.jsp";
                    response.sendRedirect("dashboard.jsp?msg="+msg);
                }
            }
       }catch(Exception e){
            e.printStackTrace();
       }
 
        }}