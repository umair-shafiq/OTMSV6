/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.otms.dao;

import com.otms.model.User;
import com.otms.servlets.AddManagerServlet;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import static java.util.Collections.list;
import java.util.List;

/**
 *
 * @author Umair Shafiq
 */
public class AddManagerDAO {

    Connection con = null;

    public int addManager(User user) throws ClassNotFoundException, SQLException {
        String INSERT_USERS_SQL = "INSERT INTO users" + "( u_name, u_email, u_dob, u_gender, u_password, u_address, u_phoneNumber, u_role) VALUES"
                + "( ?, ?, ?, ?, ?, ?, ?, 'Manager');";

        int result = 0;
        con = db_connection.connect();

        PreparedStatement pst = con.prepareStatement(INSERT_USERS_SQL);

        pst.setString(1, user.getName());
        pst.setString(2, user.getEmail());
        pst.setString(3, user.getDob());
        pst.setString(4, user.getGender());
        pst.setString(5, user.getPassword());
        pst.setString(6, user.getAddress());
        pst.setString(7, user.getContact());
        //pst.setString(8, user.getRole());

        result = pst.executeUpdate();
        return result;

    }

    //select all users
    public List<User> selectAllUsers() throws ClassNotFoundException {
        List<User> users = new ArrayList<User>();
        User u = null;
        try ( Connection con = db_connection.connect()) {
            String SELECT_ALL_USERS = "Select * from users Where u_role='Manager'";
            PreparedStatement preparedStatement = con.prepareStatement(SELECT_ALL_USERS);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                u = new User();
                u.setId(rs.getInt(1));
                u.setName(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setDob(rs.getString(4));
                u.setGender(rs.getString(5));
                u.setAddress(rs.getString(7));
                u.setContact(rs.getString(8));
                users.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }

    //Edit Manager by ID
    public User getManagerbyId(int id) throws ClassNotFoundException {
        User u = null;
        try ( Connection con = db_connection.connect()) {

            String sql = "select * from users where id=?";
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, id);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                u = new User();
                u.setId(rs.getInt(1));
                u.setName(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setDob(rs.getString(4));
                u.setGender(rs.getString(5));
                u.setPassword(rs.getString(6));
                u.setAddress(rs.getString(7));
                u.setContact(rs.getString(8));

            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return u;
    }

    //Update User
    public int updateManager(User user) throws ClassNotFoundException, SQLException {
        String UPDATE_USERS_SQL = "UPDATE users SET  u_name=?, u_email=?, u_dob=?, u_gender=?, u_password=?, u_address=?, u_phoneNumber=? WHERE id=?;";

        int result = 0;
        con = db_connection.connect();

        PreparedStatement pst = con.prepareStatement(UPDATE_USERS_SQL);

        pst.setString(1, user.getName());
        pst.setString(2, user.getEmail());
        pst.setString(3, user.getDob());
        pst.setString(4, user.getGender());
        pst.setString(5, user.getPassword());
        pst.setString(6, user.getAddress());
        pst.setString(7, user.getContact());
        pst.setInt(8, user.getId());

        result = pst.executeUpdate();
        return result;

    }

    //delete user
    public boolean deleteUser(int id) throws ClassNotFoundException {
        boolean rowDeleted = false;
        try ( Connection con = db_connection.connect()) {
            String DELETE_USERS_SQL = "delete from users where id=?;";
            PreparedStatement ps = con.prepareStatement(DELETE_USERS_SQL);
            ps.setInt(1, id);
            ps.executeUpdate();
            //rowDeleted = ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return rowDeleted;
    }

    //Fetch Employee
    public List<User> selectAllEmployee() throws ClassNotFoundException {
        List<User> users = new ArrayList<User>();
        User u = null;
        try ( Connection con = db_connection.connect()) {
            String SELECT_ALL_USERS = "Select * from users Where u_role='Manager'";
            PreparedStatement preparedStatement = con.prepareStatement(SELECT_ALL_USERS);

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
                u = new User();
                u.setId(rs.getInt(1));
                u.setName(rs.getString(2));
                u.setEmail(rs.getString(3));
                u.setDob(rs.getString(4));
                u.setGender(rs.getString(5));
                u.setAddress(rs.getString(7));
                u.setContact(rs.getString(8));
                users.add(u);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return users;
    }
    
        public int totalEmployee() throws SQLException{
        int result=0;
        PreparedStatement pst = con.prepareStatement("select count(*) from users where u_role='Employee'");
            ResultSet rs = pst.executeQuery();
            // Get the count
            rs.next();
            result = rs.getInt(1);
        return result;
    }

}
