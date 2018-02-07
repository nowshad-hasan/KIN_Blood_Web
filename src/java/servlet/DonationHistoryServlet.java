/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.DonationInfo;
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
public class DonationHistoryServlet extends HttpServlet {



    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
//        System.out.println("get hello!");
        
      
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
//         System.out.println("hello!");

        String bloodGroup = request.getParameter("bloodGroup");

        DonationInfo donationInfo = new DonationInfo();
       // DonorInfo donorInfo=new DonorInfo();

        try {
          //  System.out.print("kdjashfl");
            request.setAttribute("donationHistory", donationInfo.getDonationHistory(bloodGroup));
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        RequestDispatcher rd = request.getRequestDispatcher("donation_history.jsp");
        rd.forward(request, response);
        
    }



}
