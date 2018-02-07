<%-- 
    Document   : additional_info_guest
    Created on : Feb 3, 2018, 10:46:31 AM
    Author     : nowshad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Additional Information</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="FrontEnd/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" />
        <link rel="stylesheet" href="FrontEnd/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css.map">
        <link rel="stylesheet" href="FrontEnd/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/style.css"/>

        <link rel="stylesheet" href="FrontEnd/css/footer-distributed-with-contact-form.css">

        <script type="text/javascript" src="FrontEnd/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    </head>
    <body>
        <nav class="navbar navbar-inverse navbar-fixed-top" >
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/Home.jsp">KIN BLOOD</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">

                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="${pageContext.request.contextPath}/login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>


                    </ul>
                </div>
            </div>
        </nav>

        <div class="color_header">
            <h3 class="color_header_text">ADDITIONAL INFO</h3>
        </div>
                        <br>
                        <br>

        <div class="container">

            <c:choose>
                <c:when test="${addNewGuest=='successful'}">


                    <div class="alert alert-success">
                        <strong>Success!</strong> Your information is taken into our database. You'll be informed when your blood is needed.
                        <br>
                        Thank you for being with us.
                    </div>

                </c:when>
                <c:when test="${addNewGuest=='unsuccessful'}">
                    <div class="alert alert-danger">
                        <strong>Info!</strong> Something went wrong! Your information is not added!
                    </div>
                </c:when>
            </c:choose>

        </div>
        <br>
    </body>
</html>
