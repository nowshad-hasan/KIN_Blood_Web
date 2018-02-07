<%-- 
    Document   : navbar
    Created on : Jan 28, 2018, 2:39:23 PM
    Author     : nowshad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        

        
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
                                <li><a href="${pageContext.request.contextPath}/available_donor.jsp">Available Donor</a></li>
                                <li><a href="${pageContext.request.contextPath}/unavailable_donor.jsp">Unavailable Donor</a></li>
                                <li><a href="${pageContext.request.contextPath}/ex_donor.jsp">Ex Donor</a></li>
                                <li><a href="${pageContext.request.contextPath}/all_donor.jsp">All Donor</a></li>
                            </ul>
                        </li>
                        
                        <li><a href="${pageContext.request.contextPath}/donation_history.jsp">Donation History</a></li>

                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#">Management
                                <span class="caret"></span></a>
                            <ul class="dropdown-menu">
                                <li><a href="${pageContext.request.contextPath}/UserServlet">User</a></li>
                                <li><a href="${pageContext.request.contextPath}/FeedbackManagementServlet">Feedback</a></li>
                                <li><a href="${pageContext.request.contextPath}/ShowGuestDonorServlet">Guest Donor</a></li>
                            </ul>
                        </li>

                        <li class="dropdown">
                            <a href="#" >
                                <c:out value="${admin_name}"/>
                                
                            </a>

                        </li>
                        
                        <%--
                        <li class="dropdown">
                            <a class="dropdown-toggle" data-toggle="dropdown" href="#" >
                                <c:out value="${admin_name}"/>
                                <span class="caret"></span>
                            </a>
                            <ul class="dropdown-menu">
                                <li><a href="#">My Profile </a></li>
                            </ul>
                        </li>
                        --%>



                        <li><a href="${pageContext.request.contextPath}/logout.jsp" <span class="glyphicon glyphicon-log-out"></span>LOG OUT</a></li>

                    </ul>
                </div>
            </div>
        </nav>
    </body>
</html>
