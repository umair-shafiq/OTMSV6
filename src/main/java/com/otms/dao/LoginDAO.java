/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.otms.dao;

import com.otms.model.User;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

/**
 *
 * @author Umair Shafiq
 */
public class LoginDAO {

    public String authenticateUser(User user) throws ClassNotFoundException, SQLException {
        String email = user.getEmail();
        String password = user.getPassword();

        Connection con = null;
        Statement statement = null;
        ResultSet resultSet = null;

        String emailDB = "";
        String passwordDB = "";
        String role = "";

        con = db_connection.connect();
        statement = con.createStatement();
        resultSet = statement.executeQuery("select id, u_name, u_email,u_password,u_role from users");

        while (resultSet.next()) {
            user.setId(resultSet.getInt("id"));
            user.setName(resultSet.getString("u_name"));
            emailDB = resultSet.getString("u_email");
            passwordDB = resultSet.getString("u_password");
            role = resultSet.getString("u_role");

            if (email.equals(emailDB) && password.equals(passwordDB) && role.equals("Admin")) {
                return "Admin_Role";
            } else if (email.equals(emailDB) && password.equals(passwordDB) && role.equals("Manager")) {
                return "Manager_Role";
            } else if (email.equals(emailDB) && password.equals(passwordDB) && role.equals("Employee")) {
                return "Employee_Role";
            }
        }
        return "Invalid user credentials";
    }
}
