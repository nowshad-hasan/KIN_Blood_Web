<%-- 
    Document   : edit_donor
    Created on : Jan 29, 2018, 9:01:54 AM
    Author     : nowshad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Donor Information </title>

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
        <script type="text/javascript" charset="utf8" src="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/jquery.dataTables.min.js"></script>
        <link rel="stylesheet" type="text/css" href="http://ajax.aspnetcdn.com/ajax/jquery.dataTables/1.9.4/css/jquery.dataTables.css">
        <script>
            $(function () {
                $("#availableDonor").dataTable();
            });
        </script>
    </head>
    <body>
        <% if (session.getAttribute("session") == "validSession") { %>

        <%@ include file = "navbar.jsp" %>

        <div class="color_header">
            <h3 class="color_header_text">DONOR INFORMATION EDIT</h3>
        </div>

        <div class="container">
            <h2>Donor Info for Edit</h2>
            <form class="form-horizontal" action="EditDonorInfoServlet" method="post">
                <div class="form-group">
                    <label class="control-label col-sm-2" >Donor Name:</label>
                    <div class="col-sm-10">
                        <input value="<c:out value='${requestScope.donorInfo.getDonorName()}'/>" type="text" class="form-control" id="email" placeholder="Donor Name" name="donorName">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" >Blood Group:</label>
                    <div class="col-sm-10">
                        <select id="selectpicker" val="B-" required  name="bloodGroup"  data-width="50%" class="selectpicker show-tick" title="Choose one of the following...">
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
                        <input value="<c:out value='${requestScope.donorInfo.getDept()}'/>" type="text" class="form-control" id="pwd" placeholder="Enter Department" name="donorDept">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" >Session:</label>
                    <div class="col-sm-10">          
                        <input value="<c:out value='${requestScope.donorInfo.getSession()}'/>" type="text" class="form-control" id="pwd" placeholder="Enter Session" name="donorSession">
                    </div>
                </div>
                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Phone1:</label>
                    <div class="col-sm-10">          
                        <input value="<c:out value='${requestScope.donorInfo.getPhone1()}'/>" type="text" class="form-control" id="pwd" placeholder="Enter Phone1" name="donorPhone1">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Phone2:</label>
                    <div class="col-sm-10">          
                        <input value="<c:out value='${requestScope.donorInfo.getPhone2()}'/>" type="text" class="form-control" id="pwd" placeholder="Enter Phone2" name="donorPhone2">
                    </div>
                </div>

                <div class="form-group">
                    <label class="control-label col-sm-2" for="pwd">Address:</label>
                    <div class="col-sm-10">          
                        <input value="<c:out value='${requestScope.donorInfo.getAddress()}'/>" type="text" class="form-control" id="pwd" placeholder="Enter Address" name="donorAddress">
                    </div>
                </div>


                <div class="form-group">        
                    <div class="col-sm-offset-2 col-sm-10">
                        <div class="checkbox">


                            <c:choose>
                                <c:when test="${requestScope.donorInfo.getAvailability()=='yes'}">
                                    <label><input id="hey"  checked type="checkbox" name="donorAvailability"> Availability:</label>

                                </c:when>

                                <c:otherwise>
                                    <label><input id="hey" type="checkbox"  name="donorAvailability"> Availability:</label>
                                    <!--                                    <input type="hidden" name="availability" value="off">-->
                                </c:otherwise>
                            </c:choose>

                            <input id="testNameHidden" type="hidden" value="off" name="donorAvailability">
                        </div>
                    </div>
                </div>
                    
                    <input type="hidden" name="donorID" value="${requestScope.donorInfo.getDonorID()}">



                <!--                <input type="checkbox" name="my-checkbox">-->

                <div class="form-group">        
                    <div class="col-sm-offset-2 col-sm-10">
                        <button onclick="return checkCondition();" type="submit" class="btn btn-primary">Submit</button>
                    </div>
                </div>
            </form>
        </div>

        <script>
//            $("[name='my-checkbox']").bootstrapSwitch();
//            $('input[name="my-checkbox"]').on('switchChange.bootstrapSwitch', function (event, state) {
////                console.log(this); // DOM element
////                console.log(event); // jQuery event
//                console.log(state); // true | false
//                $('input[name="my-checkbox"]').val(state);
//               
//                
//            });
            $('.selectpicker').selectpicker('val', '<c:out value='${requestScope.donorInfo.getBloodGroup()}'/>');
//            $( "#hey" ).prop( "checked", true );


//            $(document).ready(function () {
//                //set initial state.
////                $('#hey').val($(this).is(':checked'));
//
//                $('#hey').change(function () {
//                    if ($(this).is(":checked")) {
//                        var returnVal = confirm("Are you sure?");
//                        $(this).attr("checked", returnVal);
//                    }
//                    $('#hey').val($(this).is(':checked'));
//                });
//            });

//            $('#hey').change(function () {
//                if ($(this).attr('checked')) {
//                    $(this).val('TRUE');
//                } else {
//                    $(this).val('FALSE');
//                }
//            });

            function checkCondition()
            {
                if (document.getElementById("hey").checked) {
                    document.getElementById('testNameHidden').disabled = true;
                }
//                if (document.getElementById("hey").checked) {
//                    document.getElementById('testNameHiddenSwitch').disabled = true;
//                }

            }


//            $("#hey").on('change', function() {
//  if ($(this).is(':checked')) {
//    $(this).attr('value', 'true');
//  } else {
//    $(this).attr('value', 'false');
//  }
//  
//  
//});



        </script>


        <%--
        
                    if (${requestScope.donorInfo.getAvailability()=='yes'})
            {
                console.log("true");
                $('#hey').val('TRUE');


            } else {
                console.log("false");
                $('#hey').val('False');
            }
                                    <c:choose>
                                        <c:when test="${requestScope.donorInfo.getAvailability()=='yes'}">
                                            <label><input id="hey"  type="checkbox" name="availability"> Availability:</label>

                                </c:when>

                                <c:otherwise>
                                    <label><input id="hey"  type="checkbox"  name="availability"> Availability:</label>
                                    <!--                                    <input type="hidden" name="availability" value="off">-->
                                </c:otherwise>
                            </c:choose>
        --%>




        <% } else {%>
        <%

            response.sendRedirect("login.jsp");
        %>
        <% }%>
    </body>
</html>
