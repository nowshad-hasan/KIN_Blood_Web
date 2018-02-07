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
import javax.servlet.http.Part;

/**
 *
 * @author nowshad
 */
public class AddNewDonorExcelServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        try {
//            System.out.println("dkjshfkl");

            Part sourceFile = request.getPart("file");

            AddNewDonor addNewDonor = new AddNewDonor();

            List<List> addDonorList = addNewDonor.newDonorFromExcel(sourceFile);

            request.setAttribute("newDonorList", addDonorList.get(0));
            request.setAttribute("repetitiveDonorList", addDonorList.get(1));
            request.setAttribute("problematicDonorList", addDonorList.get(2));
//            request.setAttribute("addDonor", addDonorList);
            RequestDispatcher rd = request.getRequestDispatcher("add_donor_result.jsp");
            rd.forward(request, response);

        } catch (Exception ex) {
            ex.printStackTrace();
        }

    }

}
