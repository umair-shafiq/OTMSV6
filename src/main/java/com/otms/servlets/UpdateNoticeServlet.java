/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.otms.servlets;

import com.otms.dao.NoticeboardDAO;
import com.otms.model.Noticeboard;
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
@WebServlet(name = "UpdateNoticeServlet", urlPatterns = {"/UpdateNoticeServlet"})
public class UpdateNoticeServlet extends HttpServlet {

    private NoticeboardDAO noticeboardDAO = new NoticeboardDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String title = request.getParameter("title");
        String notice = request.getParameter("notice");

        Noticeboard n = new Noticeboard();
        n.setId(id);
        n.setTitle(title);
        n.setNotice(notice);

        try {
            noticeboardDAO.updateNotice(n);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UserServlet.class.getName()).log(Level.SEVERE, null, ex);
        }

        HttpSession session = request.getSession();
        session.setAttribute("EditSucMsg", "Updated Sucessfully!");
        response.sendRedirect("Noticeboard.jsp");

    }
}
