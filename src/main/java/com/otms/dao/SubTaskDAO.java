/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.otms.dao;

import com.otms.model.SubTask;
import com.otms.model.Task;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Umair Shafiq
 */
public class SubTaskDAO {

    Connection con = null;

    //Adding Sub Task
    public int AddSubTask(SubTask t, int userid) throws ClassNotFoundException, SQLException {

        String INSERT_task_SQL = "INSERT INTO subtask(task_id, sub_name, sub_desc, sub_status, for_user) VALUES (?, ?, ?, ?, ? )";
        int result = 0;
        con = db_connection.connect();
        PreparedStatement pst = con.prepareStatement(INSERT_task_SQL);

        pst.setInt(1, t.getTaskId());
        pst.setString(2, t.getSubtaskName());
        pst.setString(3, t.getSubTaskDescription());
        pst.setString(4, t.getSubTaskStatus());
        pst.setInt(5, userid);
        result = pst.executeUpdate();
        return result;

    }

    //select all Sub task
    public List<SubTask> selectAllSubTask(int id) throws ClassNotFoundException {
        List<SubTask> subtask = new ArrayList<SubTask>();
        SubTask st = null;
        try (Connection con = db_connection.connect()) {
            String SELECT_ALL_Comments = "Select * from subtask where task_id=?";
            PreparedStatement preparedStatement = con.prepareStatement(SELECT_ALL_Comments);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                st = new SubTask();
                st.setId(rs.getInt(1));
                st.setTaskId(rs.getInt(2));
                st.setSubtaskName(rs.getString(3));
                st.setSubTaskDescription(rs.getString(4));
                st.setSubTaskStatus(rs.getString(5));
                subtask.add(st);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return subtask;
    }

    //Update SubTask Status
    public boolean updateTaskStatus(int id) throws ClassNotFoundException, SQLException {
        con = db_connection.connect();
        boolean f = false;
        try {
            String sql = "update subtask set sub_status='Complete' where id=?";
            PreparedStatement pst = con.prepareStatement(sql);

            pst.setInt(1, id);
            // pst.setInt(2, taskid);
            int i = pst.executeUpdate();
            if (i == 1) {
                f = true;
            }
        } catch (Exception e) {
            e.getStackTrace();
        }
        return f;
    }

    //select all Sub task by Id
    public List<SubTask> selectAllSubTaskByID(int id) throws ClassNotFoundException {
        List<SubTask> subtask = new ArrayList<SubTask>();
        SubTask st = null;
        try (Connection con = db_connection.connect()) {
            String sql = "Select * from subtask where task_id=?";
            PreparedStatement preparedStatement = con.prepareStatement(sql);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                st = new SubTask();
                st.setId(rs.getInt(1));
                subtask.add(st);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return subtask;
    }

    //Method for Count Rows
//    public int progressTest1() throws ClassNotFoundException, SQLException {
//        con = db_connection.connect();
//        int result = 0;
//        ResultSet rs = null;
//
//        Statement st = con.createStatement();
//        String sql = "Select COUNT(*) from subtask where task_id=18 and sub_status='Complete'";
//        rs = st.executeQuery(sql);
//        rs.next();
//        result = Integer.parseInt(rs.getString(1));
//
//        return result;
//    }
    //Method for Count Rows
//    public int progressTest2() throws ClassNotFoundException, SQLException {
//        con = db_connection.connect();
//        int result = 0;
//        ResultSet rs = null;
//
//        Statement st = con.createStatement();
//        String sql = "Select COUNT(*) from subtask where task_id=18";
//        rs = st.executeQuery(sql);
//        rs.next();
//        result = Integer.parseInt(rs.getString(1));
//
//        return result;
//    }
    //Count Total Task By Task ID
    public int totalTaskCount(int id) throws ClassNotFoundException, SQLException {
        con = db_connection.connect();
        int result = 0;

        String sql = "Select * from subtask where task_id=?";

        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, id);

        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            result++;
        }

        return result;
    }

    //Count Completed Task By Task ID
    public int CompleteTaskCount(int id) throws ClassNotFoundException, SQLException {
        con = db_connection.connect();
        int res = 0;

        String sql = "Select * from subtask where task_id=? and sub_status='Complete'";

        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, id);

        ResultSet rs = pst.executeQuery();

        while (rs.next()) {
            res++;
        }

        return res;
    }

    //Calculate Final Progress
    public Float progress(int id) throws ClassNotFoundException, SQLException {
        con = db_connection.connect();
        //int result =0;

        float CompleteTask = CompleteTaskCount(id);
        float TotalTask = totalTaskCount(id);
        float result = (CompleteTask / TotalTask) * 100f;

        return result;
    }

}
