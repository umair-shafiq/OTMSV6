/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.otms.servlets;

import com.otms.dao.AddEmployeeDAO;
import com.otms.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
@WebServlet(name = "UpdateEmployeeServlet", urlPatterns = {"/UpdateEmployeeServlet"})
public class UpdateEmployeeServlet extends HttpServlet {

    private AddEmployeeDAO addEmployeeDAO = new AddEmployeeDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String dob = request.getParameter("dob");
        String gender = request.getParameter("gender");
        String password = request.getParameter("password");
        String address = request.getParameter("address");
        String contact = request.getParameter("contact");
        int id = Integer.parseInt(request.getParameter("id"));

        User user = new User();
        user.setId(id);
        user.setName(name);
        user.setEmail(email);
        user.setDob(dob);
        user.setGender(gender);
        user.setPassword(password);
        user.setAddress(address);
        user.setContact(contact);
        // user.setRole(role);

        try {
            addEmployeeDAO.updateEmployee(user);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        HttpSession session = request.getSession();
        session.setAttribute("EditSucMsg", "Updated Sucessfully!");
        response.sendRedirect("showEmployeeDetails.jsp");

    }
}
