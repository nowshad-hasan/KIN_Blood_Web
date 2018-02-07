<%-- 
    Document   : edit_user_info
    Created on : Jan 29, 2018, 3:21:06 PM
    Author     : nowshad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

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


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">

        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
        <script type="text/javascript"  src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
        <script>
            $(function () {
                $("#allDonor").dataTable();
            });
        </script>
    </head>
    <body>
        <% if (session.getAttribute("session") == "validSession") { %>


        <%@ include file = "navbar.jsp" %>

        <div class="color_header">
            <h3 class="color_header_text">EDIT EXISTING USER</h3>
        </div>

        <div class="container">
            <h2>Horizontal form</h2>
            <form class="form-horizontal" action="EditUserInfoServlet" method="post">

                <div class="form-group">
                    <label class="control-label col-sm-2" >User Name:</label>
                    <div class="col-sm-10">
                        <input required type="text" value="<c:out value='${requestScope.userInfo.getUserName()}'/>" class="form-control" id="email" placeholder="Enter email" name="userName">
                    </div>
                </div>


                <div class="form-group">
                    <label class="control-label col-sm-2" for="email">User Email:</label>
                    <div class="col-sm-10">
                        <input required type="email" value="<c:out value='${requestScope.userInfo.getUserEmail()}'/>" class="form-control" id="email" placeholder="Enter email" name="userEmail">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">User Password:</label>
                    <div class="col-sm-10">          
                        <input required type="text" value="<c:out value='${requestScope.userInfo.getUserPass()}'/>" class="form-control" id="pwd" placeholder="Enter password" name="userPass">
                    </div>
                </div>
                    <input type="hidden" name="userID" value="<c:out value='${requestScope.userInfo.getUserId()}'/>">
                <div class="form-group">        
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-default">Submit</button>
                    </div>
                </div>
            </form>
        </div>


        <% } else {%>
        <%

            response.sendRedirect("login.jsp");
        %>
        <% }%>
    </body>
</html>
