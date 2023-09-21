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
    <title>Edit Profile</title>
    <link rel="icon" href="images/logo.png" type="image/icon type" class="logo">
    <link rel="stylesheet" href="editprofile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous">
    </script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="javascript/common.js"></script>
    <script src="javascript/editprofile.js"></script>
    <!-- <script src="//ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->


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
<form action="Editprofile" method="post" enctype="multipart/form-data">

    <div class="card">
        <img src="images/profilephoto.jpg" alt="John" style="width:100%">
        <%
        Connection conn=null;
        session=request.getSession();
        try{
        	Class.forName("com.mysql.jdbc.Driver");
      	  	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugfixingportal","root","1234");
      	  	String uname =(String)session.getAttribute("user");
        	
        	String y1="";
        	
        	 if (conn!=null){
       		  PreparedStatement ps= conn.prepareStatement("select name from user_details where username=?");

       		  ps.setString(1,uname);
       		  ResultSet x = ps.executeQuery();
       		  while(x.next()){
       			  y1=x.getString("name");
       		  }
       			out.print("<h1>"+y1+"</h1>");
        	 }
        }catch(Exception e){
        	out.print("<h1>null</h1>");
        }
        %>
        
        <p class="title">Student</p>
        

    </div>


    <div class="card1 col-md-8 offset-3">

        <label for="test" class="new"><b>Username</b> </label>
        <% session = request.getSession();
        out.print("<span><input name='username' id='username' type='text' value='"+(String)session.getAttribute("user")+"' readonly /></span>"); %>
        
        <br>
        <label for="test" class="new"><b>Old Password</b> </label>
        <span><input name="old_password" id="old_password" type="password" /></span>
        <br>
        <label for="test" class="new"><b>New Password</b> </label>
        <span><input name="new_password" id="new_password" type="password" onfocus="onFocus()" onblur="onBlur()" onkeyup="onKeyUp()" /></span>
        <div id="message" style="display:none; background-color: rgb(128,128,128,0.5); padding: 25px;" >
            <h3>Password must contain the following:</h3>
            <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
            <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
            <p id="number" class="invalid">A <b>number</b></p>
            <p id="length" class="invalid">Minimum <b>8 characters</b></p>
          </div>
        <br>
        <label for="test" class="new"><b>Confirm Password</b> </label>
        <span><input name="confirm_password" id="confirm_password" type="password" onfocus="onFocusCPs()" onblur="onBlurCPs()" onkeyup="onKeyUpCPs()"
         /></span>
        <div id="message2" style="display:none; background-color: rgb(128,128,128,0.5); padding: 25px;" >
            <p id="match" class="invalid"><b>Passwords must match</b></p>
        </div>
        <br>
        <label for="test" class="new"><b>Email ID</b> </label>
        <span><input name="emailid" id="emailid" type="email" /></span>
        <br>
        <label for="test" class="new"><b>Date of Birth</b> </label>
        <% try{
        	Class.forName("com.mysql.jdbc.Driver");
      	  	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugfixingportal","root","1234");
      	  	String uname =(String)session.getAttribute("user");
        	
        	String y1="";
        	
        	 if (conn!=null){
       		  PreparedStatement ps= conn.prepareStatement("select date_of_birth from user_details where username=?");

       		  ps.setString(1,uname);
       		  ResultSet x = ps.executeQuery();
       		  while(x.next()){
       			  y1=x.getString("date_of_birth");
       		  }
       		  	if(y1.equals("01/01/1900")){
       		  		out.print("<span><input name='dob' id='dob' type='date' /></span>");
       		  	}
       		  	else{
       		  		out.print("<span><input name='dob' id='dob'value='"+y1+"' type='text' readonly/></span>");

       		  	}
        	 }
        }catch(Exception e){
        	out.print("<h1>null</h1>");
        } %>
        
        
        <br>
        
        <label for="test" class="new"><b>Interests</b> </label>
        <div class="row">
            <div class="col-lg-12">
            <%
            
            try{
            	Class.forName("com.mysql.jdbc.Driver");
          	  	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugfixingportal","root","1234");
          	  	String uname =(String)session.getAttribute("user");
            	
            	String y1="";
            	
            	 if (conn!=null){
           		  PreparedStatement ps= conn.prepareStatement("select interests from user_details where username=?");

           		  ps.setString(1,uname);
           		  ResultSet x = ps.executeQuery();
           		  while(x.next()){
           			  y1=x.getString("interests");
           		  }
           		  	String[] arr=y1.split(",");
           			for(int i=0;i<arr.length;i++){
                    out.print("<div id='inputFormRow'> <div class='input-group mb-3'> <input type='text' name='title[]' id='title[]' class='form-control m-input' value='"+arr[i]+"' autocomplete='off'> <div class='input-group-append'> <button id='removeRow' type='button' class='btn btn-danger'>Remove</button> </div> </div> </div>");
                    }
            	 }
            }catch(Exception e){
            	out.print("<h1>null</h1>");
            }
            
                 %>
                
                <div id="inputFormRow">
                <div class="input-group mb-3">
                    <input type="text" name="title[]" id="title[]" class="form-control m-input" placeholder="Enter title" autocomplete="off">
                    <div class="input-group-append">                
                        <button id="removeRow" type="button" class="btn btn-danger">Remove</button>
                    </div>
                </div>
            </div>
    
                <div id="newRow"></div>
                <button id="addRow" type="button" class="btn btn-info">Add Row</button>
            </div>
        </div>
        <!-- <label for="test" class="new"><b>Interests</b> </label>
        <span><input name="interests" id="interests" type="text" /></span> -->
        <br>
       
        <br><br><br>
         <button type="submit" id="save_changes" class="btn btn-success update">Save Changes</button>
    </div>
    </form>


</body>
</html>