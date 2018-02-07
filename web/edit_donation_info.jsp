<%-- 
    Document   : edit_donation_info
    Created on : Jan 29, 2018, 9:42:42 AM
    Author     : nowshad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
        <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
    </head>
    <body>
        <% if (session.getAttribute("session") == "validSession") { %>

        <%@ include file = "navbar.jsp" %>

        <div class="color_header">
            <h3 class="color_header_text">DONATION INFORMATION EDIT</h3>
        </div>


        <div class="container">
            <h2>Edit Donation</h2>
            <form class="form-horizontal" action="EditDonationInfoServlet" method="post">
                <div class="form-group">
                    <label class="control-label col-sm-2" for="email">Donation Date:</label>
                    <div class="col-sm-10">
                        <input value="<c:out value='${requestScope.donationInfo.getDonationDate()}'/>" type="date" class="form-control" id="email" placeholder="Enter email" name="donationDate">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Donation Place:</label>
                    <div class="col-sm-10">          
                        <input value="<c:out value='${requestScope.donationInfo.getDonationPlace()}'/>" type="text"  class="form-control" id="pwd" placeholder="Enter password" name="donationPlace">
                    </div>
                </div>
                    
                        <input type="hidden" name="donationID" value="<c:out value='${requestScope.donationInfo.getDonationID()}'/>">

                <div class="form-group">        
                    <div class="col-sm-offset-2 col-sm-10">
                        <button type="submit" class="btn btn-primary">Submit</button>
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
