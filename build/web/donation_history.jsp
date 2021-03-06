<%-- 
    Document   : donation_history
    Created on : Jan 28, 2018, 3:00:46 PM
    Author     : nowshad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Donation History</title>
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
        <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
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
            <h3 class="color_header_text">DONATION HISTORY</h3>
        </div>


        <br>
        <br>
        <div class="container">
            <form action="DonationHistoryServlet" method="post">
                <select required  name="bloodGroup"  data-width="50%" class="selectpicker show-tick" title="Choose one of the following...">
                    <option>A+</option>
                    <option>A-</option>
                    <option>B+</option>
                    <option>B-</option>
                    <option>AB+</option>
                    <option>AB-</option>
                    <option>O+</option>
                    <option>O-</option>
                    <option>ALL</option>
                </select>
                <br>
                <br>

                <div style="text-align:left">
                    <button type="submit" class="btn btn-success btn-lg">Submit</button>
                </div>
            </form>
        </div>


        <c:choose>
            <c:when test="${empty donationHistory}">

                <div class="container">

                    <h4 >Nothing to show. Please select blood group for donor info.</h4>
                    <br />
                </div>
            </c:when>    
            <c:otherwise>
                <%
                    int i = 0;
                %>
                <div class="col-md-10 col-md-offset-1">
                    <h3 >All Donation History</h3>
                    <table id="allDonor" class="table table-bordered">
                        <caption style="color:black" >Donation History Table</caption>

                        <br/>
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Donor Name</th>
                                <th scope="col">Blood Group</th>
                                <th scope="col">Department</th>
                                <th scope="col">Session</th>
                                <th scope="col">Donation Date</th>
                                <th scope="col">Donation Place</th>
                                <th scope="col">Actions</th>


                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach items="${donationHistory}" var="Donor">
                                <tr class="info">
                                    <th scope="row"><%=++i%></th>

                                    <td> <a href="http://localhost:8080/KIN_Blood/DonorPersonalInfoServlet?donorID=<c:out value="${Donor.getDonorID()}" />" target="_blank" ><c:out value="${Donor.getDonorName()}" /></a></td>
                                    <td><c:out value="${Donor.getBloodGroup()}" /></td>
                                    <td><c:out value="${Donor.getDept()}"/> </td>
                                    <td><c:out value="${Donor.getSession()}"/> </td>
                                    <td><c:out value="${Donor.getDonationDate()}"/> </td>
                                    <td><c:out value="${Donor.getDonationPlace()}" /></td>


                                    <td>
                                        <div class="row">



                                            <a href="${pageContext.request.contextPath}/ShowDonationInfoEdit?donationID=<c:out value="${Donor.getDonationID()}" />" class="btn btn-primary btn-sm">
                                                <span class="glyphicon glyphicon-pencil"></span> Edit
                                            </a>

                                            <a onclick="return confirm('Are you sure you want to delete?')" href="${pageContext.request.contextPath}/DeleteDonationServlet?donationID=<c:out value="${Donor.getDonationID()}" />" class="btn btn-danger btn-sm">
                                                <span class="glyphicon glyphicon-trash"></span> Delete
                                            </a>


                                        </div>
                                    </td>

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
