/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package DAO;

import entity.Donor;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.Part;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

/**
 *
 * @author nowshad
 */
public class AddNewDonor {

    private DBConnection dbConnection;
    private Connection connection;

    private PreparedStatement preparedStatement;
    private String sql = "";
    private ResultSet resultSet;

    List<List> allList = new ArrayList<List>();

    public AddNewDonor() {
        dbConnection = new DBConnection();
        connection = dbConnection.getDbConnection();
    }

    public List<List> newDonorFromExcel(Part sourceFile) {

        List<Donor> newList = new ArrayList<Donor>();
        List<Donor> repetitiveList = new ArrayList<Donor>();
        List<Donor> problematicList = new ArrayList<Donor>();

        try {
            //   System.out.print("Hey, I'm reached!");

            InputStream fileInputStream = sourceFile.getInputStream();
            XSSFWorkbook xSSFWorkbook = new XSSFWorkbook(fileInputStream);
            XSSFSheet sheet1 = xSSFWorkbook.getSheetAt(0);
            //    data=sheet1.getRow(1).getCell(0).getStringCellValue();
//           System.out.println(sheet1.getRow(0).getCell(0).getStringCellValue());
            int rowCount = sheet1.getLastRowNum();
            //  String donorName = "", bloodGroup = "", dept = "", session = "", phone1 = "", phone2 = "", address = "";
            for (int i = 1; i <= rowCount; ++i) {

                Donor donor = new Donor();

                String donorName = "", bloodGroup = "", dept = "", session = "", phone1 = "", phone2 = "", address = "";

                if (sheet1.getRow(i).getCell(0) != null) {
                    donorName = sheet1.getRow(i).getCell(0).getStringCellValue();
                }

                if (sheet1.getRow(i).getCell(1) != null) {
                    bloodGroup = sheet1.getRow(i).getCell(1).getStringCellValue();
                }
                if (sheet1.getRow(i).getCell(2) != null) {
                    dept = sheet1.getRow(i).getCell(2).getStringCellValue();
                }
                if (sheet1.getRow(i).getCell(3) != null) {
                    session = sheet1.getRow(i).getCell(3).getStringCellValue();
                }

                if (sheet1.getRow(i).getCell(4) != null) {
                    phone1 = sheet1.getRow(i).getCell(4).getStringCellValue();
                }
                if (sheet1.getRow(i).getCell(5) != null) {
                    phone2 = sheet1.getRow(i).getCell(5).getStringCellValue();
                }
                if (sheet1.getRow(i).getCell(6) != null) {
                    address = sheet1.getRow(i).getCell(6).getStringCellValue();
                }

                donor.setDonorName(donorName);
                donor.setBloodGroup(bloodGroup);
                donor.setDept(dept);
                donor.setSession(session);
                donor.setPhone1(phone1);
                donor.setPhone2(phone2);
                donor.setAddress(address);

                System.out.println(donorName + " " + bloodGroup + " " + dept + " " + session + " " + phone1 + " " + phone2 + " " + address);

                if ((!donorName.equals("") && !bloodGroup.equals("") && !phone1.equals("")) && ((bloodGroup.equals("A+")) || (bloodGroup.equals("A-"))
                        || (bloodGroup.equals("B+")) || (bloodGroup.equals("B-")) || (bloodGroup.equals("AB+")) || (bloodGroup.equals("AB-"))
                        || (bloodGroup.equals("O+")) || (bloodGroup.equals("O-")))) {
                    System.out.println("Correct Format!");

                    if (!checkDonorIsPresent(phone1)) {
                        System.out.println("OK, this donor is new!");

                        int result = addNewSingleDonor(donorName, bloodGroup, dept, session, phone1, phone2, address);
                        if (result > 0) {
                            newList.add(donor);
                        } else if (result == 0) {
                            problematicList.add(donor);
                        }

                    } else {
                        System.out.println("Repitive Donor Info");
                        repetitiveList.add(donor);
                    }

                } else {
                    System.out.println("Not Correct Format!");
                    problematicList.add(donor);
                }

            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }

        allList.add(newList);
        allList.add(repetitiveList);
        allList.add(problematicList);

        return allList;
    }

    public List<List> newDonorManually(List<Donor> donorList) {

        List<Donor> newList = new ArrayList<Donor>();
        List<Donor> repetitiveList = new ArrayList<Donor>();
        List<Donor> problematicList = new ArrayList<Donor>();

        for (int i = 0; i < donorList.size(); ++i) {
            Donor donor = donorList.get(i);

            String donorName = "", bloodGroup = "", dept = "", session = "", phone1 = "", phone2 = "", address = "";

            if (donor.getDonorName() != null) {
                donorName = donor.getDonorName();
            }

            if (donor.getBloodGroup() != null) {
                bloodGroup = donor.getBloodGroup();
            }
            if (donor.getDept() != null) {
                dept = donor.getDept();
            }
            if (donor.getSession() != null) {
                session = donor.getSession();
            }

            if (donor.getPhone1() != null) {
                phone1 = donor.getPhone1();
            }
            if (donor.getPhone2() != null) {
                phone2 = donor.getPhone2();
            }
            if (donor.getAddress() != null) {
                address = donor.getAddress();
            }

            System.out.println(donorName + " " + bloodGroup + " " + dept + " " + session + " " + phone1 + " " + phone2 + " " + address);

            if ((!donorName.equals("") && !bloodGroup.equals("") && !phone1.equals("")) && ((bloodGroup.equals("A+")) || (bloodGroup.equals("A-"))
                    || (bloodGroup.equals("B+")) || (bloodGroup.equals("B-")) || (bloodGroup.equals("AB+")) || (bloodGroup.equals("AB-"))
                    || (bloodGroup.equals("O+")) || (bloodGroup.equals("O-")))) {

                System.out.println("Correct Format!");

                if (!checkDonorIsPresent(phone1)) {
                    System.out.println("OK, this donor is new!");

                    int result = addNewSingleDonor(donorName, bloodGroup, dept, session, phone1, phone2, address);
                    if (result > 0) {
                        newList.add(donor);
                    } else if (result == 0) {
                        problematicList.add(donor);
                    }

//                    newList.add(donor);
                } else {
                    System.out.println("Repitive Donor Info");
                    repetitiveList.add(donor);
                }

            } else {
                System.out.println("Not Correct Format!");
                problematicList.add(donor);
            }

        }
        allList.add(newList);
        allList.add(repetitiveList);
        allList.add(problematicList);

        return allList;
    }

    public boolean checkDonorIsPresent(String phoneNo) {
        sql = "SELECT donor_name from donor_table WHERE donor_phone1=? or donor_phone2=?";
        boolean donorPresence = false;

        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, phoneNo);
            preparedStatement.setString(2, phoneNo);
            resultSet = preparedStatement.executeQuery();
            if (resultSet.next()) {
                donorPresence = true;
            } else {
                donorPresence = false;
            }
        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return donorPresence;
    }

