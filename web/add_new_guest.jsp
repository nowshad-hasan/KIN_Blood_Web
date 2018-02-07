<%-- 
    Document   : add_new_guest
    Created on : Feb 3, 2018, 10:21:32 AM
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
        <link href="FrontEnd/css/bootstrap-switch.css" rel="stylesheet">

        <link rel="stylesheet" href="FrontEnd/css/footer-distributed-with-contact-form.css">

        <script type="text/javascript" src="FrontEnd/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>

        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="FrontEnd/javascript/bootstrap-switch.js"></script>

        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">


        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/css/bootstrap-select.min.css">

        <!-- Latest compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.4/js/bootstrap-select.min.js"></script>
        <script type="text/javascript"  src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
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
                    <a class="navbar-brand" href="${pageContext.request.contextPath}/Home.jsp">KIN BLOOD</a>
                </div>
                <div class="collapse navbar-collapse" id="myNavbar">

                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="${pageContext.request.contextPath}/login.jsp"><span class="glyphicon glyphicon-log-in"></span> Login</a></li>


                    </ul>
                </div>
            </div>
        </nav>

        <div class="color_header">
            <h3 class="color_header_text">ADD NEW GUEST DONOR</h3>
        </div>
        <br>

        <div class="container">



            <h2>Donor Info for Edit</h2>
            <form class="form-horizontal" action="AddGuestDonorServlet" method="post">
                <div class="form-group">
                    <label class="control-label col-sm-2" >Donor Name:</label>
                    <div class="col-sm-10">
                        <input  required="required" type="text" class="form-control" id="email" placeholder="Donor Name" name="donorName">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" >Blood Group:</label>
                    <div class="col-sm-10">
                        <select id="selectpicker" required  name="bloodGroup" data-width="50%" class="selectpicker show-tick" title="Choose one of the following...">
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
                    </div>
                </div>


                <div class="form-group">
                    <label class="control-label col-sm-2" >Department:</label>
                    <div class="col-sm-10">          
                        <input  type="text" class="form-control" id="pwd" placeholder="Enter Department" name="donorDept">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" >Session:</label>
                    <div class="col-sm-10">          
                        <input  type="text" class="form-control" id="pwd" placeholder="Enter Session" name="donorSession">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Phone1:</label>
                    <div class="col-sm-10">          
                        <input  required type="text" class="form-control" id="pwd" placeholder="Enter Phone1" name="donorPhone1">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Phone2:</label>
                    <div class="col-sm-10">          
                        <input type="text" class="form-control" id="pwd" placeholder="Enter Phone2" name="donorPhone2">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Address:</label>
                    <div class="col-sm-10">          
                        <input  type="text" class="form-control" id="pwd" placeholder="Enter Address" name="donorAddress">
                    </div>
                </div>






                <!--                <input type="checkbox" name="my-checkbox">-->

                <div class="form-group">        
                    <div class="col-sm-offset-2 col-sm-10">
                        <button onclick="return checkCondition();" type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </form>
        </div>
    </body>
</html>
