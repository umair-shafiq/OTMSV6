/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.otms.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author Umair Shafiq
 */
public class DataCalculateDAO {

    Connection con = null;

    public int totalManager() throws ClassNotFoundException, SQLException {
        con = db_connection.connect();
        int result = 0;
        String sql = "SELECT count(*) FROM otms.users where u_role='Manager'";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        rs.next();
        result = rs.getInt(1);
        return result;
    }

    public int totalEmployee() throws ClassNotFoundException, SQLException {
        con = db_connection.connect();
        int result = 0;
        String sql = "SELECT count(*) FROM otms.users where u_role='Employee'";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        rs.next();
        result = rs.getInt(1);
        return result;
    }

    public int totalTask() throws ClassNotFoundException, SQLException {
        con = db_connection.connect();
        int result = 0;
        String sql = "SELECT count(*) FROM otms.tasks";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        rs.next();
        result = rs.getInt(1);
        return result;
    }

    //Total Assigned Manager Task By ID
    public int totalAssignedTask(int id) throws ClassNotFoundException, SQLException {
        con = db_connection.connect();
        int result = 0;
        String sql = "SELECT count(*) FROM otms.tasks where man_id=" + id + "";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        rs.next();
        result = rs.getInt(1);
        return result;
    }

    //Total Assigned Employee Task By ID
    public int totalAssignedEmpTask(int id) throws ClassNotFoundException, SQLException {
        con = db_connection.connect();
        int result = 0;
        String sql = "SELECT count(*) FROM otms.tasks where emp_id=" + id + "";
        PreparedStatement pst = con.prepareStatement(sql);
        ResultSet rs = pst.executeQuery();
        rs.next();
        result = rs.getInt(1);
        return result;
    }

}
