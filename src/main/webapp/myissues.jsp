<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<% 
response.setHeader("Cache-Control","no-cache, no-store, must-revalidate");
if(session.getAttribute("user")==null)
	response.sendRedirect("login.jsp");
%>

<%
Connection conn=null;

try{
	  Class.forName("com.mysql.jdbc.Driver");
	  conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugfixingportal","root","1234");
	  out.print((String)request.getParameter("best").split(" ")[0]);
	  String best=((String)request.getParameter("best")).split(" ")[0];
	  int ans=Integer.parseInt((String)request.getParameter("pr"));
	  int internum=Integer.parseInt(((String)request.getParameter("best")).split(" ")[1]);
	  if (conn!=null){
		  PreparedStatement ps=conn.prepareStatement("update issues set status=? where problem_id=?");
		  ps.setString(1,"closed");
		  ps.setInt(2,ans);
		  int x =ps.executeUpdate();
		  out.print("ans:and internum"+ans+""+internum+"");
		  if (x>0){
			  PreparedStatement ps1=conn.prepareStatement("update interaction set solved=? where problem_id=? and inter_num=?");
			  ps1.setString(1,"Y");
			  ps1.setInt(2,ans);
			  ps1.setInt(3,internum);
			  x =ps1.executeUpdate();
			  if(x>0){
				  int p=0;
				  String l="";
				  //out.print("here0");
				  PreparedStatement ps2=conn.prepareStatement("select points,level from user_details where username=?");
				  ps2.setString(1,best);
				  ResultSet x1=ps2.executeQuery();
				  while(x1.next()){
					  p=x1.getInt("points");
					  l=x1.getString("level");
				  }
				  if(((String)session.getAttribute("user")).equals(best)==false){
				  p+=5;
				  }
				  if(p>=0 && p<10){
					  l="Bronze";
				  }
				  if(p>=10 && p<20){
					  l="Silver";
				  }
				  if(p>=20 && p<30){
					  l="Gold";
				  }
				  if(p>=30 && p<40){
					  l="Platinum";
				  }
				  if(p>40){
					  l="Diamond";
				  }
				  out.print("here"+p+""+l+"");
				  PreparedStatement ps3=conn.prepareStatement("update user_details set points=? ,level=? where username=?");
				  
				  ps3.setInt(1,p);
				  ps3.setString(2,l);
				  ps3.setString(3,best);
				  int x2 =ps3.executeUpdate();
				  if (x>0){
					  response.sendRedirect("myissues");
				  }
			  }
		  }
	  }
}catch(Exception e){
	out.print("error\n"+e+"");
}
%>
