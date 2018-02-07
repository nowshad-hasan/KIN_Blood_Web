/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import entity.Donor;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

/**
 *
 * @author nowshad
 */
public class DonorInfo {

    private DBConnection dbConnection;
    private Connection connection;
    private PreparedStatement preparedStatement;
    private ResultSet resultSet;

    String sql;

    public DonorInfo() {
        dbConnection = new DBConnection();
        connection = dbConnection.getDbConnection();

    }

    public List<Donor> getAvailableDonorInfo(String bloodGroup) throws ParseException {

        List<Donor> availableDonorList = new ArrayList<Donor>();

        if (bloodGroup.equals("ALL")) {

            sql = "select donor_table.donor_id,donor_name,donor_blood_group,donor_dept,donor_session,donor_phone1,"
                    + "donation_date from donation_table,donor_table where donor_table.donor_id="
                    + "donation_table.donor_id and donor_availability='yes' and donation_id in "
                    + "(select max(donation_id) from donation_table group by donation_table.donor_id)";
        } else {

            sql = "select donor_table.donor_id,donor_name,donor_blood_group,donor_dept,donor_session,donor_phone1,"
                    + "donation_date from donation_table,donor_table where donor_table.donor_id="
                    + "donation_table.donor_id and donor_availability='yes' and donation_id in"
                    + " (select max(donation_id) from donation_table group by donation_table.donor_id) and donor_blood_group=?";
        }

        try {

            preparedStatement = connection.prepareStatement(sql);
            if (!bloodGroup.equals("ALL")) {
                preparedStatement.setString(1, bloodGroup);
            }
            ResultSet resultSet = preparedStatement.executeQuery();

            DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            Date currentDate = new Date();
            Calendar currentCal = Calendar.getInstance();
            currentCal.setTime(currentDate);
            int currentYear = currentCal.get(Calendar.YEAR);
            int currentMonth = currentCal.get(Calendar.MONTH);
            int currentDay = currentCal.get(Calendar.DAY_OF_MONTH);

            int dayDiff, yearDiff, monthDiff;
            String donationTimeDiff;

            while (resultSet.next()) {

                Donor donor = new Donor();

                Date donationDate = dateFormat.parse(resultSet.getString("donation_date"));
                Calendar donationCal = Calendar.getInstance();
                donationCal.setTime(donationDate);
                int donationYear = donationCal.get(Calendar.YEAR);
                int donationMonth = donationCal.get(Calendar.MONTH);
                int donationDay = donationCal.get(Calendar.DAY_OF_MONTH);

                if (currentDay < donationDay) {
                    dayDiff = currentDay + 30 - donationDay;
                    donationMonth++;
                } else {
                    dayDiff = currentDay - donationDay;
                }

                if (currentMonth < donationMonth) {
                    monthDiff = currentMonth + 12 - donationMonth;
                    donationYear++;
                } else {
                    monthDiff = currentMonth - donationMonth;
                }
                yearDiff = currentYear - donationYear;

//                System.out.println("MonthDiff: "+monthDiff);
                if (monthDiff >= 4 || yearDiff >= 1) {
                    if (yearDiff > 0) {
                        donationTimeDiff = Integer.toString(yearDiff) + " year " + Integer.toString(monthDiff) + " month " + Integer.toString(dayDiff) + " days";
                    } else {
                        donationTimeDiff = Integer.toString(monthDiff) + " month " + Integer.toString(dayDiff) + " days";
                    }
                    System.out.println(donationTimeDiff);

                    int donorId = resultSet.getInt("donor_id");
                    String donorName = resultSet.getString("donor_name");
                    String donorPhone1 = resultSet.getString("donor_phone1");
                    String donorBloodGroup = resultSet.getString("donor_blood_group");
                    String donorDept = resultSet.getString("donor_dept");
                    String donorSession = resultSet.getString("donor_session");
                    int donationTimes = getDonationTimes(donorId);

                    donor.setDonorID(donorId);
                    donor.setDonorName(donorName);
                    donor.setBloodGroup(donorBloodGroup);
                    donor.setDept(donorDept);
                    donor.setSession(donorSession);
                    donor.setTimeElapsed(donationTimeDiff);
                    donor.setDonationTimes(donationTimes);

                    availableDonorList.add(donor);

                }

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        // Another Part
        if (bloodGroup.equals("ALL")) {

            sql = "SELECT * FROM donor_table LEFT JOIN donation_table on"
                    + " donor_table.donor_id=donation_table.donor_id WHERE donation_id is null and donor_availability='yes'";
        } else {

            sql = "SELECT * FROM donor_table LEFT JOIN donation_table on donor_table.donor_id="
                    + "donation_table.donor_id WHERE donation_id is null and donor_availability='yes' and donor_blood_group=?";
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
                String donorName = resultSet.getString("donor_name");
                String donorPhone1 = resultSet.getString("donor_phone1");
                String donorBloodGroup = resultSet.getString("donor_blood_group");
                String donorDept = resultSet.getString("donor_dept");
                String donorSession = resultSet.getString("donor_session");
                int donationTimes = 0;

                donor.setDonorID(donorId);
                donor.setDonorName(donorName);
                donor.setBloodGroup(donorBloodGroup);
                donor.setDept(donorDept);
                donor.setSession(donorSession);
                donor.setTimeElapsed("Not at all");
                donor.setDonationTimes(donationTimes);

                availableDonorList.add(donor);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return availableDonorList;

    }

    public List<Donor> getUnavailableDonorInfo(String bloodGroup) throws ParseException {

        List<Donor> unavailableDonorList = new ArrayList<Donor>();

        if (bloodGroup.equals("ALL")) {

            sql = "select donor_table.donor_id,donor_name,donor_blood_group,donor_dept,donor_session,donor_phone1,"
                    + "donation_date from donation_table,donor_table where donor_table.donor_id="
                    + "donation_table.donor_id and donor_availability='yes' and donation_id in "
                    + "(select max(donation_id) from donation_table group by donation_table.donor_id)";
        } else {

            sql = "select donor_table.donor_id,donor_name,donor_blood_group,donor_dept,donor_session,donor_phone1,"
                    + "donation_date from donation_table,donor_table where donor_table.donor_id="
                    + "donation_table.donor_id and donor_availability='yes' and donation_id in"
                    + " (select max(donation_id) from donation_table group by donation_table.donor_id) and donor_blood_group=?";
        }

        try {

            preparedStatement = connection.prepareStatement(sql);
            if (!bloodGroup.equals("ALL")) {
                preparedStatement.setString(1, bloodGroup);
            }
            ResultSet resultSet = preparedStatement.executeQuery();

            DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            Date currentDate = new Date();
            Calendar currentCal = Calendar.getInstance();
            currentCal.setTime(currentDate);
            int currentYear = currentCal.get(Calendar.YEAR);
            int currentMonth = currentCal.get(Calendar.MONTH);
            int currentDay = currentCal.get(Calendar.DAY_OF_MONTH);

            int dayDiff, yearDiff, monthDiff;
            String donationTimeDiff;

            while (resultSet.next()) {

                Donor donor = new Donor();

                Date donationDate = dateFormat.parse(resultSet.getString("donation_date"));
                Calendar donationCal = Calendar.getInstance();
                donationCal.setTime(donationDate);
                int donationYear = donationCal.get(Calendar.YEAR);
                int donationMonth = donationCal.get(Calendar.MONTH);
                int donationDay = donationCal.get(Calendar.DAY_OF_MONTH);

                if (currentDay < donationDay) {
                    dayDiff = currentDay + 30 - donationDay;
                    donationMonth++;
                } else {
                    dayDiff = currentDay - donationDay;
                }

                if (currentMonth < donationMonth) {
                    monthDiff = currentMonth + 12 - donationMonth;
                    donationYear++;
                } else {
                    monthDiff = currentMonth - donationMonth;
                }
                yearDiff = currentYear - donationYear;

                if (yearDiff == 0 && monthDiff < 4) {
                    if (yearDiff > 0) {
                        donationTimeDiff = Integer.toString(yearDiff) + " year " + Integer.toString(monthDiff) + " month " + Integer.toString(dayDiff) + " days";
                    } else {
                        donationTimeDiff = Integer.toString(monthDiff) + " month " + Integer.toString(dayDiff) + " days";
                    }
                    //   System.out.println(donationTimeDiff);

                    int donorId = resultSet.getInt("donor_id");
                    String donorName = resultSet.getString("donor_name");
                    String donorPhone1 = resultSet.getString("donor_phone1");
                    String donorBloodGroup = resultSet.getString("donor_blood_group");
                    String donorDept = resultSet.getString("donor_dept");
                    String donorSession = resultSet.getString("donor_session");
                    int donationTimes = getDonationTimes(donorId);

                    donor.setDonorID(donorId);
                    donor.setDonorName(donorName);
                    donor.setBloodGroup(donorBloodGroup);
                    donor.setDept(donorDept);
                    donor.setSession(donorSession);
                    donor.setTimeElapsed(donationTimeDiff);
                    donor.setDonationTimes(donationTimes);
                    unavailableDonorList.add(donor);

                }

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return unavailableDonorList;

    }

    public List<Donor> getExDonorInfo(String bloodGroup) throws ParseException {

        List<Donor> exDonorList = new ArrayList<Donor>();

        if (bloodGroup.equals("ALL")) {

            sql = "select donor_table.donor_id,donor_name,donor_blood_group,donor_dept,donor_session,donor_phone1,"
                    + "donation_date from donation_table,donor_table where donor_table.donor_id="
                    + "donation_table.donor_id and donor_availability='no' and donation_id in "
                    + "(select max(donation_id) from donation_table group by donation_table.donor_id)";
        } else {

            sql = "select donor_table.donor_id,donor_name,donor_blood_group,donor_dept,donor_session,donor_phone1,"
                    + "donation_date from donation_table,donor_table where donor_table.donor_id="
                    + "donation_table.donor_id and donor_availability='no' and donation_id in"
                    + " (select max(donation_id) from donation_table group by donation_table.donor_id) and donor_blood_group=?";
        }

        try {

            preparedStatement = connection.prepareStatement(sql);
            if (!bloodGroup.equals("ALL")) {
                preparedStatement.setString(1, bloodGroup);
            }
            ResultSet resultSet = preparedStatement.executeQuery();

            DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            Date currentDate = new Date();
            Calendar currentCal = Calendar.getInstance();
            currentCal.setTime(currentDate);
            int currentYear = currentCal.get(Calendar.YEAR);
            int currentMonth = currentCal.get(Calendar.MONTH);
            int currentDay = currentCal.get(Calendar.DAY_OF_MONTH);

            int dayDiff, yearDiff, monthDiff;
            String donationTimeDiff;

            while (resultSet.next()) {

                Donor donor = new Donor();

                Date donationDate = dateFormat.parse(resultSet.getString("donation_date"));
                Calendar donationCal = Calendar.getInstance();
                donationCal.setTime(donationDate);
                int donationYear = donationCal.get(Calendar.YEAR);
                int donationMonth = donationCal.get(Calendar.MONTH);
                int donationDay = donationCal.get(Calendar.DAY_OF_MONTH);

                if (currentDay < donationDay) {
                    dayDiff = currentDay + 30 - donationDay;
                    donationMonth++;
                } else {
                    dayDiff = currentDay - donationDay;
                }

                if (currentMonth < donationMonth) {
                    monthDiff = currentMonth + 12 - donationMonth;
                    donationYear++;
                } else {
                    monthDiff = currentMonth - donationMonth;
                }
                yearDiff = currentYear - donationYear;

                if (yearDiff > 0) {
                    donationTimeDiff = Integer.toString(yearDiff) + " year " + Integer.toString(monthDiff) + " month " + Integer.toString(dayDiff) + " days";
                } else {
                    donationTimeDiff = Integer.toString(monthDiff) + " month " + Integer.toString(dayDiff) + " days";
                }
                //   System.out.println(donationTimeDiff);

                int donorId = resultSet.getInt("donor_id");
                String donorName = resultSet.getString("donor_name");
                String donorPhone1 = resultSet.getString("donor_phone1");
                String donorBloodGroup = resultSet.getString("donor_blood_group");
                String donorDept = resultSet.getString("donor_dept");
                String donorSession = resultSet.getString("donor_session");
                int donationTimes = getDonationTimes(donorId);

                donor.setDonorID(donorId);
                donor.setDonorName(donorName);
                donor.setBloodGroup(donorBloodGroup);
                donor.setDept(donorDept);
                donor.setSession(donorSession);
                donor.setTimeElapsed(donationTimeDiff);
                donor.setDonationTimes(donationTimes);

                exDonorList.add(donor);

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        // Another Part
        if (bloodGroup.equals("ALL")) {

            sql = "SELECT * FROM donor_table LEFT JOIN donation_table on"
                    + " donor_table.donor_id=donation_table.donor_id WHERE donation_id is null and donor_availability='no'";
        } else {

            sql = "SELECT * FROM donor_table LEFT JOIN donation_table on donor_table.donor_id="
                    + "donation_table.donor_id WHERE donation_id is null and donor_availability='no' and donor_blood_group=?";
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
                String donorName = resultSet.getString("donor_name");
                String donorPhone1 = resultSet.getString("donor_phone1");
                String donorBloodGroup = resultSet.getString("donor_blood_group");
                String donorDept = resultSet.getString("donor_dept");
                String donorSession = resultSet.getString("donor_session");
                int donationTimes = 0;

                donor.setDonorID(donorId);
                donor.setDonorName(donorName);
                donor.setBloodGroup(donorBloodGroup);
                donor.setDept(donorDept);
                donor.setSession(donorSession);
                donor.setTimeElapsed("Not at all");
                donor.setDonationTimes(donationTimes);

                exDonorList.add(donor);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return exDonorList;

    }

    public List<Donor> getAllDonorInfo(String bloodGroup) throws ParseException {

        List<Donor> allDonorList = new ArrayList<Donor>();

        if (bloodGroup.equals("ALL")) {

            sql = "select donor_table.donor_id,donor_name,donor_blood_group,donor_dept,donor_session,donor_phone1,"
                    + "donation_date from donation_table,donor_table where donor_table.donor_id="
                    + "donation_table.donor_id and donation_id in "
                    + "(select max(donation_id) from donation_table group by donation_table.donor_id)";
        } else {

            sql = "select donor_table.donor_id,donor_name,donor_blood_group,donor_dept,donor_session,donor_phone1,"
                    + "donation_date from donation_table,donor_table where donor_table.donor_id="
                    + "donation_table.donor_id and donation_id in "
                    + "(select max(donation_id) from donation_table group by donation_table.donor_id) and donor_blood_group=?";
        }

        try {

            preparedStatement = connection.prepareStatement(sql);
            if (!bloodGroup.equals("ALL")) {
                preparedStatement.setString(1, bloodGroup);
            }

            ResultSet resultSet = preparedStatement.executeQuery();

            DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
            Date currentDate = new Date();
            Calendar currentCal = Calendar.getInstance();
            currentCal.setTime(currentDate);
            int currentYear = currentCal.get(Calendar.YEAR);
            int currentMonth = currentCal.get(Calendar.MONTH);
            int currentDay = currentCal.get(Calendar.DAY_OF_MONTH);

            int dayDiff, yearDiff, monthDiff;
            String donationTimeDiff;

            while (resultSet.next()) {

                Donor donor = new Donor();

                Date donationDate = dateFormat.parse(resultSet.getString("donation_date"));
                Calendar donationCal = Calendar.getInstance();
                donationCal.setTime(donationDate);
                int donationYear = donationCal.get(Calendar.YEAR);
                int donationMonth = donationCal.get(Calendar.MONTH);
                int donationDay = donationCal.get(Calendar.DAY_OF_MONTH);

                if (currentDay < donationDay) {
                    dayDiff = currentDay + 30 - donationDay;
                    donationMonth++;
                } else {
                    dayDiff = currentDay - donationDay;
                }

                if (currentMonth < donationMonth) {
                    monthDiff = currentMonth + 12 - donationMonth;
                    donationYear++;
                } else {
                    monthDiff = currentMonth - donationMonth;
                }
                yearDiff = currentYear - donationYear;

                if (yearDiff > 0) {
                    donationTimeDiff = Integer.toString(yearDiff) + " year " + Integer.toString(monthDiff) + " month " + Integer.toString(dayDiff) + " days";
                } else {
                    donationTimeDiff = Integer.toString(monthDiff) + " month " + Integer.toString(dayDiff) + " days";
                }
                //   System.out.println(donationTimeDiff);

                int donorId = resultSet.getInt("donor_id");
                String donorName = resultSet.getString("donor_name");
                String donorPhone1 = resultSet.getString("donor_phone1");
                String donorBloodGroup = resultSet.getString("donor_blood_group");
                String donorDept = resultSet.getString("donor_dept");
                String donorSession = resultSet.getString("donor_session");
                int donationTimes = getDonationTimes(donorId);

                System.out.println(donorName);

                donor.setDonorID(donorId);
                donor.setDonorName(donorName);
                donor.setBloodGroup(donorBloodGroup);
                donor.setDept(donorDept);
                donor.setSession(donorSession);
                donor.setPhone1(donorPhone1);
                donor.setTimeElapsed(donationTimeDiff);
                donor.setDonationTimes(donationTimes);

                allDonorList.add(donor);

            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        //Another Section
        if (bloodGroup.equals("ALL")) {

            sql = "SELECT * FROM donor_table  LEFT JOIN donation_table on donor_table.donor_id=donation_table.donor_id WHERE donation_id is null";
        } else {

            sql = "SELECT * FROM donor_table  LEFT JOIN donation_table on donor_table.donor_id=donation_table.donor_id WHERE"
                    + " donation_id is null and donor_blood_group=?";
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
                String donorName = resultSet.getString("donor_name");
                String donorPhone1 = resultSet.getString("donor_phone1");
                String donorBloodGroup = resultSet.getString("donor_blood_group");
                String donorDept = resultSet.getString("donor_dept");
                String donorSession = resultSet.getString("donor_session");
                int donationTimes = 0;

                System.out.println(donorName);

                donor.setDonorID(donorId);
                donor.setDonorName(donorName);
                donor.setBloodGroup(donorBloodGroup);
                donor.setDept(donorDept);
                donor.setSession(donorSession);
                donor.setPhone1(donorPhone1);
                donor.setTimeElapsed("Not at all");
                donor.setDonationTimes(donationTimes);

                allDonorList.add(donor);
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return allDonorList;
    }

    public Donor getDonorPersonalInfo(int donorID) throws ParseException {
        Donor donor = new Donor();

        sql = "select donation_table.donor_id,donation_date,donor_name,donor_session,donor_blood_group,donor_dept,"
                + "donor_phone1,donor_phone2,donor_availability,donor_address from donation_table,donor_table where donation_table.donor_id=donor_table.donor_id"
                + " and donation_id=(select max(donation_id) from donation_table where donor_id=?)";

        DateFormat dateFormat = new SimpleDateFormat("dd-MM-yyyy");
        int donorBloodCount = 0;
        String donorName = null, donorBloodGroup = null, donorDept = null, donorSession = null, donorPhone1 = null, donorPhone2 = null, donorAddress = null, donorAvailability = null;
        Date donationDate = new Date();

        try {

            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, donorID);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {

                donorName = resultSet.getString("donor_name");
                donorBloodGroup = resultSet.getString("donor_blood_group");
                donorDept = resultSet.getString("donor_dept");
                donorSession = resultSet.getString("donor_session");
                donorPhone1 = resultSet.getString("donor_phone1");
                donorPhone2 = resultSet.getString("donor_phone2");
                donorAddress = resultSet.getString("donor_address");
                donorAvailability = resultSet.getString("donor_availability");
                donationDate = dateFormat.parse(resultSet.getString("donation_date"));
            }

            int donationTimes = getDonationTimes(donorID);

            // String donationDate = resultSet.getString("donation_date");
            Date currentDate = new Date();
            Calendar currentCal = Calendar.getInstance();
            currentCal.setTime(currentDate);
            int currentYear = currentCal.get(Calendar.YEAR);
            int currentMonth = currentCal.get(Calendar.MONTH);
            int currentDay = currentCal.get(Calendar.DAY_OF_MONTH);

            Calendar donationCal = Calendar.getInstance();
            donationCal.setTime(donationDate);
            int donationYear = donationCal.get(Calendar.YEAR);
            int donationMonth = donationCal.get(Calendar.MONTH);
            int donationDay = donationCal.get(Calendar.DAY_OF_MONTH);

            int dayDiff, yearDiff, monthDiff;
            String donationTimeDiff;

            if (currentDay < donationDay) {
                dayDiff = currentDay + 30 - donationDay;
                donationMonth++;
            } else {
                dayDiff = currentDay - donationDay;
            }

            if (currentMonth < donationMonth) {
                monthDiff = currentMonth + 12 - donationMonth;
                donationYear++;
            } else {
                monthDiff = currentMonth - donationMonth;
            }
            yearDiff = currentYear - donationYear;

            if (yearDiff > 0) {
                donationTimeDiff = Integer.toString(yearDiff) + " year " + Integer.toString(monthDiff) + " month " + Integer.toString(dayDiff) + " days";
            } else {
                donationTimeDiff = Integer.toString(monthDiff) + " month " + Integer.toString(dayDiff) + " days";
            }

            donor.setDonorID(donorID);
            donor.setDonorName(donorName);
            donor.setBloodGroup(donorBloodGroup);
            donor.setDept(donorDept);
            donor.setSession(donorSession);
            donor.setPhone1(donorPhone1);
            donor.setPhone2(donorPhone2);
            donor.setAddress(donorAddress);
            donor.setDonationTimes(donationTimes);
            donor.setTimeElapsed(donationTimeDiff);
            donor.setAvailability(donorAvailability);

//            jsonObject.addProperty("donorId", donorID);
//            jsonObject.addProperty("donorName", donorName);
//            jsonObject.addProperty("donorBloodGroup", donorBloodGroup);
//            jsonObject.addProperty("donorDept", donorDept);
//            jsonObject.addProperty("donorSession", donorSession);
//            jsonObject.addProperty("donorPhone1", donorPhone1);
//            jsonObject.addProperty("donorPhone2", donorPhone2);
//            jsonObject.addProperty("donorAddress", donorAddress);
//            jsonObject.addProperty("donorAvailability", donorAvailability);
//            jsonObject.addProperty("donorBloodCount", donorBloodCount);
//            jsonObject.addProperty("donationTimeDiff", donationTimeDiff);
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        
        //Another part

        sql = "SELECT * FROM `donor_table` WHERE donor_id=?";

        try {
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, donorID);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                donor.setDonorID(donorID);
                donor.setDonorName(resultSet.getString("donor_name"));
                donor.setBloodGroup(resultSet.getString("donor_blood_group"));
                donor.setDept(resultSet.getString("donor_dept"));
                donor.setSession(resultSet.getString("donor_session"));
                donor.setPhone1(resultSet.getString("donor_phone1"));
                donor.setPhone2(resultSet.getString("donor_phone2"));
                donor.setAddress(resultSet.getString("donor_address"));
                donor.setAvailability(resultSet.getString("donor_availability"));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return donor;
    }

//    public List<Donor> getPersonalHistory(int donorID) {
//        List<Donor> donorPersonalHistory = new ArrayList<Donor>();
//        return donorPersonalHistory;
//    }
    public Donor getDonorInfoEdit(int donorID) {
        Donor donor = new Donor();

        sql = "SELECT * FROM `donor_table` WHERE donor_id=?";

        try {
            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, donorID);

            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                donor.setDonorID(donorID);
                donor.setDonorName(resultSet.getString("donor_name"));
                donor.setBloodGroup(resultSet.getString("donor_blood_group"));
                donor.setDept(resultSet.getString("donor_dept"));
                donor.setSession(resultSet.getString("donor_session"));
                donor.setPhone1(resultSet.getString("donor_phone1"));
                donor.setPhone2(resultSet.getString("donor_phone2"));
                donor.setAddress(resultSet.getString("donor_address"));
                donor.setAvailability(resultSet.getString("donor_availability"));
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return donor;
    }

    public int getDonationTimes(int donorID) {
        sql = "select count(donation_id) from donation_table where donor_id=?";

        int donationTimes = 0;

        try {

            preparedStatement = connection.prepareStatement(sql);

            preparedStatement.setInt(1, donorID);

            ResultSet resultSet = preparedStatement.executeQuery();

            if (resultSet.next()) {
                donationTimes = resultSet.getInt("count(donation_id)");
            }

        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return donationTimes;
    }

    public String deleteDonor(int donorID) {
        sql = "DELETE FROM `donor_table` WHERE `donor_table`.`donor_id` = ?";
        String donationIDSQL = "SELECT donation_id FROM donation_table where donor_id=?";

        String result = "";

        DonationInfo donationInfo = new DonationInfo();

        try {

            preparedStatement = connection.prepareStatement(donationIDSQL);
            preparedStatement.setInt(1, donorID);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                int donationID = resultSet.getInt("donation_id");

                String res = donationInfo.deleteDonation(donationID);
                System.out.println(donationID + " delete successful");

            }

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setInt(1, donorID);

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

    public String editDonorInfo(int donorID, String donorName, String bloodGroup, String donorDept, String donorSession, String donorPhone1, String donorPhone2, String donorAddress, String donorAvailability) {
        String result = "";
        sql = "UPDATE `donor_table` SET `donor_name` = ?, `donor_blood_group` = ?, `donor_dept` = ?, `donor_session` = ?, "
                + "`donor_phone1` = ?, `donor_phone2` = ?, `donor_address` = ?, `donor_availability` =? WHERE `donor_table`.`donor_id` = ?";

        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, donorName);
            preparedStatement.setString(2, bloodGroup);
            preparedStatement.setString(3, donorDept);
            preparedStatement.setString(4, donorSession);
            preparedStatement.setString(5, donorPhone1);
            preparedStatement.setString(6, donorPhone2);
            preparedStatement.setString(7, donorAddress);
            preparedStatement.setString(8, donorAvailability);
            preparedStatement.setInt(9, donorID);

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

    public List<Donor> getAllGuestDonorList() {
        List<Donor> allGuestDonorList = new ArrayList<Donor>();
        sql = "select * from guest_donor_table";

        try {
            preparedStatement = connection.prepareStatement(sql);

            resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {

                Donor donor = new Donor();
                
                donor.setDonorName(resultSet.getString("guest_name"));
                donor.setBloodGroup(resultSet.getString("guest_blood_group"));
                donor.setDept(resultSet.getString("guest_dept"));
                donor.setSession(resultSet.getString("guest_session"));
                donor.setPhone1(resultSet.getString("guest_phone1"));
                donor.setPhone2(resultSet.getString("guest_phone2"));
                donor.setAddress(resultSet.getString("guest_address"));
              

                allGuestDonorList.add(donor);
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }

        return allGuestDonorList;

    }

}
