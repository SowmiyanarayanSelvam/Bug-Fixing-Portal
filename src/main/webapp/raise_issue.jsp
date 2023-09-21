<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<% 
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
if(session.getAttribute("user")==null)
	response.sendRedirect("login.jsp");
%>
<%@ page import="java.sql.*" %>
<html>
  <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Raise Issue</title>
    <link rel="icon" href="images/logo.png" type="image/icon type" class="logo">
    <link rel="stylesheet" href="sp_page.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous">
    </script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <script src="javascript/common.js"></script>
</head>
<body>

    <div class="float-container">
      <div class="header1 row" style="margin:0px 0px 0px 0px">
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
<form  method="post" action="RaiseIssue">  
    <div class="container" style="position: relative; padding-top: 4%;">
        <div class="new">
        <h2><strong>RAISE A TICKET</strong></h2>
        <br>
        <label for="problem">Problem</label>
      <input type="text" placeholder="Problem" name="problem" id="problem" required>
      <label for="probdomain">Problem Domain</label>
      <input type="text" placeholder="Problem Domain(s)" id="probdomain" name="probdomain" required>
      <label for="probdesc">Problem Description</label>
      <br>
      <br>
      <textarea style="font-size: 13pt; " rows="10" cols="106" placeholder="Problem Description" name="probdesc" required ></textarea>
	  <br><br>
	  Ticket Type
	  <br>
	  <input type="radio" id="normal" name="ticktype" value="normal" style="margin-top:15px">
	  <label for="normal">Normal</label>
	  <br> 
      <br>
	  <%try{
	      	Class.forName("com.mysql.jdbc.Driver");
	    	Connection conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugfixingportal","root","1234");
	    	String uname =(String)session.getAttribute("user");
	      	
	      	//int y1=0;
	      	//out.print(request.getRequestURL().toString());
	      	//y1=Integer.parseInt(request.getParameter("issue"));
	      	
	      	 if (conn!=null){
	      		//out.print("<p>"+y1"</p>");
	     		  PreparedStatement ps= conn.prepareStatement("select points from user_details where username=?");

	     		  ps.setString(1,uname);
	     		  ResultSet x = ps.executeQuery();
	     		 //out.print("<p>executed</p>");
				 int y6=0;
	     		  while(x.next()){
	     			  y6=x.getInt("points");
	     			  
	     		  }
	     		  
	     		  if(y6>=3){
	     			  out.print("<input type='radio' id='direct' name='ticktype' value='direct'><label for ='direct'>Direct</label><br> <br><br>");

	     		  }
	     		  ;
	      	 }
	      	 else{
	      		out.print("<h1>y1==0</h1>");
	         }
	      	 
	      }catch(Exception e){
	      	out.print("<h1>null</h1>"+e+"mm");
	      } %>
     
      <button type="submit" style="background-color:rgb(59, 59, 184)">Raise Ticket</button>

    </div>
    </div>
  </form> 
</body>
</html>