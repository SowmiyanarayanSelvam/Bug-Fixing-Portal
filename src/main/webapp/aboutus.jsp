<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
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
    <title>About Us</title>
    <link rel="stylesheet" href="sp_page.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous">
    </script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
    <link rel="stylesheet" href="aboutus.css">
    <script src="javascript/common.js"></script>
    <script src="javascript/aboutus.js"></script>


</head>

<body>
    <div class="outer">
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
                    <a href="dashboard.jsp"> <img class="img2" src="images/profile.png" alt="profile"></a>

                </div>

            </nav>
        </div>

        <div class="container">
            <div class="row">
                <div class="col-md-7">
                    <img src='images/aboutus_image.jpg' class="aboutusimg">
                </div>

                <div class="col-md-5" style="margin-top:60px">
                    <button type="button" class="collapsible">Who are we?</button>
                    <div class="content">
                        <p>Bug fixing portal(BFP) is an application portal that empowers beginners, students, junior
                            developers, senior developers and many more with the means to remove any impedes in
                            their
                            programming career.</p>

                        <p>We house a myriad of problems solved from a variety of problem domains where programmers
                            tend to
                            get stuck. We relieve them of these difficulties ensuring SaaS as the top most priority.
                        </p>
                    </div>

                    <button type="button" class="collapsible">Why BFP?</button>
                    <div class="content">
                        <p>Bug fixing portal(BFP) is an application portal developed by college students who have gone
                            through similar scenarios and have strived hard to find the optimal solution which could
                            now be passed on to others using this platform.</p>
                    </div>
                </div>
            </div>

            <script rel="stylesheet" type="text/javascript">
                var coll = document.getElementsByClassName("collapsible");
                var i;

                for (i = 0; i < coll.length; i++) {
                    coll[i].addEventListener("click", function () {
                        this.classList.toggle("active");
                        var content = this.nextElementSibling;
                        if (content.style.display === "block") {
                            content.style.display = "none";
                        } else {
                            content.style.display = "block";
                        }
                    });
                }
            </script>

        </div>
    </div>
    </div>
</body>
<br>
<br>
<br>
<!-- <div style="border:solid;color:white" class="footer bg-black"> -->
<footer class="footer1">
    <p>
        <li onmouseenter="optionHover(this)" onmouseleave="optionHoverOff(this)" class="options">Contact Us</li>
        <li onmouseenter="optionHover(this)" onmouseleave="optionHoverOff(this)" class="options">Willing to work with us
        </li>
        <li onmouseenter="optionHover(this)" onmouseleave="optionHoverOff(this)" class="options">FAQ's</li>
    </p>
</footer>
<!-- </div> -->

</html>