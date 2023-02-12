<%-- 
    Document   : EmployeeNotification
    Created on : Jan 18, 2023, 11:40:07 PM
    Author     : Umair Shafiq
--%>

<%@page import="com.otms.model.Notification"%>
<%@page import="java.util.List"%>
<%@page import="com.otms.dao.TaskDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Notifications</title>
        <link rel="stylesheet" type="text/css" href="css/Admin.css">
        <link rel="stylesheet" type="text/css" href="css/TaskTable.css">
    </head>
    <body>
        <%@include file="EmployeeNav.jsp" %>
        <section id="content" class="main-content">
            <main>
                <div class="tastTitle">
                    <h1>NOTIFICATIONS</h1>
                    <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        TaskDAO taskDAO = new TaskDAO();
                        List<Notification> noti = taskDAO.noti(id);
                        for (Notification nts : noti) {
                    %>
                    <div class="notice-container">
                        <!--<div class="notice-title">Title: </div>-->
                        <!--<div class="publish-date">Publish Date: </div>-->
                        <div class="notice">Notification:
                            <p><%=nts.getMsg()%></p>
                        </div>
                    </div>
                    <% }%>
                </div>
            </main>
        </section>
    </body>
</html>
