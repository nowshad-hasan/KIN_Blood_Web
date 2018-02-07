/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.DonationInfo;
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
public class EditDonationInfoServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int donationID = Integer.parseInt(request.getParameter("donationID"));
        String donationDate = request.getParameter("donationDate");
        String donationPlace = request.getParameter("donationPlace");

        DonationInfo donationInfo = new DonationInfo();

        request.setAttribute("editDonation", donationInfo.editDonation(donationID, donationDate, donationPlace));

        RequestDispatcher rd = request.getRequestDispatcher("additional_info.jsp");
        rd.forward(request, response);

    }

}
