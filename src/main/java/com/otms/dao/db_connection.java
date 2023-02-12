/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.otms.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author Umair Shafiq
 */
public class db_connection {

    private static Connection con;

    public static Connection connect() throws ClassNotFoundException, SQLException {
        String url = "jdbc:mysql://localhost:4306/otms?useSSL=false";
        String username = "root";
        String password = "umair123";
        //Connection con = null;

        Class.forName("com.mysql.jdbc.Driver");
        con = DriverManager.getConnection(url, username, password);
        return con;
    }

    public void close() throws SQLException {
        if (con != null) {
            con.close();
        }
    }
}
