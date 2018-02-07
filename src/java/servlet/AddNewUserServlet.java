/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.UserInfo;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nowshad
 */
public class AddNewUserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String userName = request.getParameter("userName");
        String userEmail = request.getParameter("userEmail");
        String userPass = request.getParameter("userPass");

        UserInfo userInfo = new UserInfo();

        request.setAttribute("addNewUser", userInfo.addNewUser(userName, userEmail, userPass));

      
        RequestDispatcher rd = request.getRequestDispatcher("additional_info.jsp");
        rd.forward(request, response);

    }

}
