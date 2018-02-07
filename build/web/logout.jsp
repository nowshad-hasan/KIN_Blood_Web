<%-- 
    Document   : logout
    Created on : Mar 23, 2017, 10:43:10 AM
    Author     : Nowshad Hasan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 
 <%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="DAO.DBConnection"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>LOG OUT</title>
    </head>
    <body>
<!--        <h1>Hello World!</h1>-->
        
     <%
     // for checking the session is available or not, if not available it will throw exception, "Session already invalidated."
      if (session.getAttribute("session")!=null) {
        session.invalidate();
        response.sendRedirect("Home.jsp");
      }
     %>
 </body>
    
</html>
