/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.otms.model;

import com.otms.dao.db_connection;
import java.awt.*;
import java.awt.TrayIcon.MessageType;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

/**
 *
 * @author Umair Shafiq
 */
public class SendNotification {

    public static void main(String username, String taskname, String taskmsg, int taskid, int userid) throws AWTException {
        try {
            if (SystemTray.isSupported()) {
                SendNotification td = new SendNotification();
                td.displayTray(username, taskname, taskmsg, taskid, userid);

//            td.displayTray();
                System.out.println("is working");
            } else {
                System.err.println("System tray not supported!");
            }
        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        }

    }
    Connection con = null;
    ResultSet rs = null;

    public void displayTray(String name, String taskname, String taskmsg, int taskid, int userid) throws AWTException, ClassNotFoundException {
        //Obtain only one instance of the SystemTray object
        SystemTray tray = SystemTray.getSystemTray();
        System.out.println(name);
        //If the icon is a file
        Image image = Toolkit.getDefaultToolkit().createImage("icon.png");
        //Alternative (if the icon is on the classpath):
        //Image image = Toolkit.getDefaultToolkit().createImage(getClass().getResource("icon.png"));

        TrayIcon trayIcon = new TrayIcon(image, "Tray Demo");
        //Let the system resize the image if needed
        trayIcon.setImageAutoSize(true);
        //Set tooltip text for the tray icon
        trayIcon.setToolTip("System tray icon demo");
        tray.add(trayIcon);

        String displayMsg = taskname + " " + taskmsg;

        trayIcon.displayMessage(name, displayMsg, MessageType.INFO);

        try {
            con = db_connection.connect();
            if (taskid != 0) {

                String sql = ("UPDATE notification SET is_read=1,is_pending=1, is_read_on=NOW(),is_read_by="+userid+" WHERE task_id=" + taskid + "");
                PreparedStatement ps = con.prepareStatement(sql);
                ps.executeUpdate();
            }

        } catch (Exception e) {
            e.printStackTrace();
            System.out.println(e);
        } finally {
            try {
                con.close();
            } catch (Exception e2) {
                e2.printStackTrace();
                System.out.println(e2);
            }
        }

    }

}
