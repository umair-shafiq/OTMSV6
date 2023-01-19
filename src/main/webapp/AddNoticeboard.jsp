<%-- 
    Document   : AddNoticeboard
    Created on : Jan 17, 2023, 7:04:16 PM
    Author     : Umair Shafiq
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Notice</title>
        <link rel="stylesheet" type="text/css" href="css/Admin.css">
    </head>
    <body>
        <%@include file="ManagerNav.jsp" %>
        <section id="content" class="main-content">
            <main>

                <div class="man-form">
                    <h4 class="man-title">Add Notice</h4>
                    <c:if test="${not empty sucMsg}">
                        <p class="alert alert-success" role="alert">${sucMsg}</p>
                        <c:remove var="sucMsg" scope="session"/>
                    </c:if>
                    <form method="post" action="NoticeboardServlet" id="usrform">
                        <p>Title:</p>
                        <input type="text" required name="title" placeholder="Title" class="input">
                        <p>Notice:</p>
                        <textarea rows="4" cols="50" name="notice" form="usrform" placeholder="Enter text here..." class="input"></textarea>
                        <button type="submit" >Add Notice</button>
                    </form>
                </div>
            </main>
        </section>
    </body>
</html>
