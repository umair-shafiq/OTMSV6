/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.otms.servlets;

import com.otms.dao.AddEmployeeDAO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "DeleteEmployeeServlet", urlPatterns = {"/DeleteEmployeeServlet"})
public class DeleteEmployeeServlet extends HttpServlet {

    private AddEmployeeDAO addEmployeeDAO = new AddEmployeeDAO();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        try {
            addEmployeeDAO.deleteUser(id);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DeleteManagerServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        HttpSession session = request.getSession();
        session.setAttribute("delMsg", "Employee Delete Sucessfully!");
        response.sendRedirect("showEmployeeDetails.jsp");
    }
}
