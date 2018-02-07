<%-- 
    Document   : add_donor_result
    Created on : Jan 1, 2018, 11:54:44 PM
    Author     : nowshad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="entity.Donor" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>New Donor Result</title>
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

        <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
        <script>
            $(function () {
                $("#NewDonorResult").dataTable();
                $("#repetitiveDonorResult").dataTable();
                $("#problematicDonorResult").dataTable();
            });

//            $(function () {
//                $("#repetitiveDonorResult").dataTable();
//            });
//
//            $(function () {
//                $("#problematicDonorResult").dataTable();
//            });
        </script>
    </head>
    <body>


        <% if (session.getAttribute("session") == "validSession") { %>


        <nav class="navbar navbar-inverse navbar-fixed-top" >
            <div class="container">
                <div class="navbar-header">
                    <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/admin_home.jsp">KIN BLOOD</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">

                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="${pageContext.request.contextPath}/admin_home.jsp">Home</a></li>





                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#" >Add Donor
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/add_donor_excel.jsp">From Excel</a></li>
                                <li><a href="${pageContext.request.contextPath}/add_donor_manual.jsp">Manually</a></li>
                            </ul>
                        </li>

                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Donor List
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">Available Donor</a></li>
                                <li><a href="#">Unavailable Donor</a></li>
                                <li><a href="#">Ex Donor</a></li>
                                <li><a href="#">All Donor</a></li>
                            </ul>
                        </li>

                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Profile Management
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="#">User Profile</a></li>
                                <li><a href="#">Admin Profile</a></li>
                            </ul>
                        </li>

                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#" >
                                <c:out value="${admin_name}"/>
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">My Profile </a></li>
                            </ul>
                        </li>



                        <li><a href="${pageContext.request.contextPath}/logout.jsp" <span class="glyphicon glyphicon-log-out"></span>LOG OUT</a></li>

                    </ul>
                </div>
            </div>
        </nav>

        <div class="color_header">
            <h3 class="color_header_text">ADD NEW DONOR</h3>
        </div>


        <br>
        <br>
        <div class="container-fluid">

            <%
                int i = 0;
            %>

            <c:choose>
                <c:when test="${empty newDonorList}">

                    <p style="color:black"  >No donors are inserted!</p>
                    <br />
                </c:when>    
                <c:otherwise>
                    <div class="col-md-10 col-md-offset-1">
                        <h3>New Donor List Just Inserted</h3>
                        <table id="NewDonorResult" class="table">
                            <caption style="color:white" >Students Table</caption>

                            <br/>
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Donor Name</th>
                                    <th scope="col">Blood Group</th>
                                    <th scope="col">Department</th>
                                    <th scope="col">Session</th>
                                    <th scope="col">Phone 1</th>
                                    <th scope="col">Phone 2</th>
                                    <th scope="col">Address</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${newDonorList}" var="Donor">
                                    <tr class="info">
                                        <th scope="row"><%=++i%></th>
                                        <td> <c:out value="${Donor.getDonorName()}" /></td>
                                        <td><c:out value="${Donor.getBloodGroup()}" /></td>
                                        <td><c:out value="${Donor.getDept()}"/> </td>
                                        <td><c:out value="${Donor.getSession()}"/> </td>
                                        <td> <c:out value="${Donor.getPhone1()}" /></td>
                                        <td><c:out value="${Donor.getPhone2()}" /></td>
                                        <td><c:out value="${Donor.getAddress()}"/> </td>
                                    </tr>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table> 
                    </div>

                </c:otherwise>
            </c:choose>
            <br>
            <br>


            <c:choose>
                <c:when test="${empty repetitiveDonorList}">


                    <p style="color:black"  >No repetitive donor is here./p>
                        <br />
                    </c:when>    
                    <c:otherwise>
                        <%
                            i = 0;
                        %>
                    <div class="col-md-10 col-md-offset-1">
                        <h3 >Repetitive Donor List Not Inserted</h3>
                        <table id="repetitiveDonorResult" class="table table-bordered">
                            <caption style="color:white" >Students Table</caption>

                            <br/>
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Donor Name</th>
                                    <th scope="col">Blood Group</th>
                                    <th scope="col">Department</th>
                                    <th scope="col">Session</th>
                                    <th scope="col">Phone 1</th>
                                    <th scope="col">Phone 2</th>
                                    <th scope="col">Address</th>

                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${repetitiveDonorList}" var="Donor">
                                    <tr class="warning">
                                        <th scope="row"><%=++i%></th>
                                        <td> <c:out value="${Donor.getDonorName()}" /></td>
                                        <td><c:out value="${Donor.getBloodGroup()}" /></td>
                                        <td><c:out value="${Donor.getDept()}"/> </td>
                                        <td><c:out value="${Donor.getSession()}"/> </td>
                                        <td> <c:out value="${Donor.getPhone1()}" /></td>
                                        <td><c:out value="${Donor.getPhone2()}" /></td>
                                        <td><c:out value="${Donor.getAddress()}"/> </td>
                                    </tr>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>



            <c:choose>
                <c:when test="${empty problematicDonorList}">


                    <p style="color:black"  >No donors are inserted!</p>
                    <br />
                </c:when>    
                <c:otherwise>
                    <%
                        i = 0;
                    %>
                    <div class="col-md-10 col-md-offset-1">

                        <h3> Problematic Donor List</h3>
                        <table  id="problematicDonorResult" class="table table-responsive table-condensed table-bordered" >
                            <caption style="color:white" >Students Table</caption>

                            <br/>
                            <thead>
                                <tr>
                                    <th scope="col">#</th>
                                    <th scope="col">Donor Name</th>
                                    <th scope="col">Blood Group</th>
                                    <th scope="col">Department</th>
                                    <th scope="col">Session</th>
                                    <th scope="col">Phone 1</th>
                                    <th scope="col">Phone 2</th>
                                    <th scope="col">Address</th>


                                </tr>
                            </thead>
                            <tbody>
                                <c:forEach items="${problematicDonorList}" var="Donor">
                                    <tr class="danger">
                                        <th scope="row"><%=++i%></th>
                                        <td> <c:out value="${Donor.getDonorName()}" /></td>
                                        <td><c:out value="${Donor.getBloodGroup()}" /></td>
                                        <td><c:out value="${Donor.getDept()}"/> </td>
                                        <td><c:out value="${Donor.getSession()}"/> </td>
                                        <td> <c:out value="${Donor.getPhone1()}" /></td>
                                        <td><c:out value="${Donor.getPhone2()}" /></td>
                                        <td><c:out value="${Donor.getAddress()}"/> </td>
                                    </tr>
                                    </tr>
                                </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </c:otherwise>
            </c:choose>


            <div class="container" style="text-align: center; padding-bottom: 20px">
                <a href="${pageContext.request.contextPath}/admin_home.jsp" class="btn btn-primary btn-lg">
                    <span class="glyphicon glyphicon-home"></span> HOME 
                </a>
            </div>


        </div>



        <% } else {%>
        <%

            response.sendRedirect("login.jsp");
        %>
        <% }%>
    </body>
</html>
