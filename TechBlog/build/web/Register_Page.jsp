<%-- 
    Document   : Register_Page
    Created on : May 23, 2021, 9:11:12 AM
    Author     : Awanish kumar singh
--%>

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
        <!--Navbar-->
        <%@include file="normal_navbar.jsp" %>

        <!--Main contact-->

        <main class="primary-background p-5 banner-background ">

            <div class="container">
                <div class="col-md-6 offset-md-3">

                    <div class="card">

                        <div class="card-header  primary-background text-center text-white">
                            <span class="fa fa-user-circle fa-3x"></span>
                            <p>Register Here</p>
                        </div>

                        <div class="card-body">

                            <form id="reg-form" action="RegisterServlet" method="POST">

                                <div class="form-group">
                                    <label for="user_name">User Name</label>
                                    <input name="user_name" type="text" class="form-control" id="user_name" aria-describedby="user" placeholder="Enter Name">
                                </div>

                                <div class="form-group">
                                    <label for="exampleInputEmail1">Email address</label>
                                    <input name="user_email" type="email" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Enter email">
                                    <small id="emailHelp" class="form-text text-muted">We'll never share your email with anyone else.</small>
                                </div>


                                <div class="form-group">
                                    <label for="exampleInputPassword1">Password</label>
                                    <input name="user_password" type="password" class="form-control" id="exampleInputPassword1" placeholder="Password">
                                </div>


                                <div class="form-group">
                                    <label for="gender">Select Gender</label>
                                    <br>
                                    <input type="radio" value="Male" id="gender" name="gender">Male
                                    <input type="radio" value="Female" id="gender" name="gender">Female
                                </div>

                                <div>

                                    <textarea name="about" class="form-control" id="about" rows="5" placeholder="Enter something about Yourself"></textarea>


                                </div>


                                <div class="form-check">
                                    <input name="user_check" type="checkbox" class="form-check-input" id="exampleCheck1">
                                    <label  class="form-check-label" for="exampleCheck1">Accept terms and conditions</label>
                                </div>

                                <br>
                                <div class="container text-center " id="spinner">
                                    <span class="fa fa-refresh fa-3x fa-spin"></span>
                                    <h3>Please wait..</h3>
                                </div>
                                <button type="submit" class="btn btn-primary">Submit</button>
                            </form>
                        </div>
                    </div>

                </div>
            </div>


        </main>



        <!--javascripts-->

        <script src="https://code.jquery.com/jquery-3.6.0.min.js" integrity="sha256-/xUj+3OJU5yExlq6GSYGSHk7tPXikynS7ogEvDej/m4=" crossorigin="anonymous"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>

        <script src="js/myjs.js" type="text/javascript"></script>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>

            $(document).ready(function () {
                $('#spinner').hide();
                console.log('loaded..');
                $('#reg-form').on('submit', function (event) {
                    $('#spinner').show();
                    event.preventDefault();
                    let form = new FormData(this);

                    $.ajax({
                        url: "RegisterServlet",
                        type: "POST",
                        data: form,
                        success: function (data, textStatus, jqXHR) {
                            console.log(data);
                            $('#spinner').hide();
                            if (data.trim() === 'success') {

                                swal("You are successfully registered.Redirecting to login page...")
                                        .then((value) => {
                                    window.location = "Login_Page.jsp";
                                });
                            }else {
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

                })


            });


        </script>
    </body>
</html>
