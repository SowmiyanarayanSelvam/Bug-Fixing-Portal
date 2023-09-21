

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.sql.*;
/**
 * Servlet implementation class myanswers
 */
@WebServlet("/myanswers")
public class myanswers extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public myanswers() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub

        PrintWriter out = response.getWriter();

        Connection conn=null;
        HttpSession session=request.getSession(false);
	   	out.print("<!DOCTYPE html> <html lang='en'> <head> <meta charset='UTF-8'> <meta http-equiv='X-UA-Compatible' content='IE=edge'> <meta name='viewport' content='width=device-width, initial-scale=1.0'> <title>View Profile</title> <link rel='stylesheet' href='viewprofile.css'> <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'> <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js' integrity='sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj' crossorigin='anonymous'> </script> <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We' crossorigin='anonymous'> <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'> <script src='javascript/common.js'></script> </head> <body> <div class='header1 row' style='margin:0px 0px 0px 0px'> <nav class='navbar navbar-dark bg-black navbar-brand'> <div class='logo col-md-2 '> <img class='img1' src='images/logo.png' alt='logo'> <!-- <img class='img2' src='images/profile.png' alt='profile'> --> </div> <div class='slogan col-md-6 justify-content-center'> <h1 style='margin-top:45px;color: aliceblue; font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif'> Don't let the tech bugs bite.</h1> </div> <div class='icon col-md-2 '> <!-- <img class='img2' src='images/profile.png' alt='profile'> --> <a href='dashboard.jsp'> <img class='img2' src='images/profile.png' alt='profile'></a> </div> </nav> </div> ");

       try{
    	   	  Class.forName("com.mysql.jdbc.Driver");
    		  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugfixingportal","root","1234");
    		  //String uname =(String)session.getAttribute("user");
    		  //String psw=request.getParameter("psw");
    		  
    		  if (conn!=null){
    			  PreparedStatement ps= conn.prepareStatement("select * from interaction where username=?");

    			  ps.setString(1,(String)session.getAttribute("user"));
    			  ResultSet x = ps.executeQuery();
    			  //out.print(x);
    			  int y=0;
    			  String y1="";String y2="";int y3=0;int y6=0;
    			  
    out.print("<div class=\"text-center\" style=\"padding-top: 3%;\">\r\n"
    		+ "        <h4>MY RESPONSES <svg xmlns=\"http://www.w3.org/2000/svg\" width=\"32\" height=\"32\" fill=\"currentColor\" class=\"bi bi-check2-circle\" viewBox=\"0 0 16 16\">\r\n"
    		+ "            <path d=\"M2.5 8a5.5 5.5 0 0 1 8.25-4.764.5.5 0 0 0 .5-.866A6.5 6.5 0 1 0 14.5 8a.5.5 0 0 0-1 0 5.5 5.5 0 1 1-11 0z\"/>\r\n"
    		+ "            <path d=\"M15.354 3.354a.5.5 0 0 0-.708-.708L8 9.293 5.354 6.646a.5.5 0 1 0-.708.708l3 3a.5.5 0 0 0 .708 0l7-7z\"/>\r\n"
    		+ "          </svg></h4>\r\n"
    		+ "        </div>");	 
	//out.print("<div class='card1 col-md-8 offset-3'><div class='left'><p><b>Username</b> </p> <p><b>Email ID</b></p>  <p><b>Date of Birth</b></p> <p><b>Points</b> </p><p><b>Level</b> </p><p><b>Interests</b> </p></div>");
	//out.print("<div class='right'><p>"+(String)session.getAttribute("user")+"</p> <p>"+y2+"</p><p>"+y3+"</p><p>"+y4+"</p><p>"+y5+"</p><p>"+y6+"</p> </div>");
	         out.print("<div style=\"text-align:center;\">\r\n"
	         		+ "        </div>\r\n"
	         		+ "        <div class=\"active col-md-6 offset-md-3\">\r\n"
	         		+ "            <table class=\"table table-primary active-table\"> \r\n"
	         		+ "                <thead>\r\n"
	         		+ "                    <tr>\r\n"
	         		+ "                        <th scope=\"col\">Tags</th>\r\n"
	         		+ "                        <th scope=\"col\">Query</th>\r\n"
	         		+ "                        <th scope=\"col\">My Response</th>\r\n"
	         		+ "                        <th scope=\"col\">Approval Status</th>\r\n"                
	         		+ "                    </tr>\r\n"
	         		+ "                </thead>");
			  
    			  while(x.next()){
    				  
    				  y1=x.getString("response");
    				  y2=x.getString("solved");
    				  y6=x.getInt("problem_id");
    				 
    				  
    			
    			  
    				  PreparedStatement ps1= conn.prepareStatement("select * from issues where problem_id=?");

        			  ps1.setInt(1,y6);
        			  ResultSet x1 = ps1.executeQuery();
    				  String z1="";
    				  String z2="";
        			  while(x1.next())
        			  {
        				  z1=x1.getString("domain");
        				  z2=x1.getString("prob");
        				  
        			  
        			  
    			 
    				 out.print("<tbody>\r\n"
    				 		+ "                    <tr>\r\n"
    				 		+ "                        <td>"+  z1  +"</td>\r\n"
    				 		+ "                        <td><a href=\"issue.jsp?issue="+y6+"\">"+z2+"</a></td>\r\n"
    				 		+ "                        <td>" +y1+ "</td>\r\n"
    				 		+ "                        <td>"+ y2 +"</td>\r\n"                    
    				 		+ "                    </tr>");
    			 
        			  }}}
    			  
    		  
    		 
    	  }catch(Exception e){
    		  out.print("Something is wrong.."+e);
    	  }
	}

}
