/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.DonorInfo;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nowshad
 */
public class ShowDonorInfoEdit extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        int DonorID = Integer.parseInt(request.getParameter("donorID"));

        DonorInfo donorInfo = new DonorInfo();

        try {
            request.setAttribute("donorInfo", donorInfo.getDonorInfoEdit(DonorID));
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        RequestDispatcher rd = request.getRequestDispatcher("edit_donor_info.jsp");
        rd.forward(request, response);

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
