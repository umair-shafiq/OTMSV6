/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.otms.servlets;

import com.otms.dao.AddEmployeeDAO;
import com.otms.dao.AddManagerDAO;
import com.otms.dao.db_connection;
import com.otms.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Umair Shafiq
 */
@WebServlet(name = "AddEmployeeServlet", urlPatterns = {"/AddEmployeeServlet"})
public class AddEmployeeServlet extends HttpServlet {

    private AddEmployeeDAO addEmployeeDAO = new AddEmployeeDAO();
    Connection con = null;
    ResultSet rs = null;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();

        try {
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String dob = request.getParameter("dob");
            String gender = request.getParameter("gender");
            String password = request.getParameter("password");
            String address = request.getParameter("address");
            String contact = request.getParameter("contact");
            //String role = request.getParameter("role");

            con = db_connection.connect();
            Statement st = con.createStatement();
            String sql = ("SELECT COUNT(*) FROM users where u_email='" + email + "'");

            rs = st.executeQuery(sql);
            rs.next();
            String Countrow = rs.getString(1);
            if (Countrow.equals("0")) {
                User user = new User();
                user.setName(name);
                user.setEmail(email);
                user.setDob(dob);
                user.setGender(gender);
                user.setPassword(password);
                user.setAddress(address);
                user.setContact(contact);
                // user.setRole(role);
                int result = addEmployeeDAO.addEmployee(user);

                session.setAttribute("sucMsg", "Registered Sucessfully!");
                response.sendRedirect("showEmployeeDetails.jsp");
            } else {
                session.setAttribute("errMsg", "Email Already Exists!");
                response.sendRedirect("AddEmployee.jsp");
            }

        } catch (Exception e) {
            e.getStackTrace();
        }

    }

}
