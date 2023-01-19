/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.otms.dao;

import com.otms.model.Noticeboard;
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
public class NoticeboardDAO {

    Connection con = null;

    public int addNotice(Noticeboard n) throws ClassNotFoundException, SQLException {
        String INSERT_NOTICE_SQL = "INSERT INTO noticeboard( title, notice) VALUES ( ?, ?)";

        int result = 0;
        con = db_connection.connect();

        PreparedStatement pst = con.prepareStatement(INSERT_NOTICE_SQL);

        pst.setString(1, n.getTitle());
        pst.setString(2, n.getNotice());
        result = pst.executeUpdate();
        return result;
    }

    //select all Notice
    public List<Noticeboard> selectAllNotice() throws ClassNotFoundException {
        List<Noticeboard> notices = new ArrayList<Noticeboard>();
        Noticeboard n = null;
        try ( Connection con = db_connection.connect()) {
            String SELECT_ALL_Notice = "Select * from noticeboard order by date desc";
            PreparedStatement preparedStatement = con.prepareStatement(SELECT_ALL_Notice);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                n = new Noticeboard();
                n.setId(rs.getInt(1));
                n.setTitle(rs.getString(2));
                n.setNotice(rs.getString(3));
                n.setDate(rs.getTimestamp(4) + "");
                notices.add(n);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return notices;
    }

    //Edit Notice by ID
    public Noticeboard getNoticebyId(int id) throws ClassNotFoundException {
        Noticeboard n = null;
        try ( Connection con = db_connection.connect()) {

            String sql = "select * from noticeboard where id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                n = new Noticeboard();
                n.setId(rs.getInt(1));
                n.setTitle(rs.getString(2));
                n.setNotice(rs.getString(3));
                n.setDate(rs.getTimestamp(4) + "");

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return n;
    }

    //Update Notice
    public int updateNotice(Noticeboard n) throws ClassNotFoundException, SQLException {
        String UPDATE_Notice_SQL = "UPDATE noticeboard SET  title=?, notice=? WHERE id=?;";

        int result = 0;
        con = db_connection.connect();

        PreparedStatement pst = con.prepareStatement(UPDATE_Notice_SQL);

        pst.setString(1, n.getTitle());
        pst.setString(2, n.getNotice());
        pst.setInt(3, n.getId());

        result = pst.executeUpdate();
        return result;

    }

    //delete Notice
    public boolean deleteNotice(int id) throws ClassNotFoundException {
        boolean rowDeleted = false;
        try ( Connection con = db_connection.connect()) {
            String DELETE_Notice_SQL = "delete from noticeboard where id=?;";
            PreparedStatement ps = con.prepareStatement(DELETE_Notice_SQL);
            ps.setInt(1, id);
            ps.executeUpdate();
            //rowDeleted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }
}
