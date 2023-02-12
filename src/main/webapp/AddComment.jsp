<%-- 
    Document   : AddComment
    Created on : Jan 18, 2023, 1:38:55 AM
    Author     : Umair Shafiq
--%>

<%@page import="com.otms.model.Task"%>
<%@page import="com.otms.dao.TaskDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add Comment</title>
        <link rel="stylesheet" type="text/css" href="css/Admin.css">
    </head>
    <body>
        <%@include file="ManagerNav.jsp" %>
        <section id="content" class="main-content">
            <main>

                <div class="man-form">
                    <h4 class="man-title">Add Comments On Task</h4>
                    <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        TaskDAO taskDAO = new TaskDAO();
                        Task t = taskDAO.getTaskbyIdForComment(id);
                    %>
                    <form method="post" action="CommentServlet" id="commentform">
                        <p>Task ID#:</p>
                        <input type="text" required name="taskid" readonly="readonly" value="<%=t.getId()%>" class="input">
                        <p>Task Name:</p>
                        <input type="text" required name="tname" readonly="readonly" value="<%=t.getName()%>" class="input">
                        <p>Assigned Employee:</p>
                        <input type="text" required name="empname" readonly="readonly" value="<%=t.getAssignEmp()%>" class="input">
                        <p>Comment:</p>
                        <textarea rows="4" cols="50" name="comment" form="commentform" placeholder="Enter text here..." class="input"></textarea>
                        <button type="submit" >Save</button>
                    </form>
                </div>
            </main>
        </section>
    </body>
</html>
