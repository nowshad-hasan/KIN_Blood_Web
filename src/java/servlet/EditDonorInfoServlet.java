/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.DonorInfo;
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
public class EditDonorInfoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int donorID = Integer.parseInt(request.getParameter("donorID"));
        String donorName = request.getParameter("donorName");
        String bloodGroup = request.getParameter("bloodGroup");
        String donorDept = request.getParameter("donorDept");
        String donorSession = request.getParameter("donorSession");
        String donorPhone1 = request.getParameter("donorPhone1");
        String donorPhone2 = request.getParameter("donorPhone2");
        String donorAddress = request.getParameter("donorAddress");
        String donorAvailability = request.getParameter("donorAvailability");

        if (donorAvailability.equals("on")) {
            donorAvailability = "yes";
        } else if (donorAvailability.equals("off")) {
            donorAvailability = "no";
        }

        DonorInfo donorInfo = new DonorInfo();

        request.setAttribute("editDonorInfo", donorInfo.editDonorInfo(donorID, donorName, bloodGroup, donorDept, donorSession, donorPhone1, donorPhone2, donorAddress, donorAvailability));

        RequestDispatcher rd = request.getRequestDispatcher("additional_info.jsp");
        rd.forward(request, response);

    }

}
