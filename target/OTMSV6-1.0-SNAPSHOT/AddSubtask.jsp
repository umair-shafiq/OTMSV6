<%-- 
    Document   : AddSubtask
    Created on : Jan 18, 2023, 2:22:11 AM
    Author     : Umair Shafiq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add SubTask</title>
         <link rel="stylesheet" type="text/css" href="css/Admin.css">
    </head>
    <body>
        <%@include file="ManagerNav.jsp" %>
        <section id="content" class="main-content">
            <main>

                <div class="man-form">
                    <h4 class="man-title">Add Sub Task</h4>
                    <%
                                 int id = Integer.parseInt(request.getParameter("id"));
                                int uid = Integer.parseInt(request.getParameter("uid"));
                            %>
                    <form method="post" action="SubTaskServlet" id="subtaskform">
                        <p>Task ID#:</p>
                        <input type="text" required name="taskid" readonly="readonly" value="<%=id%>" class="input">
                        <p>Sub Task Name:</p>
                        <input type="text" required name="tname" class="input">
                        
                        <p>Description:</p>
                        <textarea rows="4" cols="50" name="Desc" form="subtaskform" placeholder="Enter text here..." class="input"></textarea>
                        <input type="text" required name="uid"  hidden="hidden" value="<%=uid%>">
                                    <input type="text" required name="status"  hidden="hidden" value="Pending" >
                        <button type="submit" >Save</button>
                    </form>
                </div>
            </main>
        </section>
    </body>
</html>
