/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.otms.servlets;

import com.otms.dao.FeedbackDAO;
import com.otms.model.Feedback;
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
@WebServlet(name = "FeedbackServlet", urlPatterns = {"/FeedbackServlet"})
public class FeedbackServlet extends HttpServlet {

    private FeedbackDAO fbDAO = new FeedbackDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        int taskId = Integer.parseInt(request.getParameter("taskid"));

        String subject = request.getParameter("subject");

        String feedback = request.getParameter("feedback");

        Feedback fb = new Feedback();
        fb.setTaskId(taskId);
        fb.setSubject(subject);
        fb.setFeedback(feedback);

        try {
            fbDAO.addFeedback(fb);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(FeedbackServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(FeedbackServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        session.setAttribute("feedback", "Feedback Add Sucessfully!");

        response.sendRedirect("EmployeeTaskDetails.jsp?id=" + taskId);
    }

}
