/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import entity.Donor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 *
 * @author nowshad
 */
public class DonationInfo {

    private DBConnection dbConnection;
    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    String sql;

    public DonationInfo() {
        dbConnection = new DBConnection();
        connection = dbConnection.getDbConnection();
    }

    public List<Donor> getDonationHistory(String bloodGroup) {

        List<Donor> donationHistoryList = new ArrayList<Donor>();

        if (bloodGroup.equals("ALL")) {

            sql = "SELECT donor_table.donor_id,donation_id,donor_name, donor_blood_group, donor_dept,"
                    + " donor_session, donation_date, donation_place from donor_table,donation_table "
                    + "where donor_table.donor_id=donation_table.donor_id ORDER BY donation_table.donation_id desc";
        } else {

            sql = "SELECT donor_table.donor_id,donation_id,donor_name, donor_blood_group, donor_dept, "
                    + "donor_session, donation_date, donation_place from donor_table,donation_table "
                    + "where donor_table.donor_id=donation_table.donor_id and donor_table.donor_blood_group=? ORDER BY donation_table.donation_id desc";
        }

        try {
            preparedStatement = connection.prepareStatement(sql);
            if (!bloodGroup.equals("ALL")) {
                preparedStatement.setString(1, bloodGroup);
            }
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {

                Donor donor = new Donor();
                int donorId = resultSet.getInt("donor_id");
                int donationID = resultSet.getInt("donation_id");
                String donorName = resultSet.getString("donor_name");

                String donorBloodGroup = resultSet.getString("donor_blood_group");
                String donorDept = resultSet.getString("donor_dept");
                String donorSession = resultSet.getString("donor_session");
                String donationDate = resultSet.getString("donation_date");
                String donationPlace = resultSet.getString("donation_place");

                donor.setDonorID(donorId);
                donor.setDonationID(donationID);
                donor.setDonorName(donorName);
                donor.setBloodGroup(donorBloodGroup);
                donor.setDept(donorDept);
                donor.setSession(donorSession);
                donor.setDonationDate(donationDate);
                donor.setDonationPlace(donationPlace);

                donationHistoryList.add(donor);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return donationHistoryList;

    }

    public List<Donor> getPersonalDonationHistory(int donorID) {
        List<Donor> personalDonationHistoryList = new ArrayList<Donor>();

        sql = "SELECT * from donation_table where donor_id=?";

        try {
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, donorID);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {

                Donor donor = new Donor();

                int donationID = resultSet.getInt("donation_id");
                String donationDate = resultSet.getString("donation_date");
                String donationPlace = resultSet.getString("donation_place");

                donor.setDonationID(donationID);
                donor.setDonationDate(donationDate);
                donor.setDonationPlace(donationPlace);

                personalDonationHistoryList.add(donor);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return personalDonationHistoryList;
    }

    public String deleteDonation(int donationID) {

        String result = "";
        sql = "DELETE FROM `donation_table` WHERE `donation_table`.`donation_id` =?";

        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, donationID);

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

    public String addNewDonation(int donorID, String donationDate, String donationPlace) {

        String result = "";
        String donationDateCvt = changeDateFormatYearToDay(donationDate);
        sql = "INSERT INTO `donation_table` (`donation_id`, `donor_id`, `donation_date`, `donation_place`) VALUES (NULL, ?, ?, ?)";

        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, donorID);
            preparedStatement.setString(2, donationDateCvt);
            preparedStatement.setString(3, donationPlace);

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

    public String changeDateFormatYearToDay(String donationDate) {

        String resultDate = "";

        DateFormat fromFormat = new SimpleDateFormat("yyyy-MM-dd");
        fromFormat.setLenient(false);
        DateFormat toFormat = new SimpleDateFormat("dd-MM-yyyy");
        toFormat.setLenient(false);
        //   String dateStr = "2011-07-09";
        try {
            Date date = fromFormat.parse(donationDate);
            resultDate = toFormat.format(date);
            // System.out.println(toFormat.format(date));
        } catch (ParseException ex) {
            ex.printStackTrace();
        }

        return resultDate;

    }

    public String changeDateFormatDayToYear(String donationDate) {

        String resultDate = "";

        DateFormat fromFormat = new SimpleDateFormat("dd-MM-yyyy");
        fromFormat.setLenient(false);
        DateFormat toFormat = new SimpleDateFormat("yyyy-MM-dd");
        toFormat.setLenient(false);
        //   String dateStr = "2011-07-09";
        try {
            Date date = fromFormat.parse(donationDate);
            resultDate = toFormat.format(date);
            // System.out.println(toFormat.format(date));
        } catch (ParseException ex) {
            ex.printStackTrace();
        }

        return resultDate;

    }

    public Donor getDonationInfo(int donationID) {
        Donor donation = new Donor();

        sql = "SELECT * FROM `donation_table` WHERE donation_id=?";

        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, donationID);

            resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                donation.setDonationID(resultSet.getInt("donation_id"));
                donation.setDonationDate(changeDateFormatDayToYear(resultSet.getString("donation_date")));
                donation.setDonationPlace(resultSet.getString("donation_place"));
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return donation;
    }

    public String editDonation(int donationID, String donationDate, String donationPlace) {
        String result = "";
        sql = "UPDATE `donation_table` SET `donation_date` = ?, `donation_place` =? WHERE `donation_table`.`donation_id` = ?";

        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, changeDateFormatYearToDay(donationDate));
            preparedStatement.setString(2, donationPlace);
            preparedStatement.setInt(3, donationID);

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
