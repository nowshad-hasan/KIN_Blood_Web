<%-- 
    Document   : add_donor_excel
    Created on : Dec 31, 2017, 10:34:52 AM
    Author     : nowshad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Donor Excel</title>
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
    </head>
    <body>
        <% if (session.getAttribute("session") == "validSession") { %>


        <%@ include file = "navbar.jsp" %>

        <div class="color_header">
            <h3 class="color_header_text">New Donor From Excel</h3>
        </div>

        <br>
        <br>

        <div class="container">

            <form action="AddNewDonorExcelServlet" method="post" enctype="multipart/form-data">

                <input type="file" name="file"  accept=".xlsx" required />
                <br>
                <button type="submit" class="btn btn-primary">Submit</button>
            </form>

        </div>


        <% } else {%>
        <%

            response.sendRedirect("login.jsp");
        %>
        <% }%>
    </body>
</html>
