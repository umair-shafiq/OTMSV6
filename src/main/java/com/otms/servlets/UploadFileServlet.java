/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.otms.servlets;

import com.otms.dao.TaskDAO;
import com.otms.model.UploadFile;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

/**
 *
 * @author Umair Shafiq
 */
@MultipartConfig
@WebServlet(name = "UploadFile", urlPatterns = {"/UploadFile"})

public class UploadFileServlet extends HttpServlet {

    private TaskDAO taskDao = new TaskDAO();

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int taskid = Integer.parseInt(request.getParameter("taskid"));
        Part p = request.getPart("files");
        String fileName = p.getSubmittedFileName();
        String remark = request.getParameter("remark");
        
        //System.out.println(fileName + "" + remark);

        UploadFile file = new UploadFile();
        file.setTaskID(taskid);
        file.setFileName(fileName);
        file.setRemark(remark);
        
          String uploadpath = "E:/Java/OTMSV6/src/main/webapp/UploadFile/" ;
//        
          File f = new File(uploadpath);
           p.write(uploadpath + File.separator + fileName);
           System.out.println(uploadpath);
        try {
            taskDao.uploadFile(file);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(UploadFileServlet.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(UploadFileServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        HttpSession session = request.getSession();
        session.setAttribute("sucMsg", "File Upload Sucessfully!");
        response.sendRedirect("EmployeeTaskDetails.jsp?id="+ taskid);
    }

}
