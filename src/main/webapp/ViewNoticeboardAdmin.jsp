<%-- 
    Document   : ViewNoticeboardAdmin
    Created on : Jan 19, 2023, 6:13:51 PM
    Author     : Umair Shafiq
--%>
<%@page import="com.otms.model.Noticeboard"%>
<%@page import="java.util.List"%>
<%@page import="com.otms.dao.NoticeboardDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Noticeboard</title>
        <link rel="stylesheet" type="text/css" href="css/Admin.css">
        <link rel="stylesheet" type="text/css" href="css/TaskTable.css">
    </head>
    <body>
        <%@include file="Adminnav.jsp" %>
        <section id="content" class="main-content">
            <main>
                <div class="tastTitle">
                    <h1>OTMS Noticeboard - News</h1>
                    <%                        NoticeboardDAO noticeboardDAO = new NoticeboardDAO();
                        List<Noticeboard> notices = noticeboardDAO.selectAllNotice();
                        for (Noticeboard n : notices) {
                    %>
                    <div class="notice-container">
                        <div class="notice-title">Title: <%= n.getTitle()%></div>
                        <div class="publish-date">Publish Date: <%= n.getDate()%></div>
                        <div class="notice">Notice:
                            <p><%= n.getNotice()%></p>
                        </div>
                    </div>
                    <% }%>
                </div>
            </main>
        </section>
    </body>
</html>


