/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author nowshad
 */
public class AdminInfo {

    private DBConnection dbConnection;
    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    String sql;

    public AdminInfo() {
        dbConnection = new DBConnection();
        connection = dbConnection.getDbConnection();
    }

    public boolean validateAdmin(String email, String password) {
        sql = "select admin_name from admin_table where admin_email=? and admin_pass=?";
        
        
         boolean validation=false;
        try
        {
            preparedStatement = connection.prepareStatement(sql);
             preparedStatement.setString(1, email);
             preparedStatement.setString(2, password);
             resultSet = preparedStatement.executeQuery();
             if(resultSet.next())
             {
                 validation=true;
             }
             else
             {
                 validation=false;
             }
             
        }catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        return validation;
       

    }
    
    public String getAdminName(String email)
    {
        sql="select admin_name from admin_table where admin_email=?";
        String adminName=null;
        
        try
        {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, email);
            resultSet = preparedStatement.executeQuery();
            if(resultSet.next())
            {
                adminName=resultSet.getString("admin_name");
            }
        }
        catch(SQLException ex)
        {
            ex.printStackTrace();
        }
        return adminName;
        
    }

}
