<%-- 
    Document   : donor_info
    Created on : Jan 28, 2018, 8:55:23 PM
    Author     : nowshad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Donor Information</title>
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
        <% if (session.getAttribute("session") == "validSession") {%>


        <%@ include file = "navbar.jsp" %>

        <div class="color_header">
            <h3 class="color_header_text">DONOR INFORMATION</h3>
        </div>

        <div class="container">
            <ul class="nav nav-tabs nav-justified">
                <li class="active"><a data-toggle="tab" href="#home">Donor Information</a></li>
                <li><a data-toggle="tab" href="#menu1">Donation History</a></li>

            </ul>


            <div class="tab-content">
                <div id="home" class="tab-pane fade in active">
                    <h3>PERSONAL INFORMATION</h3>


                    <c:choose>
                        <c:when test="${empty donorInfo}">


                            <p style="color:black">Nothing to show. Please select blood group for donor info</p>
                            <br />
                        </c:when>    
                        <c:otherwise>

                            <div class="col-md-10 col-md-offset-1">


                                <ul class="list-group">
                                    <li class="list-group-item "><strong>Donor Name:</strong>     <c:out value='${requestScope.donorInfo.getDonorName()}'/></li>
                                    <li class="list-group-item"><strong>Donor Blood Group :</strong>      <c:out value='${requestScope.donorInfo.getBloodGroup()}'/></li>
                                    <li class="list-group-item"><strong>Donor Department:</strong>  <c:out value='${requestScope.donorInfo.getDept()}'/></li>

                                    <li class="list-group-item"><strong>Donor Session:</strong>     <c:out value='${requestScope.donorInfo.getSession()}'/></li>
                                    <li class="list-group-item"><strong>Donor Phone1:</strong>  <c:out value='${requestScope.donorInfo.getPhone1()}'/></li>
                                    <li class="list-group-item"><strong>Donor Phone2:</strong>  <c:out value='${requestScope.donorInfo.getPhone2()}'/></li>

                                    <li class="list-group-item"><strong>Donor Address:</strong>     <c:out value='${requestScope.donorInfo.getAddress()}'/></li>
                                    <li class="list-group-item"><strong>Donor Availability:</strong>    <c:out value='${requestScope.donorInfo.getAvailability()}'/></li>
                                    <li class="list-group-item"><strong>Donor Donation Times:</strong>  <c:out value='${requestScope.donorInfo.getDonationTimes()}'/></li>

                                    <li class="list-group-item"><strong>Day Count From Last Day:</strong>   <c:out value='${requestScope.donorInfo.getTimeElapsed()}'/></li>

                                </ul>




                                <div style="padding-bottom: 20px" class="col-sm-offset-5 col-sm-2 text-center"> 
                                    <a style="text-align: center" href="${pageContext.request.contextPath}/ShowDonorInfoEdit?donorID=<c:out value="${requestScope.donorInfo.getDonorID()}" />" class="btn btn-success btn-lg" role="button">Edit Donor Info</a>
                                </div>


                                <c:out value="${request.getAttribute().getDonorName}"/> 
                                <c:out value="${Donor.getDonationPlace()}" />







                            </div>
                        </c:otherwise>
                    </c:choose>



                </div>






                <div id="menu1" class="tab-pane fade">

                    <h3>PERSONAL DONATION HISTORY</h3>

                    <c:choose>
                        <c:when test="${empty personalHistory}">

                            <div class="container">

                                <h4 >No donation to show. This donor has not given any donation yet!</h4>
                                <br />
                            </div>
                        </c:when>    
                        <c:otherwise>
                            <%
                                int i = 0;
                            %>
                            <div class="col-md-10 col-md-offset-1">

                                <table id="allDonor" class="table table-bordered">
                                    <caption style="color:black" >Donations Table</caption>

                                    <br/>
                                    <thead>
                                        <tr>
                                            <th scope="col">#</th>
                                            <th scope="col">Donation Date</th>
                                            <th scope="col">Donation Place</th>
                                            <th scope="col">Actions</th>


                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${personalHistory}" var="Donor">
                                            <tr class="info">
                                                <th scope="row"><%=++i%></th>


                                                <td><c:out value="${Donor.getDonationDate()}"/> </td>
                                                <td><c:out value="${Donor.getDonationPlace()}" /></td>
                                                <td>
                                                    <div class="row">
                                                        <a href="${pageContext.request.contextPath}/ShowDonationInfoEdit?donationID=<c:out value="${Donor.getDonationID()}" />" class="btn btn-primary btn-sm">
                                                            <span class="glyphicon glyphicon-pencil"></span> Edit
                                                        </a>

                                                        <a onclick="return confirm('Are you sure you want to delete?')" href="${pageContext.request.contextPath}/DeleteDonationServlet?donationID=<c:out value="${Donor.getDonationID()}" />" class="btn btn-danger btn-sm" onclick="return confirm('Are you sure you want to delete?')">
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

                </div>

            </div>
        </div>

        <% } else {%>
        <%

            response.sendRedirect("login.jsp");
        %>
        <% }%>

    </body>
</html>
