<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
  <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="login.css">
    <title>Login</title>
    <script src="javascript/common.js"></script>
    <link rel="stylesheet" href="issue.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous">
    </script>
    <link rel="icon" href="images/logo.png" type="image/icon type" class="logo">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css"/>
</head>
<body>

    <div class="float-container" style="display:flex">
      <div class="imgcontainer">
        <img src="images/login.jpg" alt="bgimg" style="height:120% ; width:120%" >
      </div>
  
      <div class="container">
        <div class="new">
        <form  method="post" action="login">
          <p>LOGIN TO <strong>BUG FIXING PORTAL</strong></p>
          <label for="uname">Username</label>
          <input type="text" placeholder="Enter Username" name="uname" id="uname" required>
  
          <label for="psw">Password</label>
          <input type="password" placeholder="Enter Password" name="psw" id="psw" required>
  			<br>
  			<br>
          <button type="submit" >Login</button>
          
          
          <br>
          <br>
          <a href="signup.jsp" style="color:rgb(57, 57, 107);text-align:center;" ><span > <b>Don't have an account ?</b> </span></a>
        </div>
      </div>
    
</form> 
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
</body>
</html>