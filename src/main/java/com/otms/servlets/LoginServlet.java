/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.otms.servlets;

import com.otms.dao.LoginDAO;
import com.otms.model.User;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "LoginServlet", urlPatterns = {"/LoginServlet"})
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        User login = new User();

        login.setEmail(email);
        login.setPassword(password);

        LoginDAO loginDAO = new LoginDAO();

        try {
            String userValidate = loginDAO.authenticateUser(login);
            if (userValidate.equals("Admin_Role")) {

                HttpSession session = request.getSession(); //Creating a session
                session.setAttribute("Admin", login); //setting session attribute
                //request.setAttribute("email", email);

                request.getRequestDispatcher("Admin.jsp").forward(request, response);
            } else if (userValidate.equals("Manager_Role")) {

                HttpSession session = request.getSession();
                session.setAttribute("Manager", login);
                //request.setAttribute("email", email);
                request.getRequestDispatcher("Manager.jsp").forward(request, response);
            } else if (userValidate.equals("Employee_Role")) {

                HttpSession session = request.getSession();
                session.setMaxInactiveInterval(10 * 60);
                session.setAttribute("Employee", login);
                //request.setAttribute("email", email);
                request.getRequestDispatcher("Employee.jsp").forward(request, response);
            } else {
                HttpSession session = request.getSession();
                session.setAttribute("errorMsg", "Invalid Email Or Password");
                request.getRequestDispatcher("Login.jsp").forward(request, response);
            }
        } catch (IOException e1) {
            e1.printStackTrace();
        } catch (Exception e2) {
            e2.printStackTrace();
        }
    }
}
