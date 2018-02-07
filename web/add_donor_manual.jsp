<%-- 
    Document   : add_donor_manual
    Created on : Dec 31, 2017, 10:35:11 AM
    Author     : nowshad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Donor Manual</title>
        <meta name="viewport" content="width=device-width, initial-scale=1" />
        <link rel="stylesheet" href="FrontEnd/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" />
        <link rel="stylesheet" href="FrontEnd/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css.map">
        <link rel="stylesheet" href="FrontEnd/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="css/style.css"/>

        <link rel="stylesheet" href="FrontEnd/css/footer-distributed-with-contact-form.css">

        <script type="text/javascript" src="FrontEnd/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>




        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
    </head>
    <body>
        <% if (session.getAttribute("session") == "validSession") { %>

   <%@ include file = "navbar.jsp" %>

        <div class="color_header">
            <h3 class="color_header_text">New Donor Manually</h3>
        </div>
   </br>
   </br>
   
        <div class="container-fluid">
            <h3>Add New Donor Manually</h3>
        <form action="AddNewDonorManualServlet" method="post">
            <table class="table table-bordered table-striped table-responsive">
                <caption>List of New Donors</caption>
                <thead class="thead-dark">
                    <tr>
                        <th scope="col">#</th>
                        <th scope="col">Donor Name</th>
                        <th scope="col">Blood Group</th>
                        <th scope="col">Department</th>
                        <th scope="col">Session</th>
                        <th scope="col">Phone1</th>
                        <th scope="col">Phone2</th>
                        <th scope="col">Address</th>
                    </tr>
                </thead>
                <%
                    int i = 0;
                %>
                <tbody>

                    <c:forEach var = "i" begin = "1" end = "10">

                        <%
                            ++i;
                            String donorName = "name_" + Integer.toString(i);
                            String bloodGroup = "bloodGroup_" + Integer.toString(i);
                            String dept = "dept_" + Integer.toString(i);
                            String donorSession = "session_" + Integer.toString(i);
                            String phone1 = "phone1_" + Integer.toString(i);
                            String phone2 = "phone2_" + Integer.toString(i);
                            String address = "address_" + Integer.toString(i);
                        %>
                        <tr>
                            <th scope="row"><%=i%></th>
                            <td>
                                <input required type="text" name="<%=donorName%>" >
                            </td>
                            <td>
                                <input required type="text" name="<%=bloodGroup%>" >
                            </td>
                            <td>
                                <input type="text" name="<%=dept%>" >
                            </td>
                            <td>
                                <input type="text" name="<%=donorSession%>" >
                            </td>
                            <td>
                                <input required type="text" name="<%=phone1%>" >
                            </td>
                            <td>
                                <input type="text" name="<%=phone2%>" >
                            </td>
                            <td>
                                <input type="text" name="<%=address%>" >
                            </td>

                        </tr>
                    </c:forEach>

                </tbody>
            </table>

            <div style="text-align:center">
                <button type="submit" class="btn btn-success btn-lg">Submit</button>
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
