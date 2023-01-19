/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.otms.servlets;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.OutputStream;
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
@WebServlet(name = "DownloadFileServlet", urlPatterns = {"/DownloadFileServlet"})
public class DownloadFileServlet extends HttpServlet {

    public int BUFFER_SIZE = 1024 * 1000;

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fileName = request.getParameter("fileName");
        int taskid = Integer.parseInt(request.getParameter("id"));
        String path = "E:/Java/OTMSV6/src/main/webapp/UploadFile/" + File.separator + fileName;
        System.out.println(path);

        File file = new File(path);
        OutputStream os = null;
        FileInputStream fis = null;

        response.setHeader("Content-Disposition", String.format("attachment;filename=\"%s\"", file.getName()));
        response.setContentType("application/octet-stream");
        try {
            if (file.exists()) {
                os = response.getOutputStream();
                fis = new FileInputStream(file);

                byte[] bf = new byte[BUFFER_SIZE];
                int byteRead = -1;
                while ((byteRead = fis.read(bf)) != -1) {
                    os.write(bf, 0, byteRead);
                }

            } else {
                HttpSession session = request.getSession();
                session.setAttribute("fail", "File not Found!");
                response.sendRedirect("DownloadFile.jsp?id=" + taskid);
            }
        } catch (Exception e) {
            e.printStackTrace();
        } 
        
        finally {
            if (fis != null) {

                fis.close();
            }

            os.flush();
            if (os != null) {

                os.close();
            }
        }

    }

}
