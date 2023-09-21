<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
if(session.getAttribute("user")==null)
	response.sendRedirect("login.jsp");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Profile</title>
    <link rel="stylesheet" href="viewprofile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous">
    </script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <script src="javascript/common.js"></script>
</head>
<body>

    <div class="header1 row" style="margin:0px 0px 0px 0px">
        <nav class="navbar navbar-dark bg-black navbar-brand">
            <div class="logo col-md-2 ">
                <img class="img1" src="images/logo.png" alt="logo">
                <!-- <img class="img2" src="images/profile.png" alt="profile"> -->
            </div>
            <div class="slogan col-md-6 justify-content-center">
                <h1
                    style="margin-top:45px;color: aliceblue; font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif">
                    Don't let
                    the tech bugs bite.</h1>

            </div>
            <div class="icon col-md-2 ">
                <!-- <img class="img2" src="images/profile.png" alt="profile"> -->
                <a href="dashboard.jsp"> <img class="img2" src="images/profile.png" alt="profile"></a>


            </div>

        </nav>

    </div>
    
    <!-- <button type="button" class="btn btn-secondary update">Update Profile</button> -->
    <a href="editprofile.jsp"><button type="button" class="btn btn-secondary update">Update Profile</button> </a>
    <%
  Connection conn=null;
  
  try{
	  Class.forName("com.mysql.jdbc.Driver");
	  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugfixingportal","root","1234");
	  String uname =request.getParameter("uname");
	  String psw=request.getParameter("psw");
	  
	  if (conn!=null){
		  PreparedStatement ps= conn.prepareStatement("select * from user_details where username=?");

		  ps.setString(1,(String)session.getAttribute("user"));
		  ResultSet x = ps.executeQuery();
		  //out.print(x);
		  int y=0;
		  String y1="";String y2="";String y3="";int y4=0;String y5="";String y6="";
		  
		  while(x.next()){
			  y1=x.getString("name");
			  y2=x.getString("email");
			  y3=x.getString("date_of_birth");
			  y4=x.getInt("points");
			  y5=x.getString("level");
			  y6=x.getString("picsource");
					  
			  y+=1;
		  }
		  
		  if(y>0){
			  if(y6.equals(""))
			  out.print("<div class='card'><img src='images//profilephoto.jpg' alt='John' style='width:100%'><h1>"+y1+"</h1><p class='title'>Student</p></div>");
			  
			  else
				  out.print("<div class='card'><img src='"+y6+"' alt='John' style='width:100%'><h1>"+y1+"</h1><p class='title'>Student</p></div>");
			  
out.print("<div class='card1 col-md-8 offset-3' style='height:auto'><div class='left'><p><b>Username</b> </p> <p><b>Email ID</b></p>  <p><b>Date of Birth</b></p> <p><b>Points</b> </p><p><b>Level</b> </p><p><b>Interests</b> </p></div>");
out.print("<div class='right'><p>"+(String)session.getAttribute("user")+"</p> <p>"+y2+"</p><p>"+y3+"</p><p>"+y4+"</p><p>"+y5+"</p><p>Machine Learning, Python , Java </p> </div>");
         
		  }
		  else{
			  out.print("<p name='res' value='no'>problem!!</p>");
		  }
	  }
  }catch(Exception e){
	  out.print("Something is wrong.."+e);
  }
  %>
<br>
        <div style="padding-top: 250px;">
          <br>
          <h3>User Interaction Statistics</h3>

          <p> These charts represents the level of correctness in your solutions based on the domain </p>
              <p>HTML</p>
              <div class="container">
                <div class="skills html">90%</div>
              </div>
              
              <p>CSS</p>
              <div class="container">
                <div class="skills css">80%</div>
              </div>
              
              <p>JavaScript</p>
              <div class="container">
                <div class="skills js">65%</div>
              </div>
              
              <p>PHP</p>
              <div class="container">
                <div class="skills php">60%</div>
              </div>
        </div>
      
        
      </div>    
    
</body>
</html>