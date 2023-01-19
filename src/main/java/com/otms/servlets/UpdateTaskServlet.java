/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.otms.servlets;

import com.otms.dao.TaskDAO;
import com.otms.model.Task;
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
@WebServlet(name = "UpdateTaskServlet", urlPatterns = {"/UpdateTaskServlet"})
public class UpdateTaskServlet extends HttpServlet {

    private TaskDAO taskDAO = new TaskDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String name = request.getParameter("name");
        String description = request.getParameter("description");
        String sdate = request.getParameter("sdate");
        String edate = request.getParameter("edate");
        
        //String assignEmp = request.getParameter("assignEmp");
        String status = request.getParameter("status");
        int emp_id = Integer.parseInt(request.getParameter("assignEmp"));
        int priority = Integer.parseInt(request.getParameter("priority"));
        

        int id = Integer.parseInt(request.getParameter("id"));

        Task task = new Task();
        task.setId(id);
        task.setName(name);
        task.setDescription(description);
        task.setSdate(sdate);
        task.setEdate(edate);
       
        //task.setAssignEmp(assignEmp);
        task.setStatus(status);
        task.setEmp_id(emp_id);
        task.setPriority(priority);
        

        try {
            taskDAO.updateTask(task);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        HttpSession session = request.getSession();
        session.setAttribute("EditSucMsg", "Updated Sucessfully!");
        response.sendRedirect("Task.jsp");
    }
}
