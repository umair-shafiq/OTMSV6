/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.otms.servlets;

import com.otms.dao.CommentDAO;
import com.otms.model.Comment;
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
@WebServlet(name = "CommentServlet", urlPatterns = {"/CommentServlet"})
public class CommentServlet extends HttpServlet {

    private CommentDAO commentDAO = new CommentDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskId = Integer.parseInt(request.getParameter("taskid"));
        String tname = request.getParameter("tname");
        String empname = request.getParameter("empname");
        String comment = request.getParameter("comment");

        Comment c = new Comment();
        c.setTaskId(taskId);
        c.setTaskName(tname);
        c.setEmpName(empname);
        c.setComment(comment);

        try {
            commentDAO.AddComment(c);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(CommentServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(CommentServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        HttpSession session = request.getSession();
        session.setAttribute("sucMsg", "Comment Add Sucessfully!");
        response.sendRedirect("Comment.jsp?id=" + taskId);

    }

}