    public int addNewSingleDonor(String donorName, String bloodGroup, String donorDept, String donorSession, String donorPhone1, String donorPhone2, String donorAddress) {
        sql = "INSERT INTO `donor_table` (`donor_id`, `donor_name`, `donor_blood_group`, `donor_dept`, `donor_session`, `donor_phone1`, `donor_phone2`, `donor_address`, `donor_availability`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?,'yes')";

        int update = 0;
        try {
            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, donorName);
            preparedStatement.setString(2, bloodGroup);
            preparedStatement.setString(3, donorDept);
            preparedStatement.setString(4, donorSession);
            preparedStatement.setString(5, donorPhone1);
            preparedStatement.setString(6, donorPhone2);
            preparedStatement.setString(7, donorAddress);

            update = preparedStatement.executeUpdate();

        } catch (SQLException ex) {
            ex.printStackTrace();
        }
        return update;
    }

    public String addNewGuestDonor(String donorName, String bloodGroup, String donorDept, String donorSession, String donorPhone1, String donorPhone2, String donorAddress) {

        String result = "";
        int update1 = 0, update2 = 0;

       String sql = "INSERT INTO `guest_donor_table` (`guest_id`, `guest_name`, `guest_blood_group`, `guest_dept`, `guest_session`, `guest_phone1`, `guest_phone2`, `guest_address`, `guest_availability`) VALUES (NULL, ?, ?, ?, ?, ?, ?, ?,'yes')";

        try {
            update1 = addNewSingleDonor(donorName, bloodGroup, donorDept, donorSession, donorPhone1, donorPhone2, donorAddress);

            preparedStatement = connection.prepareStatement(sql);
            preparedStatement.setString(1, donorName);
            preparedStatement.setString(2, bloodGroup);
            preparedStatement.setString(3, donorDept);
            preparedStatement.setString(4, donorSession);
            preparedStatement.setString(5, donorPhone1);
            preparedStatement.setString(6, donorPhone2);
            preparedStatement.setString(7, donorAddress);

            update2 = preparedStatement.executeUpdate();
            
            System.out.println("update2: "+update2);
            if(update1>0 && update2>0)
            {
                result="successful";
            }
            else
            {
                result="unsuccessful";
            }

        } catch (Exception ex) {
            ex.printStackTrace();
        }
        
        return result;
    }
}
