/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import entity.User;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author nowshad
 */
public class UserInfo {

    private DBConnection dbConnection;
    private Connection connection;

    private PreparedStatement preparedStatement;
    private String sql = "";
    private ResultSet resultSet;

    public UserInfo() {
        dbConnection = new DBConnection();
        connection = dbConnection.getDbConnection();
    }

    public String addNewUser(String userName, String userEmail, String password) {
        sql = "INSERT INTO `user_table` (`user_id`, `user_name`, `user_email`, `user_pass`) VALUES (NULL, ?, ?, ?)";
        String result = "";

        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, userEmail);
            preparedStatement.setString(3, password);
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

    public List<User> getAllUser() {

        List<User> userList = new ArrayList<User>();

        sql = "select * from user_table";

        try {
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                User user = new User();

                int userId = resultSet.getInt("user_id");
                String userName = resultSet.getString("user_name");
                String userEmail = resultSet.getString("user_email");
                String userPass = resultSet.getString("user_pass");

                user.setUserId(userId);
                user.setUserName(userName);
                user.setUserEmail(userEmail);
                user.setUserPass(userPass);

                userList.add(user);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return userList;
    }

    public User getUserInfo(int userID) {
        User user = new User();
        sql = "select * from user_table where user_id=?";

        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, userID);
            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                int userId = resultSet.getInt("user_id");
                String userName = resultSet.getString("user_name");
                String userEmail = resultSet.getString("user_email");
                String userPass = resultSet.getString("user_pass");

                user.setUserId(userId);
                user.setUserName(userName);
                user.setUserEmail(userEmail);
                user.setUserPass(userPass);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return user;
    }

    public String editUserInfo(int userID, String userName, String userEmail, String userPass) {
        sql = "UPDATE `user_table` SET `user_name` = ?, `user_email` = ?, `user_pass` = ? WHERE `user_table`.`user_id` = ?";

        String result = "";

        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, userName);
            preparedStatement.setString(2, userEmail);
            preparedStatement.setString(3, userPass);
            preparedStatement.setInt(4, userID);
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

    public String deleteUserInfo(int userID) {
        sql = "delete from user_table where user_id=?";

        String result = "";

        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, userID);

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

}
