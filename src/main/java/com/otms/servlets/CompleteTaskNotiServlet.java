/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.otms.servlets;

import com.otms.dao.db_connection;
import com.otms.model.CompleteTaskNoti;
import com.otms.model.User;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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
@WebServlet(name = "CompleteTaskNotiServlet", urlPatterns = {"/CompleteTaskNotiServlet"})
public class CompleteTaskNotiServlet extends HttpServlet {

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
            String sql = "select id, task_id, sub_name from subtask where for_user="+userid+" and sub_status='Complete' and is_completed=0";
            PreparedStatement ps = con.prepareStatement(sql,
                    ResultSet.TYPE_SCROLL_SENSITIVE,
                    ResultSet.CONCUR_UPDATABLE);

            ResultSet rs1 = ps.executeQuery();
            int subid = 0;
            String subname = "";
            int taskid = 0;

            PreparedStatement pst = con.prepareStatement("select count(*) from subtask where for_user = "+userid+" and sub_status='Complete' and is_completed=0");
            ResultSet rs = pst.executeQuery();
            // Get the count
            rs.next();
            int count = rs.getInt(1);
            // Print the count
            System.out.println("Number of rows in table : " + count);
            
            if (count > 0 ) {
                while (rs1.next()) {
                    subid = rs1.getInt("id");
                    subname = rs1.getString("sub_name");
                    
                    taskid = rs1.getInt("task_id");

                    JSONObject row = new JSONObject();
                    row.put("id", rs1.getString(1));
                    row.put("label", rs1.getString(2));
                    arrayList.add(row);

                }
                jobject.put("data", arrayList);
                jobject.put("sucess", "1");
                try {

                    System.out.println("u" + subid);
                    System.out.println("m" + subname);
                    System.out.println("i" + taskid);
                    CompleteTaskNoti.main(subid, subname, taskid, userid);

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
