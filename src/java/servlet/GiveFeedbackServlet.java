/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import DAO.FeedbackInfo;
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
public class GiveFeedbackServlet extends HttpServlet {




    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
      
    }


    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String feedbackEmail=request.getParameter("email");
        String feedbackMessage=request.getParameter("message");
        
        FeedbackInfo feedbackInfo=new FeedbackInfo();
        request.setAttribute("feedbackInfo", feedbackInfo.addNewFeedback(feedbackEmail, feedbackMessage));
        
                RequestDispatcher rd = request.getRequestDispatcher("Home.jsp");
        rd.forward(request, response);
      
    }



}
