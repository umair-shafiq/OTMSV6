<%-- 
    Document   : Feedback
    Created on : Jan 18, 2023, 10:42:34 PM
    Author     : Umair Shafiq
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Feedback</title>
        <link rel="stylesheet" type="text/css" href="css/Admin.css">
    </head>
    <body>
        <%@include file="EmployeeNav.jsp" %>
        <section id="content" class="main-content">
            <main>

                <div class="man-form">
                    <h4 class="man-title">Add Detail On Task</h4>
                    <%
                        int id = Integer.parseInt(request.getParameter("id"));
                    %>
                    <form method="post" action="FeedbackServlet" id="feedbackform">
                        <input type="hidden" name="taskid"   value="<%=id%>">
                        <p>Feedback Subject:</p>
                        <input type="text" required name="subject" placeholder="Subject" class="input">
                        <p>Add Detail / Feedback:</p>
                        <textarea rows="4" cols="50" name="feedback" form="feedbackform" placeholder="Enter text here..." class="input"></textarea>
                        <button type="submit" >Save!</button>
                    </form>
                </div>
            </main>
        </section>
    </body>
</html>
