<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Service Provider</title>
    <link rel="icon" href="images/logo.png" type="image/icon type" class="logo">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="sp_page.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous">
    </script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <script src="javascript/common.js"></script>
        <script src="javascript/spreg.js"></script>
</head>

<body>
    <div class="outer" >
        <div class="header1 row" style="margin:0px 0px 0px 0px">
            <nav class="navbar navbar-dark bg-black navbar-brand">
                <div class="logo col-md-2 ">
                    
                    <div class="dropdown">
                        <img class="img1" src="images/logo.png" alt="logo">
                        
                      </div>
                </div>
                <div class="slogan col-md-6 justify-content-center">
                    <h1
                        style="margin-top:45px;color: aliceblue; font-family:'Segoe UI', Tahoma, Geneva, Verdana, sans-serif">
                        Don't let
                        the tech bugs bite.</h1>

                </div>
                <div class="icon col-md-2 ">
                    <a href="dashboard.jsp"> <img class="img2" src="images/profile.png" alt="profile"></a>

                </div>

            </nav>

        </div>
        <div style="text-align:center">
        <%
        session = request.getSession();
        if(session.getAttribute("msg")!=null){
        if(((String)session.getAttribute("msg")).equals("1"))
        	out.println("Upgraded to Service Provider!");
        	
        else if(((String)session.getAttribute("msg")).equals("0"))
        	out.println("You need to level up to avail these services!");
        
        session.removeAttribute("msg");}
        
        %>
        </div>
        <div class="content">
            <img src="images/unlock-clipart.png" style="width:25%;height:25%;float:right;margin-right: 13%;margin-top: 7%;">
        <div class="container1 " style="position: relative; padding-top: 4%;">
        <br>
        
        <br>
        <form action="SPRegistration" method="post">    
            <div class="new col-offset-2 col-md-9">
            <h4>Upgrade to Service provider</h4>
            <label for="email">Email-ID</label><br>
          <input type="email" placeholder="Enter your Email-ID" name="email" id="email" style="width:100%; height:50px" required>
          <br>
          <label for="uname">Username</label>
          <input type="text" placeholder="Enter Username" name="uname" id="uname" required>
          <label for="psw">Password</label>
          <input type="password" placeholder="Enter Password" name="psw" id="psw" onfocus="onFocus()" onblur="onBlur()" onkeyup="onKeyUp()" required>
          
          <div id="message" style="display:none; background-color: rgb(128,128,128,0.5); padding: 25px;" >
            <h3>Password must contain the following:</h3>
            <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
            <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
            <p id="number" class="invalid">A <b>number</b></p>
            <p id="length" class="invalid">Minimum <b>8 characters</b></p>
          </div>
          <label for="psw">Re-enter Password</label>
          <input type="password" placeholder="Re-Enter Password" name="psw1" id="psw1" onfocus="onFocusCPs()" onblur="onBlurCPs()" onkeyup="onKeyUpCPs()" required>
        
          <div id="message2" style="display:none; background-color: rgb(128,128,128,0.5); padding: 25px;" >
            <p id="match" class="invalid"><b>Passwords must match</b></p>
          </div>
    	
        
          <a href="sp_page.jsp"> <button type="submit" style="background-color:rgb(59, 59, 184)" name="regbtn">Send Request</button> </a>
      </form>
          <!-- <button type="submit" style="background-color:rgb(59, 59, 184)">Send Request</button> -->
          
        </div>
    </div>
        
    
    </div>
</div>
</body>

</html>