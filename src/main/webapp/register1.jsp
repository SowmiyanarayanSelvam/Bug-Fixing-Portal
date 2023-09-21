<%@page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
  Connection conn=null;
  
  try{
	  Class.forName("com.mysql.jdbc.Driver");
	  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugfixingportal","root","1234");
	  String name =request.getParameter("name");
	  String uname =request.getParameter("uname");
	  String psw=request.getParameter("psw");
	  
	  if (conn!=null){
		  try{
		  PreparedStatement ps= conn.prepareStatement("insert into users values(?,?)");

		  ps.setString(1,uname);
		  ps.setString(2,psw);
		  int x = ps.executeUpdate();
		  if(x>0){
			  //out.print("registered successfully");
			  try{
				  PreparedStatement ps1= conn.prepareStatement("insert into user_details(username,name) values(?,?)");
				  ps1.setString(1,uname);
				  ps1.setString(2,name);
				  int x1 = ps1.executeUpdate();
				  if(x1>0){
					  String msg="Registered Successfully!";
					  String redirectURL = "http://localhost:8080/BFP/?msg="+msg;
					  response.sendRedirect(redirectURL);
				  }
				  else{
					  String msg="Failed in inner else";
					  String redirectURL = "http://localhost:8080/BFP/?msg="+msg;
					  response.sendRedirect(redirectURL);
				  }
			  }catch(Exception e){
				  String msg="Failed in inner else with error";
				  String redirectURL = "http://localhost:8080/BFP/?msg="+msg;
				  response.sendRedirect(redirectURL);
			  }
			  
		  }
		  else{
			  //out.print("registration failed .Acc already exists!:(((( ");
			  String msg="registration failed .Acc already exists!:(((( ";
			  String redirectURL = "http://localhost:8080/BFP/?msg="+msg;
			  response.sendRedirect(redirectURL);
		  }
		  }catch(Exception e){
			  String msg="registration failed .Acc already exists with error!:(((( ";
			  String redirectURL = "http://localhost:8080/BFP/?msg="+msg;
			  response.sendRedirect(redirectURL);
		  }
	  }
  }catch(Exception e){
	  out.print("Something is wrong.."+e);
  }
  %>
</body>
</html>