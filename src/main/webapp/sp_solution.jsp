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
<html>
<head>
	<meta charset="ISO-8859-1">
	<meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/logo.png" type="image/icon type" class="logo">
    <link rel="stylesheet" href="dashboard.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous">
    </script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <script src="javascript/common.js"></script>
	<title>Suggest Solution</title>
</head>
<body>
	<div class="outer" >
        <div class="header1 row" style="margin:0px 0px 0px 0px">
            <nav class="navbar navbar-dark bg-black navbar-brand">
                <div class="logo col-md-2 ">
                    
                    <div class="dropdown">
                        <button class="dropbtn"><img class="img1" src="images/logo.png" alt="logo"></button>
                        <div class="dropdown-content">
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
                	<a href="sp_dashboard.jsp">
                    <img class="img2" src="images/profile.png" alt="profile">
					</a>
                </div>

            </nav>

        </div>
        
        <div style="text-align: center; font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin-top:15px">
			<p style="font-size:35px;">Resolve Issue</p>
		</div>
		<%
			Connection conn = null;
			String title = null, desc = null, sol = null;
			int ID=-1;
			try
			{
				Class.forName("com.mysql.jdbc.Driver");
				conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bugfixingportal", "root", "1234");
				
				ID = Integer.parseInt(request.getParameter("issue"));
				sol = request.getParameter("solution");
				if(conn != null)
				{
					if(sol == null)
					{	PreparedStatement ps = conn.prepareStatement("select * from issues where problem_id=?");
						ps.setInt(1,ID);
						
						ResultSet rs = ps.executeQuery();
						
						rs.next();
						title = rs.getString("prob");
						desc = rs.getString("description");		
					}
					
					else
					{
						PreparedStatement ps = conn.prepareStatement("insert into interaction values (?,?,?,?,?)");
						ps.setInt(1, ID);
						ps.setInt(2, 1);
						ps.setString(3, (String)session.getAttribute("user")+" (SP)");
						ps.setString(4, desc);
						ps.setString(5, "Y");
						
						int x = ps.executeUpdate();
						ps = conn.prepareStatement("update issues set status=? where problem_id=?");
						ps.setString(1, "closed");
						ps.setInt(2, ID);
						
						x = ps.executeUpdate();
						
						if(x>0)
							session.setAttribute("msg", "1");
							
						else
							session.setAttribute("msg", "0");

						response.sendRedirect("sp_dashboard.jsp");
					}
				}
			}
			
			catch(Exception e)
			{
				out.println(e);
				e.printStackTrace();
			}
		%>
		<div class="d-flex justify-content-center">
			<div class="border border-dark col-lg-4" style="border-radius:10px; font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; margin-top:25px; margin-left:20px; margin-right:20px">
				<p style="margin-top:10px; margin-left:10px; font-size:20px"><strong>Problem: </strong>
					<% out.println(title); %>
				</p>
				<p style="margin-top:10px; margin-left:10px; font-size:20px"><strong>Description: </strong>
					<% out.println(desc); %>
				</p>
				
				
				<form action="sp_solution.jsp" method="get">
				<label for="issue" style="margin-top:20px; font-size:20px; margin-left:10px;"><strong>Issue ID: </strong></label>
				<input id="issue" name="issue" type="text" style="" value="<% out.print(ID); %>" readonly>
				<br>
				<label for="solution" style="margin-top:20px; font-size:20px; margin-left:10px;"><strong>Solution: </strong></label>
				<br>
				<textarea style="margin-left:15px; font-size:20px; font-style: 'Courier New', monospace; margin-top:10px; width:600px; height:200px" placeholder="Suggest a solution" required></textarea>
				<button type="submit" class="btn btn-dark" style="margin-top:10px; margin-bottom:30px; width:300px; margin-left:300px;" id="solution" name="solution">Suggest Solution</button>
				</form>
			</div>
		</div>
		
        
    </div>

</body>
</html>