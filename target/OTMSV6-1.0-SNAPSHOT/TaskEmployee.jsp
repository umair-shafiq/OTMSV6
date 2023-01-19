<%-- 
    Document   : TaskEmployee
    Created on : Jan 18, 2023, 7:44:09 PM
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
        <title>Tasks</title>
        <link rel="stylesheet" type="text/css" href="css/Admin.css">
        <link rel="stylesheet" type="text/css" href="css/TaskTable.css">
    </head>
    <body>
        <%@include file="EmployeeNav.jsp" %>
        <section id="content" class="main-content">
            <main>
                <h4 class="man-title">Tasks List</h4>
                <div class="manTable">
                    <table>
                        <thead>
                            <tr>
                                <th scope="col">#</th>
                                <th scope="col">Priority</th>
                                <th scope="col">Name</th>

                                <th scope="col">Start Date</th>
                                <th scope="col">End Date</th>
                                <th scope="col">Assigned By</th>
                                <th scope="col">Assigned Employee</th>
                                <th scope="col">Status</th>
                                <th scope="col">Action</th>
                            </tr>
                        </thead>

                        <tbody>

                            <%
                                User u = (User) session.getAttribute("Employee");

                                TaskDAO taskDAO = new TaskDAO();
                                List<Task> tasks = taskDAO.getAllTasksByEmpLogin(u.getId());
                                for (Task t : tasks) {
                            %>

                            <tr>
                                <td> <%= t.getId()%> </td>
                                <td class="text-center"> <%= t.getPriority()%></td>
                                <td><%= t.getName()%></td>

                                <td><%= t.getSdate()%></td>
                                <td class="text-danger"><%= t.getEdate()%></td>
                                <td><%= t.getAssignBy()%></td>
                                <td><%= t.getAssignEmp()%></td>
                                <td class="text-center"> <%= t.getStatus()%></td>
                                <td>
                                    <a href="EmployeeTaskDetails.jsp?id=<%= t.getId()%>"><button class="button-35" title="View Details"><i class="fa-solid fa-eye"></i></button></a>
                                    <a href="ViewSubTask.jsp?id=<%= t.getId()%>"><button class="button-35" title="View Sub tasks"><i class="fa-solid fa-diagram-next"></i></button></a>

                                </td>
                            </tr>
                            <% }%>
                        </tbody>
                    </table>
                </div>
            </main>
        </section>
    </body>
</html>
