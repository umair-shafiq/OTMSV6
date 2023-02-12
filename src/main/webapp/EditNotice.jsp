<%-- 
    Document   : EditNotice
    Created on : Jan 17, 2023, 7:26:45 PM
    Author     : Umair Shafiq
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.otms.model.Noticeboard"%>
<%@page import="com.otms.dao.NoticeboardDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Notice</title>
        <link rel="stylesheet" type="text/css" href="css/Admin.css">
    </head>
    <body>
        <%@include file="ManagerNav.jsp" %>
        <section id="content" class="main-content">
            <main>

                <div class="man-form">
                    <h4 class="man-title">Edit Notice</h4>
                    <c:if test="${not empty sucMsg}">
                        <p class="alert alert-success" role="alert">${sucMsg}</p>
                        <c:remove var="sucMsg" scope="session"/>
                    </c:if>

                    <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        NoticeboardDAO noticeboardDAO = new NoticeboardDAO();
                        Noticeboard n = noticeboardDAO.getNoticebyId(id);
                    %>

                    <form method="post" action="UpdateNoticeServlet" id="usrform">
                        <input type="hidden" name="id" value="<%=n.getId()%>">
                        <p>Title:</p>
                        <input type="text" required name="title" placeholder="Title" class="input" value="<%=n.getTitle()%>">
                        <p>Notice:</p>
                        <textarea rows="4" cols="50" name="notice" form="usrform" placeholder="Enter text here..." class="input"><c:out value="<%=n.getNotice()%>"/></textarea>
                        <button type="submit" >Update Notice</button>
                    </form>
                </div>
            </main>
        </section>
    </body>
</html>