/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import entity.Feedback;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.ArrayList;

/**
 *
 * @author nowshad
 */
public class FeedbackInfo {

    private DBConnection dbConnection;
    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    String sql;

    public FeedbackInfo() {
        dbConnection = new DBConnection();
        connection = dbConnection.getDbConnection();
    }

    public String addNewFeedback(String email, String message) {
        String result =""; 
        sql="INSERT INTO `feedback_table` (`feedback_id`, `feedback_email`, `feedback_message`) VALUES (NULL, ?,?)";

        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);
            preparedStatement.setString(2, message);
            int update = preparedStatement.executeUpdate();

            if (update > 0) {
                result = "successful";
            } else if (update == 0) {
                result = "unsuccessful";
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return result;

    }
    
    public List<Feedback> getAllFeedback()
    {
        List<Feedback> feedbackList = new ArrayList<Feedback>();
        
        sql="SELECT * FROM `feedback_table`";
        
        try
        {
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
            
            while(resultSet.next())
            {
                Feedback feedback=new Feedback();
                
                feedback.setFeedbackID(resultSet.getInt("feedback_id"));
                feedback.setFeedbackEmail(resultSet.getString("feedback_email"));
                feedback.setFeedbackMsg(resultSet.getString("feedback_message"));
                
                feedbackList.add(feedback);
            }
            
        }catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        
        return feedbackList;
    }

}
