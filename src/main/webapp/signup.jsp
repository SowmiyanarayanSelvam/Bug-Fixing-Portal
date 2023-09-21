<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<html>
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sign Up</title>
  <link rel="stylesheet" href="signup.css">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous">
  </script>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
      <script src="javascript/common.js"></script>
      <script src="javascript/signup.js"></script>
</head>
<body>

    <div class="float-container" style="display:flex">
    <div class="imgcontainer" >
      <img src="images/signup1.png" alt="bgimg" style="height:100%;">
    </div>
  
    <div class="container" style="position: relative; padding-top: 4%;">
        <div class="new">
        <form action="Register" method="post">
          <p>SIGN UP ON <strong>BUG FIXING PORTAL</strong></p>
          <label for="uname">Name</label>
          <input type="text" placeholder="Enter your name" name="name" id="name" required>
          <label for="uname">Username</label>
          <input type="text" placeholder="Enter preffered Username" name="uname" id="uname" required>
          <label for="psw">Password</label>
          <input type="password" placeholder="Enter Password" name="psw" id="psw" onfocus="onFocus()" onblur="onBlur()" onkeyup="onKeyUp()" required>
          <div id="message" style="display:none; background-color: rgb(128,128,128,0.5); padding: 25px;" >
            <h3>Password must contain the following:</h3>
            <p id="letter" class="invalid">A <b>lowercase</b> letter</p>
            <p id="capital" class="invalid">A <b>capital (uppercase)</b> letter</p>
            <p id="number" class="invalid">A <b>number</b></p>
            <p id="length" class="invalid">Minimum <b>8 characters</b></p>
          </div>
          <label for="psw1">Re-enter Password</label>
          <input type="password" placeholder="Enter Password" name="psw1" id="psw1" onfocus="onFocusCPs()" onblur="onBlurCPs()" onkeyup="onKeyUpCPs()" required>
          <div id="message2" style="display:none; background-color: rgb(128,128,128,0.5); padding: 25px;" >
            <p id="match" class="invalid"><b>Passwords must match</b></p>
          </div>
    
  
          <button type="submit" id="regbutton" style="background-color:rgb(59, 59, 184)" disabled>Register</button>

        </div>
    </div>
</form> 
</body>
</html>