/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.otms.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.otms.dao.TaskDAO;
import com.otms.model.SendMail;
import com.otms.model.Task;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpSession;

/**
 *
 * @author Umair Shafiq
 */
@WebServlet(name = "TaskServlet", urlPatterns = {"/TaskServlet"})
public class TaskServlet extends HttpServlet {

    private TaskDAO taskDAO = new TaskDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String sdate = request.getParameter("sdate");
        String edate = request.getParameter("edate");
        String assignBy = request.getParameter("assignBy");
        //String assignEmp = request.getParameter("assignEmp");
        String status = request.getParameter("status");
        String emp_id[] = request.getParameterValues("assignEmp");
        int man_id = Integer.parseInt(request.getParameter("man_id"));
        int priority = Integer.parseInt(request.getParameter("priority"));
        for (int i = 0; i < emp_id.length; i++) {
            Task t = new Task();
            t.setName(name);
            t.setDescription(description);
            t.setSdate(sdate);
            t.setEdate(edate);
            t.setAssignBy(assignBy);
            // t.setAssignEmp(assignEmp);
            t.setStatus(status);
            t.setEmp_id(Integer.parseInt(emp_id[i]));
            t.setMan_id(man_id);
            t.setPriority(priority);

            try {
                taskDAO.addTask(t);
                SendMail.main(new String[0]);
            } catch (ClassNotFoundException ex) {
                Logger.getLogger(TaskServlet.class.getName()).log(Level.SEVERE, null, ex);
            } catch (SQLException ex) {
                Logger.getLogger(TaskServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

        HttpSession session = request.getSession();
        session.setAttribute("sucMsg", "Add Task Sucessfully!");
        response.sendRedirect("Task.jsp");
    }

}
