<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
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
    <title>Search Result</title>
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

<body>
    <div class="outer">
        <div class="header1 row" style="margin:0px 0px 0px 0px">
            <nav class="navbar navbar-dark bg-black navbar-brand">
                <div class="logo col-md-2 ">
                    <img class="img1" src="images/logo.png" alt="logo">
                </div>
                <div class="slogan col-md-6 justify-content-center">
                    <h1
                        style="margin-top:45px;color: aliceblue; font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif">
                        Don't let
                        the tech bugs bite.</h1>

                </div>
                <div class="icon col-md-2 ">
                    <a href="dashboard.jsp"> <img class="img2" src="images/profile.png" alt="profile"> </a>

                </div>

            </nav>

        </div>

        <div class="container">
            <div class="row">
                <div class="col-lg-12 card-margin">
                    <div class="card search-form">
                        <div class="card-body p-0">
                            <form id="search-form">
                                <div class="row">
                                    <div class="col-12">
                                        <div class="row">
                                            <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                                                
                                            </div>
                                            <div class="col-lg-8 col-md-6 col-sm-12 p-0">
                                                <input type="text" placeholder="Search..." class="form-control"
                                                    id="search" name="search">
                                            </div>
                                            <div class="col-lg-1 col-md-3 col-sm-12 p-0">
                                                <button type="submit" class="btn btn-base">
                                                    <svg xmlns="http://www.w3.org/2000/svg" width="22" height="24"
                                                        viewBox="0 0 24 24" fill="none" stroke="currentColor"
                                                        stroke-width="2" stroke-linecap="round" stroke-linejoin="round"
                                                        class="feather feather-search">
                                                        <circle cx="11" cy="11" r="8"></circle>
                                                        <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                                                    </svg>
                                                </button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-12">
                    <div class="card card-margin">
                        <div class="card-body">
                            <div class="row search-body">
                                <div class="col-lg-12">
                                    <div class="search-result">
                                        <div class="result-header">
                                            <div class="row">
                                                <div class="col-lg-6">
                                                    <div class="records">
                                                    <% Connection conn=null;try{
                                                    	
                                                    	Class.forName("com.mysql.jdbc.Driver");
                                                  	  	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugfixingportal","root","1234");
                                                  	  	//String uname =(String)session.getAttribute("user");
                                                    	
                                                    	int y1=0;
                                                    	String search=request.getParameter("search").toLowerCase();
                                                    	 if (conn!=null){
                                                    		 PreparedStatement ps= conn.prepareStatement("select problem_id ,prob,domain from issues where lower(prob) like '%"+search+"%' or lower(domain) like '%"+search+"%' or lower(description) like '%"+search+"%' ");

                                                   		  //ps.setString(1,uname);
                                                   		  ResultSet x = ps.executeQuery();
                                                   		  while(x.next()){
                                                   			  y1+=1;
                                                   		  }
                                                   			  out.print(" Showing: <b>1-"+y1+"</b> of <b>"+y1+"</b> result</div>");
                                                   			  
                                                    	 }
                                                    }catch(Exception e){
                                                    	out.print("<h1>null</h1>+e");
                                                    } %>
                                                   
                                                </div>
                                                <div class="col-lg-6">
                                                    <div class="result-actions">
                                                        
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="result-body">
                                            <div class="table-responsive">
                                                <table class="table widget-26">
                                                    <tbody>
                                                    <%
                                                    String search=request.getParameter("search").toLowerCase();
                                                    try{
                                                    	Class.forName("com.mysql.jdbc.Driver");
                                                  	  	conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/bugfixingportal","root","1234");
                                                  	  	//String uname =(String)session.getAttribute("user");
                                                    	
                                                    	String y1="";
                                                    	String y2="";
                                                    	int y3=0;
                                                    	String y4="";
                                                    	 if (conn!=null){
                                                    		 if(search.length()>0){
                                                   		  PreparedStatement ps= conn.prepareStatement("select username,problem_id ,prob,domain from issues where lower(prob) like '%"+search+"%' or lower(domain) like '%"+search+"%' or lower(description) like '%"+search+"%' ");

                                                   		  ResultSet x = ps.executeQuery();
                                                   		  while(x.next()){
                                                   			  y1=x.getString("prob");
                                                   			  y2=x.getString("domain");
                                                   			  y3=x.getInt("problem_id");
                                                   			  y4=x.getString("username");
                                                   			  
                                                   			  out.print("<tr> <td> <div class='widget-26-job-emp-img'> </div> </td> <td> <div class='widget-26-job-title'> <a href='issue.jsp?issue="+y3+"'>"+y1+"</a> <p class='m-0'>"+y2+"<span class='text-muted time'>    4 days ago</span> </p> </div> </td> <td> by user: "+y4+"</td></tr>");
                                                   		  }
                                                    		 }
                                                    		 else{
                                                    			 PreparedStatement ps= conn.prepareStatement("select username,problem_id, prob,domain from issues");

                                                          		  ResultSet x = ps.executeQuery();
                                                          		  while(x.next()){
                                                          			  y1=x.getString("prob");
                                                          			  y2=x.getString("domain");
                                                          			  y3=x.getInt("problem_id");
                                                          			  y4=x.getString("username");
                                                          			  
                                                          			  out.print("<tr> <td> <div class='widget-26-job-emp-img'> </div> </td> <td> <div class='widget-26-job-title'> <a href='issue.jsp?issue="+y3+"'>"+y1+"</a> <p class='m-0'>"+y2+"<span class='text-muted time'>    4 days ago</span> </p> </div> </td><td> by user: "+y4+"</td> </tr>");
                                                          		  }
                                                    		 }
                                                    	 }
                                                    }catch(Exception e){
                                                    	out.print("<h1>null</h1>"+e);
                                                    } 
                                                    %>
                                                        
                                                    </tbody>
                                                </table>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </div>
</body>

</html>