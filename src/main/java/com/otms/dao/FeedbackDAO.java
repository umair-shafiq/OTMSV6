/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.otms.dao;

import com.otms.model.Feedback;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Umair Shafiq
 */
public class FeedbackDAO {

    Connection con = null;

    public int addFeedback(Feedback fb) throws ClassNotFoundException, SQLException {
        String sql = "INSERT INTO feedback( task_id, subject, feedback) VALUES ( ?, ?, ?)";

        int result = 0;
        con = db_connection.connect();

        PreparedStatement pst = con.prepareStatement(sql);
        pst.setInt(1, fb.getTaskId());
        pst.setString(2, fb.getSubject());
        pst.setString(3, fb.getFeedback());
        result = pst.executeUpdate();
        return result;
    }

    //Show Feedback to user By TaskId
    public List<Feedback> showFeedback(int id) throws ClassNotFoundException {
        List<Feedback> comments = new ArrayList<Feedback>();
        Feedback fb = null;
        try (Connection con = db_connection.connect()) {
            String SELECT_ALL_Feedbacks = "Select * from feedback where task_id=?";
            PreparedStatement preparedStatement = con.prepareStatement(SELECT_ALL_Feedbacks);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                fb = new Feedback();
                fb.setTaskId(rs.getInt(2));

                fb.setSubject(rs.getString(3));
                fb.setFeedback(rs.getString(4));
                fb.setDate(rs.getTimestamp(5) + "");
                comments.add(fb);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comments;
    }
}
