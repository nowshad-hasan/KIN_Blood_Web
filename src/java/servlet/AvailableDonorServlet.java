/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.DonorInfo;
import entity.Donor;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author nowshad
 */
public class AvailableDonorServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String bloodGroup = request.getParameter("bloodGroup");

        DonorInfo donorInfo = new DonorInfo();
        


        try{
            request.setAttribute("availableDonor", donorInfo.getAvailableDonorInfo(bloodGroup));
        }catch(ParseException ex)
        {
            ex.printStackTrace();
        }
        
        RequestDispatcher rd = request.getRequestDispatcher("available_donor.jsp");
        rd.forward(request, response);

    }

}
