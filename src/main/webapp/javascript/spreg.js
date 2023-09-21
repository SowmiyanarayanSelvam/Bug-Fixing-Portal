function onFocus () {
    document.getElementById("message").style.display = "block";
  }

  // When the user clicks outside of the password field, hide the message box
  function onBlur() {
    document.getElementById("message").style.display = "none";
  }

  function onFocusCPs() {
    document.getElementById("message2").style.display = "block";
  }

  // When the user clicks outside of the password field, hide the message box
  function onBlurCPs() {
    document.getElementById("message2").style.display = "none";
  }

  var ctr = 0;
  // When the user starts to type something inside the password field
  function onKeyUp() {
    // Validate lowercase letters
    var lowerCaseLetters = /[a-z]/g;
    var myInput = document.getElementById("psw");
    var letter = document.getElementById("letter");
    var capital = document.getElementById("capital");
    var number = document.getElementById("number");
    var length = document.getElementById("length");
    var button = document.getElementById("regbtn");

    if(myInput.value.match(lowerCaseLetters)) {
      letter.classList.remove("invalid");
      letter.classList.add("valid");
      ctr += 1;
    } else {
      letter.classList.remove("valid");
      letter.classList.add("invalid");
      ctr -= 1;
  }

    // Validate capital letters
    var upperCaseLetters = /[A-Z]/g;
    if(myInput.value.match(upperCaseLetters)) {
      capital.classList.remove("invalid");
      capital.classList.add("valid");
      ctr += 1;
    } else {
      capital.classList.remove("valid");
      capital.classList.add("invalid");
      ctr -= 1;
    }

    // Validate numbers
    var numbers = /[0-9]/g;
    if(myInput.value.match(numbers)) {
      number.classList.remove("invalid");
      number.classList.add("valid");
      ctr += 1;
    } else {
      number.classList.remove("valid");
      number.classList.add("invalid");
      ctr -= 1;
    }

    // Validate length
    if(myInput.value.length >= 8) {
      length.classList.remove("invalid");
      length.classList.add("valid");
      ctr += 1;
    } else {
      length.classList.remove("valid");
      length.classList.add("invalid");
      ctr -= 1;
    }

    if (ctr == 5 || myInput.length==0) {
        button.disabled = false;
    }

    else
        button.disabled = true;
  }

  function onKeyUpCPs() {
    console.log(ctr);
    var ctr=0;
    var psw = document.getElementById("psw");
    var cpsw = document.getElementById("psw1");
    var match = document.getElementById("match");
    var button= document.getElementById("regbtn");
    if(psw.value == cpsw.value) {
      match.classList.remove("invalid");
      match.classList.add("valid");
      ctr += 1;
    }

    else {
      match.classList.remove("valid");
      match.classList.add("invalid");
      ctr -= 1;
    }

    if (ctr == 1 || (psw.length==0 && cpsw.length==0) ) {
      button.disabled = false;
  }

  else
      button.disabled = true;
  }
