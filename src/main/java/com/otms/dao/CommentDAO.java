/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.otms.dao;

import com.otms.model.Comment;
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
public class CommentDAO {

    Connection con = null;

    public int AddComment(Comment c) throws ClassNotFoundException, SQLException {

        String INSERT_Comment_SQL = "INSERT INTO comment(task_id, task_name, emp_name, comment) VALUES (?, ?, ?, ?)";
        int result = 0;
        con = db_connection.connect();
        PreparedStatement pst = con.prepareStatement(INSERT_Comment_SQL);

        pst.setInt(1, c.getTaskId());
        pst.setString(2, c.getTaskName());
        pst.setString(3, c.getEmpName());
        pst.setString(4, c.getComment());

        result = pst.executeUpdate();
        return result;
    }

    //select all Comments
    public List<Comment> selectAllComment(int id) throws ClassNotFoundException {
        List<Comment> comments = new ArrayList<Comment>();
        Comment c = null;
        try ( Connection con = db_connection.connect()) {
            String SELECT_ALL_Comments = "Select * from comment where task_id=?";
            PreparedStatement preparedStatement = con.prepareStatement(SELECT_ALL_Comments);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                c = new Comment();
                c.setTaskId(rs.getInt(2));
                c.setTaskName(rs.getString(3));
                c.setEmpName(rs.getString(4));
                c.setComment(rs.getString(5));
                comments.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comments;
    }
    
    //Show Comments to user By TaskId
    public List<Comment> showComment(int id) throws ClassNotFoundException {
        List<Comment> comments = new ArrayList<Comment>();
        Comment c = null;
        try ( Connection con = db_connection.connect()) {
            String SELECT_ALL_Comments = "Select comment from comment where task_id=?";
            PreparedStatement preparedStatement = con.prepareStatement(SELECT_ALL_Comments);
            preparedStatement.setInt(1, id);
            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                c = new Comment();
                c.setTaskId(rs.getInt(2));
                
                c.setComment(rs.getString(5));
                comments.add(c);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return comments;
    }
}
