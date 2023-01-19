/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.otms.servlets;

import com.otms.dao.SubTaskDAO;
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
@WebServlet(name = "UpdateStatusServlet", urlPatterns = {"/UpdateStatusServlet"})
public class UpdateStatusServlet extends HttpServlet {

  

    
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
          HttpSession session = request.getSession();
        try{
          int sid = Integer.parseInt(request.getParameter("sid"));
       int taskid = Integer.parseInt(request.getParameter("id"));
          //String stat = request.getParameter("Complete");
          SubTaskDAO taskDao = new SubTaskDAO();
          taskDao.updateTaskStatus(sid);
          session.setAttribute("updateStatus", "Status Update Successfully!");
          response.sendRedirect("ViewSubTask.jsp?id=" + taskid);
        }catch(Exception e){
         e.getStackTrace();
        }
    }

    

}
