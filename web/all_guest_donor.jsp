<%-- 
    Document   : all_guest_donor
    Created on : Feb 3, 2018, 11:01:05 AM
    Author     : nowshad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>ALL GUEST DONOR</title>
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
        <script type="text/javascript" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
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
            <h3 class="color_header_text">ALL GUEST DONOR</h3>
        </div>

        <br>
        <br>

        <c:choose>
            <c:when test="${empty allGuestDonorList}">

                <div class="container">

                    <h4 >No guest donor is added yet!</h4>
                    <br />
                </div>
            </c:when>    
            <c:otherwise>
                <%
                    int i = 0;
                %>
                <div class="col-md-10 col-md-offset-1">
                    <h3 >All Guest Donor List</h3>
                    <table id="allDonor" class="table table-bordered">
                        <caption style="color:white" >Students Table</caption>

                        <br/>
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Donor Name</th>
                                <th scope="col">Blood Group</th>
                                <th scope="col">Department</th>
                                <th scope="col">Session</th>
                                <th scope="col">Phone No1</th>
                                <th scope="col">Phone No2</th>
                                <th scope="col">Address</th>



                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${allGuestDonorList}" var="Donor">
                                <tr class="info">
                                    <th scope="row"><%=++i%></th>

                                    <td><c:out value="${Donor.getDonorName()}" /></td>
                                    <td><c:out value="${Donor.getBloodGroup()}" /></td>
                                    <td><c:out value="${Donor.getDept()}"/> </td>
                                    <td><c:out value="${Donor.getSession()}"/> </td>
                                    <td><c:out value="${Donor.getPhone1()}"/> </td>
                                    <td><c:out value="${Donor.getPhone2()}" /></td>
                                    <td> <c:out value="${Donor.getAddress()}" /></td>



                                </tr>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </c:otherwise>
        </c:choose>


        <% } else {%>
        <%

            response.sendRedirect("login.jsp");
        %>
        <% }%>
    </body>
</html>
