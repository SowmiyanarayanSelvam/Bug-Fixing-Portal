import javax.servlet.http.*;
import java.sql.*;
import javax.servlet.ServletException;
import java.io.*;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map.Entry;
import java.util.List;
import java.util.Random;

//@WebServlet("/Register")
public class Viewprofile extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();

        Connection conn=null;
        HttpSession session=request.getSession(false);
	   	out.print("<!DOCTYPE html> <html lang='en'> <head> <meta charset='UTF-8'> <meta http-equiv='X-UA-Compatible' content='IE=edge'> <meta name='viewport' content='width=device-width, initial-scale=1.0'> <title>View Profile</title> <link rel='stylesheet' href='viewprofile.css'> <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'> <script src='https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js' integrity='sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj' crossorigin='anonymous'> </script> <link href='https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css' rel='stylesheet' integrity='sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We' crossorigin='anonymous'> <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css'> <script src='javascript/common.js'></script> </head> <body> <div class='header1 row' style='margin:0px 0px 0px 0px'> <nav class='navbar navbar-dark bg-black navbar-brand'> <div class='logo col-md-2 '> <img class='img1' src='images/logo.png' alt='logo'> <!-- <img class='img2' src='images/profile.png' alt='profile'> --> </div> <div class='slogan col-md-6 justify-content-center'> <h1 style='margin-top:45px;color: aliceblue; font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif'> Don't let the tech bugs bite.</h1> </div> <div class='icon col-md-2 '> <!-- <img class='img2' src='images/profile.png' alt='profile'> --> <a href='dashboard.jsp'> <img class='img2' src='images/profile.png' alt='profile'></a> </div> </nav> </div> <!-- <button type='button' class='btn btn-secondary update'>Update Profile</button> --> <a href='editprofile.jsp'> <button type='button' class='btn btn-secondary update'>Update Profile</button> </a>");

       try{
    	   	  Class.forName("com.mysql.jdbc.Driver");
    		  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugfixingportal","root","1234");
    		  //String uname =(String)session.getAttribute("user");
    		  //String psw=request.getParameter("psw");
    		  int tot=0;int count=0;
    		  HashMap<String, Integer> dict = new HashMap<String, Integer>();
    		  if (conn!=null){
    			  PreparedStatement ps= conn.prepareStatement("select * from user_details where username=?");

    			  ps.setString(1,(String)session.getAttribute("user"));
    			  ResultSet x = ps.executeQuery();
    			  //out.print(x);
    			  int y=0;
    			  String y1="";String y2="";String y3="";int y4=0;String y5="";
    			  String y6=""; 
    			  
    			  while(x.next()){
    				  y1=x.getString("name");
    				  y2=x.getString("email");
    				  y3=x.getString("date_of_birth");
    				  y4=x.getInt("points");
    				  y5=x.getString("level");
    				  y6=x.getString("interests");
    				  
    				  y+=1;
    				  
    				 
    				  
    			  }
    			  PreparedStatement ps1= conn.prepareStatement("select * from interaction where username=?");
				  ps1.setString(1,(String)session.getAttribute("user"));
				  ResultSet x1 = ps1.executeQuery();
				  String pid="";
				  String tag="";
				   // import the HashMap class

				 
				 
				  while(x1.next()) {
					  pid= x1.getString("problem_id");
					  System.out.println(pid);
					  PreparedStatement ps2= conn.prepareStatement("select * from issues where problem_id=?");
					  ps2.setString(1,pid);
					  ResultSet x2 = ps2.executeQuery();
					  
					  while(x2.next())
					  { tag=x2.getString("domain");
					  System.out.println(tag);
					  if (y6.contains(tag))
					  {
						  count=count+1;
						  System.out.println("in3");
					  {if (dict.containsKey(tag))
			            {
						    System.out.println("in");
			                dict.put(tag, dict.get(tag) + 1);
			            }
			            else
			            {
			            	 System.out.println("in1");
			                dict.put(tag, 1);
			            }
					  
					  } }}}
				  System.out.println(dict);
				  
				  for (Entry<String, Integer> pair : dict.entrySet()) {
				      tot += pair.getValue();
				  }
				  
				  
    			  if(y>0){
    				  
    				  
    				  
    				  out.print("<div class='card'><img src='images/profilephoto.jpg'  alt='John' style='width:100%'><h1>"+y1+"</h1><p class='title'>Student</p></div>");
       
    	out.print("<div class='card1 col-md-8 offset-3'><div class='left'><p><b>Username</b> </p> <p><b>Email ID</b></p>  <p><b>Date of Birth</b></p> <p><b>Points</b> </p><p><b>Level</b> </p><p><b>Interests</b> </p></div>");
    	out.print("<div class='right'><p>"+(String)session.getAttribute("user")+"</p> <p>"+y2+"</p><p>"+y3+"</p><p>"+y4+"</p><p>"+y5+"</p><p>"+y6+"</p> </div>");
    	         
    			  }
    			  else{
    				  out.print("<p name='res' value='no'>problem!!</p>");
    			  }
    		  }
    		  List<String> list = new ArrayList<>();
    	        // add 5 element in ArrayList
    	        list.add("#04AA6D");
    	        list.add("#2196F3");
    	        list.add("#f44336");
    	        list.add("#808080");
    	       
    		  System.out.println("total"+tot);
    		  out.print("<br> <div style='padding-top: 250px;'> <br> <h3>User Interaction Statistics</h3> <p> This chart represents your interactions corresponding to  areas of interest specified  </p> ");
    		  if (count==0)
    		  {
    			  out.print("<p> You haven't submitted any responses corresponding to your areas of interest yet.</p> ");
    		  }
    		  for (Entry<String, Integer> pair : dict.entrySet()) {
			     System.out.println(pair.getKey());
			     System.out.println(pair.getValue());
			     System.out.println(tot);
			     System.out.println((pair.getValue()*100/tot));
			     Random rand = new Random();
			     out.print("<p>"+pair.getKey()+"</p> <div class='container' > <div class='skills' style='width:"+(((pair.getValue())*100/tot))+"%; background-color:"+list.get(rand.nextInt(list.size()))+";'>"+(((pair.getValue()*100)/tot))+"%</div> </div></body> </html>");

    		  }
    		  }catch(Exception e){
    		  out.print("Something is wrong.."+e);
    	  }
 
        }}