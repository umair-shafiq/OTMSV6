<%-- 
    Document   : ShowTaskDetails
    Created on : Jan 16, 2023, 10:04:07 AM
    Author     : Umair Shafiq
--%>

<%@page import="com.otms.model.Task"%>
<%@page import="java.util.List"%>
<%@page import="com.otms.dao.TaskDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task Details</title>
        <link rel="stylesheet" type="text/css" href="css/Admin.css">
    </head>
    <body>
        <%@include file="Adminnav.jsp" %>
        <section id="content" class="main-content">
            <main>
                <div class="taskDetails">
                    <div class="tastTitle">
                        <h1>Task Details</h1>
                    </div>

                    <div class="taskTable">
                        <table>
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>Name</th>
                                    <th>Description</th>
                                    <th>Start Date</th>
                                    <th>End Date</th>
                                    <th>Assigned By</th>
                                    <th>Assigned Employee</th>
                                    <th>Status</th>

                                </tr>
                            </thead>
                            <tbody>
                                <%                                    TaskDAO taskDAO = new TaskDAO();
                                    List<Task> tasks = taskDAO.selectAllTasks();
                                    for (Task t : tasks) {%>
                                <tr>
                                    <td> <%= t.getId()%> </td>
                                    <td><%= t.getName()%></td>
                                    <td><%= t.getDescription()%></td>
                                    <td><%= t.getSdate()%></td>
                                    <td><%= t.getEdate()%></td>
                                    <td><%= t.getAssignBy()%></td>
                                    <td><%= t.getAssignEmp()%></td>
                                    <td><%= t.getStatus()%></td>
                                </tr>

                                <% }%>  
                            </tbody>
                        </table>
                    </div>
                </div>
            </main>
        </section>
        <script>
            <%@include file="js/adminJavaScripit.js" %>
        </script>
    </body>
</html>
