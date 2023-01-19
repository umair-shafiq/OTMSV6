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
public class CompleteTaskNoti {
    public static void main(int subid, String subname, int taskid, int userid) throws AWTException {
        try {
            if (SystemTray.isSupported()) {
                CompleteTaskNoti td = new CompleteTaskNoti();
                td.displayTray( subid, subname, taskid, userid);

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

    public void displayTray(int subid, String subname,  int taskid, int userid) throws AWTException, ClassNotFoundException {
        //Obtain only one instance of the SystemTray object
        SystemTray tray = SystemTray.getSystemTray();
        System.out.println(subname);
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

        String displayMsg = subname + " " + "This SubTask Has Been Complete Succssfully!";
          System.out.println("1");
        trayIcon.displayMessage(subname, displayMsg, MessageType.INFO);
String subStatus="Pending";
        try {
            con = db_connection.connect();
            if (subStatus != "Complete") {

                String sql = ("update subtask set is_completed=1 where id="+subid+"");
                PreparedStatement ps = con.prepareStatement(sql);
               int res=ps.executeUpdate();
               System.out.println(res);
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
