/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.AddNewDonor;
import entity.Donor;
import java.io.IOException;
import java.io.PrintWriter;
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
public class AddNewDonorManualServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {



    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

                List<Donor> donorListFromJSP = new ArrayList<Donor>();

        for (int i = 1; i <= 10; ++i) {
            String donorName = "name_" + Integer.toString(i);
            String bloodGroup = "bloodGroup_" + Integer.toString(i);
            String dept = "dept_" + Integer.toString(i);
            String donorSession = "session_" + Integer.toString(i);
            String phone1 = "phone1_" + Integer.toString(i);
            String phone2 = "phone2_" + Integer.toString(i);
            String address = "address_" + Integer.toString(i);

            Donor donor = new Donor();

            donor.setDonorName(request.getParameter(donorName));
            donor.setBloodGroup(request.getParameter(bloodGroup));
            donor.setDept(request.getParameter(dept));
            donor.setSession(request.getParameter(donorSession));
            donor.setPhone1(request.getParameter(phone1));
            donor.setPhone2(request.getParameter(phone2));

            donorListFromJSP.add(donor);
        }

        AddNewDonor addNewDonor = new AddNewDonor();

        List<List> addDonorList = addNewDonor.newDonorManually(donorListFromJSP);
        
                    request.setAttribute("newDonorList", addDonorList.get(0));
            request.setAttribute("repetitiveDonorList", addDonorList.get(1));
            request.setAttribute("problematicDonorList", addDonorList.get(2));

       // request.setAttribute("addDonor", addDonorList);
        RequestDispatcher rd = request.getRequestDispatcher("add_donor_result.jsp");
        rd.forward(request, response);
        
    }

}
