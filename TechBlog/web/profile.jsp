<%-- 
    Document   : profile
    Created on : May 24, 2021, 12:44:34 AM
    Author     : Awanish kumar singh
--%>

<%@page import="com.tech.blog.entities.Category"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.tech.blog.helper.ConnectionProvider"%>
<%@page import="com.tech.blog.dao.PostDao"%>
<%@page import="com.tech.blog.entities.Message"%>
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

                    <li class="nav-item">
                        <a class="nav-link" href="#" data-toggle="modal" data-target="#postmodal"><span class="fa fa-plus"></span> Do Post</a>
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

        <%
            Message m = (Message) session.getAttribute("msg");
            if (m != null) {


        %>


        <div class="alert <%= m.getCssClass()%>"  role="alert">
            <%= m.getMessage()%>
        </div>

        <%
                session.removeAttribute("msg");
            }
        %>



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

                                <form action="Editservlet" method="POST"  enctype="multipart/form-data">

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
                                        <button id="saveupdate" class="btn btn-outline-light primary-background" type="submit">Save</button>
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


        <!--Post modal starts here-->


        <!-- Modal -->
        <div class="modal fade" id="postmodal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class=" container text-center">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h5 class="modal-title" id="exampleModalLabel"><span class ="fa fa-plus-square"></span> <br>  Fill the data carefully</h5>

                    </div>


                    <div class="modal-body">

                        <form action="PostServlet" method="POST" id="postform">


                            <div class="form-group">
                                <select class="form-control" name="cId">
                                    <option disabled selected>--------Select categories--------</option>

                                    <%
                                        PostDao p = new PostDao(ConnectionProvider.getConnection());
                                        ArrayList<Category> a = p.getAllCategories();
                                        for (Category c : a) {


                                    %>
                                    <option value="<%=  c.getcId()%>" class="dropdown-item text-center form-control"><%= c.getName()%></option>
                                    <%
                                        }
                                    %>
                                </select>
                            </div>



                            <div class="form-group">
                                <label for="exampleInputEmail1">Post Title</label>
                                <input type="text" class="form-control" name="pTitle" aria-describedby="emailHelp" placeholder="Enter Title here">
                            </div>

                            <div class="form-group">
                                <label for="exampleInputEmail1">Post Content</label>
                                <textarea  style="height: 200px" class="form-control" name="pContent" placeholder="Enter description of the post..."></textarea>


                            </div>
                            <div class="form-group">
                                <label for="exampleInputEmail1">Post Code</label>
                                <textarea  style="height: 200px" class="form-control" name="pCode" placeholder="Enter code if any regarding your post..."></textarea>

                            </div>


                            <div class="form-group">
                                <label>Select Your Pic</label>
                                <br>
                                <div class="custom-file">
                                    <input type="file" class="form-control" name="pPic"/>
                                </div>
                            </div>


                            <div class="form-check">
                                <input type="checkbox" class="form-check-input" id="exampleCheck1">
                                <label class="form-check-label" for="exampleCheck1">terms and conditions applied</label>
                            </div>
                                
                                <div class="container text-center">
                                <button id="postbutton" type="submit" class="btn btn-primary">Post</button>
                                </div>
                        </form>



                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                        <button type="button" class="btn btn-primary">Save changes</button>
                    </div>
                </div>
            </div>
        </div>



        <!--Post modal ends here-->








        <!--javascripts-->

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

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
                        $('#profile_details').show();
                        $('#profile_edit').hide();
                        editstatus = false;
                        $(this).text('Edit');
                    }
                });

                $('#saveupdate').on('submit', function (event) {

                    swal("You are successfully registered.Redirecting to login page...")
                            .then((value) => {
                                window.location = "Login_Page.jsp";
                            });

                });



            });
        </script>


        <!--post script here...-->

        <script>

            $(document).ready(function () {
                $('#postform').on('submit', function (event) {

                    console.log('submitted..')
                    event.preventDefault();
                    let form = new FormData(this);
                    $.ajax({
                        url: "PostServlet",
                        type: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {

                            if (data.trim() === 'success') {

                                swal("Your post is successfully posted.")
                                        .then((value) => {
                                            window.location = "profile.jsp";
                                        });
                            } else {
                                swal(data);
                            }
                        },
                        error: function (jqXHR, textStatus, errorThrown) {
                            console.log(jqXHR);
                            $('#spinner').hide();
                        },
                        processData: false,
                        contentType: false
                    });

                });
            });


        </script>

    </body>
</html>
