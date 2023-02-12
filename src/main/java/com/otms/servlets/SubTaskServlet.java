/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.otms.servlets;

import com.otms.dao.SubTaskDAO;
import com.otms.model.SubTask;
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
@WebServlet(name = "SubTaskServlet", urlPatterns = {"/SubTaskServlet"})
public class SubTaskServlet extends HttpServlet {

    SubTaskDAO taskDao = new SubTaskDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {

            int taskid = Integer.parseInt(request.getParameter("taskid"));
            int userid = Integer.parseInt(request.getParameter("uid"));

            String subTaskName = request.getParameter("tname");
            String SubTaskDescription = request.getParameter("Desc");
            String SubTaskStatus = request.getParameter("status");
            SubTask st = new SubTask();
            st.setTaskId(taskid);
            st.setSubtaskName(subTaskName);
            st.setSubTaskDescription(SubTaskDescription);
            st.setSubTaskStatus(SubTaskStatus);
            System.out.println(taskid);
            System.out.println(userid);
            taskDao.AddSubTask(st, userid);

            session.setAttribute("subMsg", "Sub Task Add Sucessfully!");
            response.sendRedirect("SubTask.jsp?id=" + taskid + "&uid=" + userid);
        } catch (Exception e) {
            e.getStackTrace();
        }
    }

}
