<%-- 
    Document   : index
    Created on : May 22, 2021, 2:40:13 PM
    Author     : Awanish kumar singh
--%>

<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Coder Brains | Tech Blog</title>

        <!--css-->
        
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <link href="css/mycss.css" rel="stylesheet" type="text/css"/>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
        <style>
            .banner-background{
                clip-path: polygon(50% 0%, 100% 0, 100% 100%, 84% 96%, 68% 100%, 48% 97%, 29% 100%, 14% 96%, 0 100%, 0 0);
            }
        </style>
    </head>
    <body>

         <!--Navbar-->
        <%@include file="normal_navbar.jsp" %>
      

        <!--Banner-->

        <div class="container-fluid p-0 m-0 ">

            <div class="jumbotron primary-background text-white banner-background">
                <div class="container">
                    <h3 class="display-3">Welcome to Coder Brains Tech Blog</h3>
                    <p>A programming language is a formal language comprising a set of strings that produce various kinds of machine code output. Programming languages are used in computer programming to implement algorithms.</p>

                    <p>Most programming languages consist of instructions for computers. There are programmable machines that use a set of specific instructions, rather than general programming languages.</p>
                    <a class="btn btn-outline-light" href="https://www.youtube.com/channel/UC4CwQWuy47lTFP8-RhtF8lw/playlists" target="_blank" ><span class="fa fa-external-link"></span>Start ! Its Free </a>
                    <a type="button" href="Login_Page.jsp" class="btn btn-outline-light"><span class="fa fa-user-circle fa-spin"></span> Login</a>
                </div>
            </div>
        </div>

        <!--Cards in the middle-->

        <div class="container mb-2">
            <div class="row">
                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Java Programming(CORE)</h5>
                            <p class="card-text">If you want to explore and learn coding skills in Java, then Coder Brains provides you the best platform to learn the Java language. ...</p>
                            <a target="_blank" href="https://www.youtube.com/watch?v=DNCEmf7GGLY&list=PLmNKox-3190A_pfW02fA_0tbVp4wJ3sBJ" class="btn btn-primary text-white">Learn here</a>
                        </div>
                    </div>

                </div>
                  <div class="col-md-4">

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Python Programming</h5>
                            <p class="card-text">If you want to explore and learn coding skills in Python, then Coder Brains provides you the best platform to learn the Python language. ...</p>
                            <a  target="_blank" href="https://www.youtube.com/watch?v=AQ1eVnsPrYM&list=PLmNKox-3190D6tITs2CYCIK7YfoMx4zxe" class="btn btn-primary text-white">Learn Here</a>
                        </div>
                    </div>

                </div>
                
                  <div class="col-md-4">

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">C Language</h5>
                            <p class="card-text">If you want to explore and learn coding skills in C , then Coder Brains provides you the best platform to learn the C language. ...</p>
                            <a href="https://www.youtube.com/watch?v=-uttTrBolgA&list=PLmNKox-3190AFbPp-fAiM62S8XKVUqi5f" target="_blank" class="btn btn-primary text-white">Learn Here</a>
                        </div>
                    </div>

                </div>


            </div>


        </div>
        
          <div class="container">
            <div class="row">
                <div class="col-md-4">

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">C++ Language</h5>
                            <p class="card-text">If you want to explore and learn coding skills in C++, then Coder Brains provides you the best platform to learn the C++ language. ...</p>
                            <a href="https://www.youtube.com/watch?v=Ss6Zer6kaE0&t=3s" target="_blank" class="btn btn-primary text-white">Learn Here</a>
                        </div>
                    </div>

                </div>
                  <div class="col-md-4">

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">R Programming</h5>
                            <p class="card-text">If you want to explore and learn coding skills in R, then Coder Brains provides you the best platform to learn the R language. ...</p>
                            <a target="_blank" href="https://www.youtube.com/watch?v=_sTftAAS5Q0" class="btn btn-primary text-white">Learn Here</a>
                        </div>
                    </div>

                </div>
                
                  <div class="col-md-4">

                    <div class="card">
                        <div class="card-body">
                            <h5 class="card-title">Kotlin Language</h5>
                            <p class="card-text">If you want to explore and learn coding skills in Kotlin, then Coder Brains provides you the best platform to learn the Kotlin language. ...</p>
                            <a target="_blank" href="https://www.youtube.com/watch?v=XWXnwf6h3lY" class="btn btn-primary text-white">Learn Here</a>
                        </div>
                    </div>

                </div>


            </div>


        </div>
        
        <div class="primary-background text-center mt-4">
            
            <div class="row container">
                
                <div class="col-md-8">
                    
                    <div class="card-body text-white">
                        <h3 class="display-5 ">Something about channel</h3>
                        <p>Coder brains is a nice channel for studying anything 
                                .It has all the study materials needed for study.This is a great initiative by Awanish sir.</p>
                    </div>
                    
                </div>
                
                <div class="col-md-4">
                     <h3 class="display-5">Some Quick links</h3>
                     <div class="text-white">
                         <a class="btn btn-outline-light" href="#" target="_blank"><span class="fa fa-user-circle">Go to github</span></a>
                         <a class="btn btn-outline-light" href="#" target="_blank"><span class="fa fa-home">Go to facebook</span></a>
                         <a class="btn btn-outline-light" href="#" target="_blank"><span class="fa fa-asterisk">Go to Linkedin</span></a>
                         
                     </div>
                     
                </div>
                
                
            </div>
            
            
        </div>

        <!--javascripts-->

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script src="js/myjs.js" type="text/javascript"></script>

    </body>
</html>
