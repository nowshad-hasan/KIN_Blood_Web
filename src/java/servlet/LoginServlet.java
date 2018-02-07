/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.AdminInfo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


/**
 *
 * @author nowshad
 */
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();

        String adminEmail = request.getParameter("email");
        String adminpassword = request.getParameter("password");

        AdminInfo adminInfo = new AdminInfo();
        if (adminInfo.validateAdmin(adminEmail, adminpassword)) {
            session.setAttribute("session", "validSession");
            session.setAttribute("admin_name", adminInfo.getAdminName(adminEmail));
            session.setAttribute("adminEmail", adminEmail);
            session.setAttribute("adminPassword", adminpassword);

            RequestDispatcher rd = request.getRequestDispatcher("admin_home.jsp");
            rd.forward(request, response);
        } else {
            response.sendRedirect("login.jsp");
        }
    }

}
