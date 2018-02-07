/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.AddNewDonor;
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
public class AddGuestDonorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String donorName = request.getParameter("donorName");
        String bloodGroup = request.getParameter("bloodGroup");
        String donorDept = request.getParameter("donorDept");
        String donorSession = request.getParameter("donorSession");
        String donorPhone1 = request.getParameter("donorPhone1");
        String donorPhone2 = request.getParameter("donorPhone2");
        String donorAddress = request.getParameter("donorAddress");

        AddNewDonor addNewDonor = new AddNewDonor();

        request.setAttribute("addNewGuest", addNewDonor.addNewGuestDonor(donorName, bloodGroup, donorDept, donorSession, donorPhone1, donorPhone2, donorAddress));

        RequestDispatcher rd = request.getRequestDispatcher("additional_info_guest.jsp");
        rd.forward(request, response);

    }

}
