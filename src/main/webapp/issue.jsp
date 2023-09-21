<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
if(session.getAttribute("user")==null)
	response.sendRedirect("login.jsp");
%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Issue</title>
    <link rel="icon" href="images/logo.png" type="image/icon type" class="logo">
    <link rel="stylesheet" href="issue.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous">
    </script>
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
        <script src="javascript/common.js"></script>
        <script src="javascript/issue.js"></script>
</head>
<body>
    <div class="outer">
      <div class="header1 row">
        <nav class="navbar navbar-dark bg-black navbar-brand">
            <div class="logo col-md-2 ">
                <button class="dropbtn"><img class="img1" src="images/logo.png" alt="logo"></button>
               
            </div>
            <div class="slogan col-md-6 justify-content-center">
                <h1
                    style="margin-top:45px;color: aliceblue; font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif">
                    Don't let
                    the tech bugs bite.</h1>

            </div>
            <div class="icon col-md-2 ">
                <a href="dashboard.jsp"><img class="img2" src="images/profile.png" alt="profile"></a>

            </div>

        </nav>

    </div>
    
    <% 
  	  try{
      	Class.forName("com.mysql.jdbc.Driver");
    	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugfixingportal","root","1234");
    	  	//String uname =(String)session.getAttribute("user");
      	
      	int y1=0;
      	//out.print(request.getRequestURL().toString());
      	y1=Integer.parseInt(request.getParameter("issue"));
      	
      	 if (conn!=null && y1!=0){
      		//out.print("<p>"+y1"</p>");
     		  PreparedStatement ps= conn.prepareStatement("select * from issues where problem_id=?");

     		  ps.setInt(1,y1);
     		  ResultSet x = ps.executeQuery();
     		 //out.print("<p>executed</p>");
			  String y2="";String y3="";String y4="";String y5="";int y6=0;
     		  while(x.next()){
     			  y2=x.getString("prob");
     			  y3=x.getString("Description");
     		  }
     			out.print("<div class='desc'> <h3><b>"+y2+"</b></h3> <br> <p>" +y3+" </p> <br>");
      	 }
      	 else{
      		out.print("<h1>y1==0</h1>");
         }
      	 
      }catch(Exception e){
      	out.print("<h1>null</h1>"+e+"mm");
      }
  		%>
    
        
        <div class="comments">
        <b> Comments:</b>
        </div>
                <%
                
                //HttpSession session=request.getSession(false);
                Connection conn=null;
                
                try{
                	Class.forName("com.mysql.jdbc.Driver");
                    conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugfixingportal","root","1234");
                	int issue=Integer.parseInt((String)request.getParameter("issue"));
                	String y1="";String y2="";
                	PreparedStatement ps= conn.prepareStatement("SELECT username,response,solved FROM INTERACTION where problem_id=?");
                	ps.setInt(1,issue);
               	 	ResultSet x =ps.executeQuery();
               	 	String solved="N";
               	 while(x.next()) {
               		 y1=x.getString("username");
               		 y2=x.getString("response");
               		 out.print("<div class='comments'> <div class='dialogbox'> <div class='body'> <span class='tip tip-left'></span> <div class='message'> <b>"+y1+"</b> <br> <span>"+y2+"</span> <br> ");
               	 	 out.print("</div> </div> </div> </div>");
               	 	 if(x.getString("solved").equals("Y")){
               	 		 solved=y1;
               	 	 }
               	 }
               	 
               	if(solved.equals("N")){
               		out.print("<div class='comments'> <div class='dialogbox'> <div class='body'> <span class='tip tip-left'></span> <br> <form action='IssuePage' method='post'> <input type='hidden' name='issueval' value='"+(String)request.getParameter("issue")+"'/> <textarea id='addcomment' onkeyup='makeit()' placeholder='add comment....' name='addcomment' style='border:solid 1px orange;width:auto'; rows='1';></textarea> <br> <div> <button id='sub' disabled style='background:grey' type='submit' class='btn-primary offset-md-9 col-md-3' >Comment</button></div> </div> </form> </div> </div>");
               	}
               	else{
               		out.print("<h4>Issue Solved by <i>"+solved+"</i></h4>");
               	}
                }catch(Exception e){
                }
                
                %>

                
                        
</body>
</html>