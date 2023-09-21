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
    <title>Dashboard</title>
    <link rel="icon" href="images/logo.png" type="image/icon type" class="logo">
    <link rel="stylesheet" href="dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous">
    </script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="javascript/common.js"></script>
</head>
<%@ page import="java.sql.*" %>
<body>
    <div class="outer" >
        <div class="header1 row" style="margin:0px 0px 0px 0px">
            <nav class="navbar navbar-dark bg-black navbar-brand">
                <div class="logo col-md-2 ">
                    
                    <div class="dropdown">
                        <button class="dropbtn"><img class="img1" src="images/logo.png" alt="logo"></button>
                        <div class="dropdown-content">
                          <a href="aboutus.jsp">About Us</a>
                          <a href="Viewprofile">View My Profile</a>
                          <a href="feedback.jsp">Feedback</a>
                          <a href="sp_page.jsp">Upgrade to SP</a>
                          <a href="myissues">Issues Page</a>
                          <a href="myanswers">Responses</a>
                          <a href="logout">Logout</a>

                        </div>
                        
                      </div>
                </div>
                <div class="slogan col-md-6 justify-content-center">
                    <h1
                        style="margin-top:45px;color: aliceblue; font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif">
                        Don't let
                        the tech bugs bite.</h1>

                </div>
                <div class="icon col-md-2 ">
                    <img class="img2" src="images/profile.png" alt="profile">

                </div>

            </nav>

        </div>
        
        <div style="background-color:red">
        <%
		session = request.getSession();
		out.println("<h1 style='font-size:25px'>"+(String)session.getAttribute("user")+"</h1>");
		
		%>
        
        </div>
		<script>
  	function getvals(){
  		var sPageURL = window.location.search.substring(1);
  		var ans=sPageURL.split('=')
  		console.log(ans[1])
  		if (ans.length>0){

  			document.getElementById("msg").innerHTML=ans[1].replace(/%20/g,' ')
  		}
  	}
  	</script> 
	<p id="msg"><script>getvals()</script></p>
        <div class="container">
            <div class="query col-offset-2 col-md-6">
                <!-- button -->
                <a href="raise_issue.jsp"> <button type="button" onmouseenter="highlightBtn(this)" onmouseleave="highlightBtn(this)">Raise a ticket</button> </a>
                <!-- <button type="button">Raise a ticket</button> -->
            </div>
            <br>
            <br>
            <div class="search">
                <!-- text,input -->
                <div class="inp">

                    <form action="search_result.jsp" method="post" class="example col-offset-2">
                        <input type="text" placeholder="Search.." name="search" />
                       <a href="search_result.jsp" ><button type="submit" style="padding-bottom: 10px"><i class="fa fa-search"></i></button></a>

                    </form>

                </div>
                <!-- <div class="sub">

            </div> -->

            </div>
        </div>
      
        <div class="popular col-md-6 offset-md-3">
       
      <%   String uname =(String)session.getAttribute("user");
      out.print("<p>Welcome back "+ uname+"! these are the latest queries on the forum which you might have missed. </p>");
      %>
            <table class="table table-success   popular-table"> 
                <thead>
                    <tr>
                        <th scope="col">Creator</th>
                        <th scope="col">Domain</th>
                        <th scope="col">Problem</th>
                        <th scope="col">Interactions</th>
                    </tr>
                </thead>
                <tbody>
                 <% 
                 
                 
                 Connection conn=null;
                 try{
                 	Class.forName("com.mysql.jdbc.Driver");
               	  	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugfixingportal","root","1234");
               	  	uname =(String)session.getAttribute("user");
                 	
                 	String y2="";String y3="";String y4="";String y5="";int y6;int y7=0;int interactions;
                 	
                 	 if (conn!=null){
                 		
                		  PreparedStatement ps1= conn.prepareStatement("SELECT * FROM issues ORDER BY problem_id DESC LIMIT 7");

                		  
                		  ResultSet x1 = ps1.executeQuery();
                		  while(x1.next()){
                			  y2=x1.getString("username");
                			  y3=x1.getString("prob");
                			  y4=x1.getString("domain");
                			  y5=x1.getString("description");
                			  y6=x1.getInt("problem_id");
                			  PreparedStatement ps2= conn.prepareStatement("SELECT * FROM interaction where problem_id=?");
							  ps2.setInt(1,y6);
                    		  
                    		  ResultSet x2 = ps2.executeQuery();
                    		  interactions=0;
                    		  while(x2.next()){interactions=interactions+1;}
                			  out.print("<tr> <td>"+y2+"</td> <td>"+y4+"</td><td><a href=\"issue.jsp?issue="+y6+"\">"+y3+"</td><td>"+interactions+"</td></tr>");
                		  }
                		  	
                         
                            
                        
                 	 }
                 }catch(Exception e){
                 	out.print("<h1>null</h1>");
                 }
 %>
                </tbody>
            </table>
        </div>

       
    </div>
</body>

</html>