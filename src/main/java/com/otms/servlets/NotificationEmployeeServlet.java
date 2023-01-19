/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.otms.servlets;

import com.otms.dao.TaskDAO;
import com.otms.dao.db_connection;

import com.otms.model.Notification;
import com.otms.model.SendMail;
import com.otms.model.SendNotification;
import com.otms.model.User;
import java.awt.AWTException;
import java.awt.Image;
import java.awt.SystemTray;
import java.awt.Toolkit;
import java.awt.TrayIcon;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.JSONArray;
import org.json.JSONObject;

/**
 *
 * @author Umair Shafiq
 */
@WebServlet(name = "NotificationEmployeeServlet", urlPatterns = {"/NotificationEmployeeServlet"})
public class NotificationEmployeeServlet extends HttpServlet {

    Connection con = null;
    ResultSet rs = null;
    User user = new User();

    protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userid = Integer.parseInt(request.getParameter("id"));

        PrintWriter out = response.getWriter();
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");
        JSONArray notificationList = new JSONArray();
        JSONObject jobject = new JSONObject();
        try {

            ArrayList arrayList = new ArrayList();
            con = db_connection.connect();
            // Statement st1 = con.createStatement();
            String sql = "SELECT ns.id, ns.task_id, ns.message,(SELECT ts.t_name FROM tasks as ts where ts.id=ns.task_id ) as task,(SELECT us.u_name FROM users as us where us.id=ns.for_user) as dispaly_name FROM notification ns where  ns.for_user = " + userid + " and ns.is_read=0 and  ns.is_pending=0 and ns.is_completed=0 order by ns.id desc LIMIT 5;";
            PreparedStatement ps = con.prepareStatement(sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);

            ResultSet rs1 = ps.executeQuery();
            String username = "";
            String taskmsg = "";
            String taskname = "";
            int taskid = 0;

            PreparedStatement pst = con.prepareStatement("select count(*) from notification where for_user = " + userid + " and is_read=0 and  is_pending=0 and is_completed=0");
            ResultSet rs = pst.executeQuery();
            // Get the count
            rs.next();
            int count = rs.getInt(1);
            // Print the count
            System.out.println("Number of rows in table : " + count);
            if (count > 0) {
                while (rs1.next()) {
                    username = rs1.getString("dispaly_name");
                    taskname = rs1.getString("task");
                    taskmsg = rs1.getString("message");
                    taskid = rs1.getInt("task_id");

                    JSONObject row = new JSONObject();
                    row.put("id", rs1.getString(1));
                    row.put("label", rs1.getString(2));
                    arrayList.add(row);

                }
                jobject.put("data", arrayList);
                jobject.put("sucess", "1");
                try {

                    System.out.println("u" + username);
                    System.out.println("m" + taskmsg);
                    System.out.println("i" + taskid);
                    SendNotification.main(username, taskname, taskmsg, taskid, userid);

                } catch (Exception ex) {
                    System.out.println(ex);
                }
            }

        } catch (ClassNotFoundException ex) {
            Logger.getLogger(NotificationEmployeeServlet.class.getName()).log(Level.SEVERE, null, ex);
            jobject.put("error_message", ex.getMessage());
            jobject.put("sucess", "0");
        } catch (SQLException ex) {
            Logger.getLogger(NotificationEmployeeServlet.class.getName()).log(Level.SEVERE, null, ex);
            jobject.put("error_message", ex.getMessage());
            jobject.put("sucess", "0");
        } finally {
            try {

                con.close();
            } catch (Exception e2) {
                // TODO: handle exception
                e2.printStackTrace();
            }
        }

        out.flush();
        out.print(jobject);

    }

}
