<%-- 
    Document   : profile
    Created on : May 24, 2021, 12:44:34 AM
    Author     : Awanish kumar singh
--%>

<%@page import="com.tech.blog.entities.User"%>
<%
    User user = (User) session.getAttribute("currentuser");
    if (user == null) {
        response.sendRedirect("Login_Page.jsp");
    }
%>


<%@page errorPage="error_page.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

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
        <!--Navbar here-->

        <nav class="navbar navbar-expand-lg navbar-dark primary-background">
            <a class="navbar-brand" href="index.jsp"><span class="fa fa-asterisk"></span>TechBlog</a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>

            <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav mr-auto">
                    <li class="nav-item active">
                        <a class="nav-link" href="#"><span class="fa fa-bell-o"></span>Code with Awanish <span class="sr-only">(current)</span></a>
                    </li>

                    <li class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <span class="fa fa-binoculars"></span>Categories
                        </a>
                        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
                            <a class="dropdown-item" href="#">Python</a>
                            <a class="dropdown-item" href="#">C language</a>
                            <a class="dropdown-item" href="#">Core Java</a>
                            <a class="dropdown-item" href="#">Android</a>
                            <div class="dropdown-divider"></div>
                            <a class="dropdown-item" href="#">Interviews experience</a>
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#"><span class="fa fa-address-book"></span> Contact</a>
                    </li>

                </ul>

                <ul class="navbar-nav mr-right">

                    <li class="nav-item">
                        <a class="nav-link"  data-toggle="modal" data-target="#Profile_modal" href="#!"><span class="fa fa-user-circle"></span><%= user.getName()%></a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="LogoutServlet"><span class="fa fa-user-plus"></span>Logout</a>
                    </li>
                </ul>

            </div>
        </nav>

        <!--end of  navbar-->



        <!--profie modal starts-->


        <!-- Modal -->
        <div class="modal fade" id="Profile_modal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header primary-background text-center text-white">
                        <h5 class="modal-title" id="exampleModalLabel">Welcome to Coder Brains Technical Blog</h5>
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                    </div>
                    <div class="modal-body">

                        <div class="container text-center">

                            <img class="img-fluid" src="pics/<%= user.getProfile()%>" style=" border-radius: 50%;  width:30%; height:auto"/>
                            <h3><%= user.getName()%></h3>

                            <div id="profile_details" class="container">
                                <table class="table">
                                    <thead>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <!--<th scope="row">1</th>-->
                                            <td>S_Id</td>
                                            <td><%= user.getId()%></td>
                                        </tr>

                                        <tr>
                                            <!--<th scope="row">1</th>-->
                                            <td>Email</td>
                                            <td><%= user.getEmail()%></td>
                                        </tr>

                                        <tr>
                                            <!--<th scope="row">1</th>-->
                                            <td>Password</td>
                                            <td><%= user.getPassword()%></td>
                                        </tr>

                                        <tr>
                                            <!--<th scope="row">1</th>-->
                                            <td>Gender</td>
                                            <td><%= user.getGender()%></td>
                                        </tr>

                                        <tr>
                                            <!--<th scope="row">1</th>-->
                                            <td>About</td>
                                            <td><%= user.getAbout()%></td>
                                        </tr>

                                        <tr>
                                            <!--<th scope="row">1</th>-->
                                            <td>Registration Date</td>
                                            <td><%= user.getDatetime().toString()%></td>
                                        </tr>
                                    </tbody>
                                </table>


                            </div>

                            <div id="profile_edit" style="display: none">

                                <form action="Editservlet" method="POST">

                                    <table class="table">

                                        <tr>
                                            <td>ID</td>
                                            <td><%= user.getId()%></td>
                                        </tr>

                                        <tr>
                                            <td>Name</td>
                                            <td><input type="text" name="user_name" class="form-control" value="<%= user.getName()%>"/></td>
                                        </tr>


                                        <tr>
                                            <td>Email</td>
                                            <td><input type="email" name="user_email" class="form-control" value="<%= user.getEmail()%>"/></td>
                                        </tr> 

                                        <tr>
                                            <td>Password</td>
                                            <td><input type="text" name="user_password" class="form-control" value="<%= user.getPassword()%>"/></td>
                                        </tr>


                                        <tr>
                                            <td>About</td>
                                            <td>
                                                <textarea rows="3" class="form-control" name="user_about" ><%= user.getAbout()%></textarea>
                                        </td>
                                    </tr>
                                    
                                    <tr>
                                            <td>New Pic :</td>
                                            <td>
                                                <input class="form-control" type="file" name="profile_pic"/>
                                        </td>
                                    </tr>

                                </table>

                                <div class="container text-center text-white">
                                    <button class="btn btn-outline-light primary-background" type="submit">Save</button>
                                </div>


                            </form>

                        </div>

                    </div>


                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button id="edit-details" type="button" class="btn btn-primary">Edit</button>
                </div>
            </div>
        </div>
    </div>


    <!--profile modal ends-->

    <!--javascripts-->

    <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

    <script src="js/myjs.js" type="text/javascript"></script>

    <script>

        $('ducument').ready(function () {
            let editstatus = false;

            $('#edit-details').click(function () {
                if (editstatus == false) {
                    $('#profile_details').hide();
                    $('#profile_edit').show();
                    editstatus = true;
                    $(this).text('Back');
                } else {
                    console.log('hello');
                    $('#profile_details').show();
                    $('#profile_edit').hide();
                    editstatus = false;
                    $(this).text('Edit');
                }
//                    
//                    
            });


        });
    </script>

</body>
</html>
