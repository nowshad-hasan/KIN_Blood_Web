<%-- 
    Document   : login.jsp
    Created on : Dec 24, 2016, 7:10:45 AM
    Author     : nowshad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login User</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <link rel="stylesheet" href="FrontEnd/bootstrap-3.3.7-dist/bootstrap-theme.min.css" />
        <link rel="stylesheet" href="FrontEnd/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css.map">
        <link rel="stylesheet" href="FrontEnd/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>

        <script src="FrontEnd/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>

        <script src="FrontEnd/javascript/script.js"></script>
    </head>
    <body>
        <div class="container">



            <div id="loginbox" style="margin-top:50px;" class="mainbox col-md-6 col-md-offset-3 col-sm-8 col-sm-offset-2">
                <div class="panel panel-info" >
                    <div class="panel-heading">
                        <div class="panel-title">Sign In</div>
<!--                        <div style="float:right; font-size: 80%; position: relative; top:-10px"><a href="#">Forgot password?</a></div>-->
                    </div>

                    <div style="padding-top:30px" class="panel-body" >

                        <div style="display:none" id="login-alert" class="alert alert-danger col-sm-12"></div>

                        <form name="loginForm" id="loginform" class="form-horizontal" role="form" action="LoginServlet" method="post">

                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-user"></i></span>
                                <input id="login-username" type="text" class="form-control" name="email" placeholder="username or email" required>
                            </div>

                            <div style="margin-bottom: 25px" class="input-group">
                                <span class="input-group-addon"><i class="glyphicon glyphicon-lock"></i></span>
                                <input id="login-password" type="password" class="form-control" name="password" placeholder="password" required>
                            </div>



                            <div class="input-group">
                                <div class="checkbox">
                                    <label>
                                        <input id="login-remember" type="checkbox" name="remember" value="1"> Remember me
                                    </label>
                                </div>
                            </div>





                            <div style="margin-top:10px">


                                <input onclick="ValidateEmail(document.loginForm.email)" type="submit" name="submit-btn" href="#" class="btn btn-success" id="btn-login" value="Login">
                            </div>

                            <div class="form-group">
                                <div class="col-md-12 control">
                                    <div style="border-top: 2px solid#888;margin-top:10px; padding-top:15px; font-size:85%;text-align: center " >
                                        Back to 
                                        <a href="${pageContext.request.contextPath}/Home.jsp">
                                            HOME!
                                            
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </form>





                    </div>
                </div>
            </div>

        </div>
    </body>
</html>


