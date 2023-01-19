/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.otms.model;

/**
 *
 * @author Umair Shafiq
 */

import java.util.Properties;

import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class NoticeboardNotification {
    public static void main(String[] args) {

        // Recipient's email ID needs to be mentioned.
        String to = "ma3315037@gmail.com";

        // Sender's email ID needs to be mentioned
        String from = "onlinetask811@gmail.com";

        // Assuming you are sending email from through gmails smtp
        String host = "smtp.gmail.com";

        // Get system properties
        Properties properties = System.getProperties();

        // Setup mail server
        properties.put("mail.smtp.host", host);
        properties.put("mail.smtp.port", "465");
        properties.put("mail.smtp.ssl.enable", "true");
        properties.put("mail.smtp.auth", "true");

        // Get the Session object.// and pass username and password
        Session session = Session.getInstance(properties, new javax.mail.Authenticator() {

            protected PasswordAuthentication getPasswordAuthentication() {

                return new PasswordAuthentication("ma3315037@gmail.com", "webrcvkiczozuffq");

            }

        });

        // Used to debug SMTP issues
        session.setDebug(true);

        try {
            // Create a default MimeMessage object.
            MimeMessage message = new MimeMessage(session);

            // Set From: header field of the header.
            message.setFrom(new InternetAddress(from));

            // Set To: header field of the header.
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));

            // Set Subject: header field
            message.setSubject("New Notice!");

            // Now set the actual message
            message.setText("Dear Members, \n"
                    + "\n"
                    + " I hope this email finds you well. I am writing to inform you that there is a new notice on the notice board that I believe may be of interest to you.\n"
                    + "\n"
                    + " This notice contains important information that you should be aware of, so please make sure to take a look at it when you have the chance.\n"
                    + "\n"
                    + " Thank you for your attention to this matter.\n"
                    + "\n"
                    + "Regards,\n"
                    
                    + "Online Task Management System"
            );

            System.out.println("sending...");
            // Send message
            Transport.send(message);
            System.out.println("Sent message successfully....");
        } catch (MessagingException mex) {
            mex.printStackTrace();
        }

    }
}
