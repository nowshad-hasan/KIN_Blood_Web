<%-- 
    Document   : Home
    Created on : Dec 28, 2017, 10:58:13 PM
    Author     : nowshad
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <title>KIN BlOOD</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1" />




        <link rel="stylesheet" href="FrontEnd/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css" />
        <link rel="stylesheet" href="FrontEnd/bootstrap-3.3.7-dist/css/bootstrap-theme.min.css.map">
        <link rel="stylesheet" href="FrontEnd/bootstrap-3.3.7-dist/css/bootstrap.min.css"/>
        <link rel="stylesheet" href="FrontEnd/css/style.css"/>
        <link rel="stylesheet" href="FrontEnd/css/footer-distributed-with-contact-form.css">
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script type="text/javascript" src="FrontEnd/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>




        <link rel="stylesheet" href="https://www.w3schools.com/w3css/3/w3.css">
        <link rel="stylesheet" href="https://www.w3schools.com/lib/w3-theme-teal.css">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.3.0/css/font-awesome.min.css">
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

                    <ul class="nav navbar-nav navbar-right">
                        <li><a href="${pageContext.request.contextPath}/add_new_guest.jsp"><span class="glyphicon glyphicon-user"></span> Be a Donor</a></li>


                    </ul>


                </div>
            </div>
        </nav>

        <br>
        <div id="myCarousel" class="carousel slide" data-ride="carousel">
            <!-- Indicators -->
            <ol class="carousel-indicators">

                <li data-target="#myCarousel" data-slide-to="1" ></li>
                <li data-target="#myCarousel" data-slide-to="2"></li>
                <li data-target="#myCarousel" data-slide-to="3"></li>
            </ol>

            <!-- Wrapper for slides -->
            <div class="carousel-inner" role="listbox">

                <div class="item carousel-item active">
                    <img src="FrontEnd/images/19.JPG" alt="Chania" width="460" height="345">
                    <!--          <div class="carousel-caption">
                                <h3>Chania</h3>
                                <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
                              </div>-->
                </div>

                <div class="item carousel-item">
                    <img src="FrontEnd/images/20.JPG" alt="Chania" width="460" height="345">
                    <!--          <div class="carousel-caption">
                                <h3>Chania</h3>
                                <p>The atmosphere in Chania has a touch of Florence and Venice.</p>
                              </div>-->
                </div>

                <div class="item carousel-item">
                    <img src="FrontEnd/images/21.JPG" alt="Flower" width="460" height="345">
                    <!--          <div class="carousel-caption">
                                <h3>Flowers</h3>
                                <p>Beatiful flowers in Kolymbari, Crete.</p>
                              </div>-->
                </div>



            </div>

            <!-- Left and right controls -->
            <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
                <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
                <span class="sr-only">Previous</span>
            </a>
            <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
                <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
                <span class="sr-only">Next</span>
            </a>
        </div>




        <!-- <div class="panel-footer" >
          Copyright &copy; SUSTCSE
        </div> -->


        <div class="w3-row-padding w3-center w3-margin-top">
            <div class="w3-third">
                <div class="w3-card-2 w3-padding-top" style="min-height:400px">
                    <h4>Donate Blood</h4><br>
                    <!-- <i class="fa fa-desktop w3-margin-bottom w3-text-theme" style="font-size:120px"></i> -->
                    <img src="FrontEnd/images/1.png" alt="Turbo" height="150" width="150" />

                    <p>Be a Donor</p>
                    <p>Prepare anytime</p>
                    <p>After every 4 months</p>

                </div>
            </div>

            <div class="w3-third">
                <div class="w3-card-2 w3-padding-top" style="min-height:400px">
                    <h4>Manage Blood</h4><br>
                    <!-- <i class="fa fa-css3 w3-margin-bottom w3-text-theme" style="font-size:120px"></i> -->
                    <img src="FrontEnd/images/2.png" alt="Turbo" height="150" width="150" />
                    <p>Try to connect</p>
                    <p>Help Poor</p>
                    <p>Be prepared</p>
                </div>
            </div>

            <div class="w3-third">
                <div class="w3-card-2 w3-padding-top" style="min-height:400px">
                    <h4>Inspire People</h4><br>
                    <!-- <i class="fa fa-diamond w3-margin-bottom w3-text-theme" style="font-size:120px"></i> -->
                    <img src="FrontEnd/images/3.png" alt="Turbo" height="150" width="150" />
                    <p>Be an example</p>
                    <p>Remove fear from people</p>
                    <p>Take your friends & family</p>

                </div>
            </div>
        </div>




        <footer class="footer-distributed">

            <div class="footer-left">

                <h3>KIN BLOOD
                    <!-- <span>logo</span> -->
                </h3>

                <!--    <p class="footer-links">
                      <a href="#">Home</a>
                      ·
                      <a href="#">Result</a>
                      ·
                      <a href="#">Publish</a>
                      ·
                      <a href="#">About</a>
                      ·
                      <a href="#">Faq</a>
                      ·
                      <a href="#">Contact</a>
                    </p>-->

                <p class="footer-company-name">KIN BLOOD &copy; KIN, A Voluntary Organization of SUST</p>

                <div class="footer-icons">

                    <a target="_blank" href="https://www.facebook.com/groups/KINSUST/"><i class="fa fa-facebook"></i></a>
                    <a target="_blank" href="https://www.youtube.com/channel/UC2R7hYYBVPuhDnEKQUQ6OtQ"><i class="fa fa-youtube"></i></a>
                    <a target="_blank" href="https://plus.google.com/u/1/+KINSUST"><i class="fa fa-google-plus"></i></a>


                </div>

            </div>

            <div class="footer-right">

                <p>Contact Us</p>

                <form method="post" action="GiveFeedbackServlet">

                    <input type="text" name="email" placeholder="Email"  required="required"/>
                    <textarea name="message" placeholder="Message" required="required"></textarea>
                    <button>Send</button>

                </form>

            </div>

        </footer>
        <script>




        </script>
    </body>
</html>

<%--

    <c:choose>
        <c:when test="${not empty feedbackInfo}">
            alert("Thank you!\nYour message is taken under consideration!");
            <c:remove var="feedbackInfo" scope="session" />
        </c:when>
    </c:choose>


<c:remove var="feedbackInfo" scope="request" />
--%>