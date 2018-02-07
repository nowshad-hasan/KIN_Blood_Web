<%-- 
    Document   : additional_info
    Created on : Feb 1, 2018, 11:31:58 PM
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
        <% if (session.getAttribute("session") == "validSession") { %>


        <%@ include file = "navbar.jsp" %>

        <div class="color_header">
            <h3 class="color_header_text">Additional Information</h3>
        </div>
        <br>
        <br>

        <div class="container">


            <c:choose>
                <c:when test="${addNewDonation=='successful'}">


                    <div class="alert alert-success">
                        <strong>Info!</strong> New Donation is updated successfully!
                    </div>

                </c:when>
                <c:when test="${addNewDonation=='unsuccessful'}">
                    <div class="alert alert-danger">
                        <strong>Info!</strong> Something went wrong! New Donation is not updated!
                    </div>
                </c:when>
            </c:choose>

            <c:choose>
                <c:when test="${editDonation=='successful'}">


                    <div class="alert alert-success">
                        <strong>Info!</strong> Donation is edited successfully!
                    </div>

                </c:when>

                <c:when test="${editDonation=='unsuccessful'}">
                    <div class="alert alert-danger">
                        <strong>Info!</strong> Something went wrong! Existing Donation is not edited!
                    </div>
                </c:when>
            </c:choose>

            <c:choose>
                <c:when test="${deleteDonation=='successful'}">


                    <div class="alert alert-success">
                        <strong>Info!</strong> Donation is deleted successfully!
                    </div>

                </c:when>

                <c:when test="${deleteDonation=='unsuccessful'}">
                    <div class="alert alert-danger">
                        <strong>Info!</strong> Something went wrong! Existing Donation is not deleted!
                    </div>
                </c:when>
            </c:choose>

            <c:choose>
                <c:when test="${addNewUser=='successful'}">


                    <div class="alert alert-success">
                        <strong>Info!</strong> New User is added successfully!
                    </div>

                </c:when>

                <c:when test="${addNewUser=='unsuccessful'}">
                    <div class="alert alert-danger">
                        <strong>Info!</strong> Something went wrong! New user is not added!
                    </div>
                </c:when>
            </c:choose>

            <c:choose>
                <c:when test="${editNewUser=='successful'}">


                    <div class="alert alert-success">
                        <strong>Info!</strong> User is edited successfully!
                    </div>

                </c:when>

                <c:when test="${editNewUser=='unsuccessful'}">
                    <div class="alert alert-danger">
                        <strong>Info!</strong> Something went wrong! Existing User is not edited!
                    </div>
                </c:when>
            </c:choose>

            <c:choose>
                <c:when test="${deleteUser=='successful'}">


                    <div class="alert alert-success">
                        <strong>Info!</strong> User is deleted successfully!
                    </div>

                </c:when>

                <c:when test="${deleteUser=='unsuccessful'}">
                    <div class="alert alert-danger">
                        <strong>Info!</strong> Something went wrong! Existing User is not deleted!
                    </div>
                </c:when>
            </c:choose>

            <c:choose>
                <c:when test="${editDonorInfo=='successful'}">


                    <div class="alert alert-success">
                        <strong>Info!</strong> Donor is edited successfully!
                    </div>

                </c:when>

                <c:when test="${editDonorInfo=='unsuccessful'}">
                    <div class="alert alert-danger">
                        <strong>Info!</strong> Something went wrong! Existing Donor is not edited!
                    </div>
                </c:when>
            </c:choose>

            <c:choose>
                <c:when test="${deleteDonor=='successful'}">


                    <div class="alert alert-success">
                        <strong>Info!</strong> Donor is deleted successfully!
                    </div>

                </c:when>

                <c:when test="${deleteDonor=='unsuccessful'}">
                    <div class="alert alert-danger">
                        <strong>Info!</strong> Something went wrong! Donor is not deleted!
                    </div>
                </c:when>
            </c:choose>






            <div class="col-sm-offset-5 col-sm-2 text-center"> 
                <a style="text-align: center" href="${pageContext.request.contextPath}/admin_home.jsp" class="btn btn-info btn-lg" role="button">Back to HOME</a>
            </div>
        </div>






        <% } else {%>
        <%

            response.sendRedirect("login.jsp");
        %>
        <% }%>
    </body>
</html>
