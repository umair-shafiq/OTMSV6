<%-- 
    Document   : EmployeeTaskDetails
    Created on : Jan 18, 2023, 8:03:07 PM
    Author     : Umair Shafiq
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.otms.model.Comment"%>
<%@page import="com.otms.dao.CommentDAO"%>
<%@page import="com.otms.dao.SubTaskDAO"%>
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
        <link rel="stylesheet" type="text/css" href="css/TaskTable.css">
    </head>
    <body>
        <%@include file="EmployeeNav.jsp" %>
        <section id="content" class="main-content">
            <main>
                <div class="tastTitle">
                    <h1>Tasks Details</h1>
                </div>
                <%
                    int id = Integer.parseInt(request.getParameter("id"));
                    TaskDAO taskDAO = new TaskDAO();
                    Task t = taskDAO.getTaskbyId(id);
                    SubTaskDAO subtaskDAO = new SubTaskDAO();
                %>

                <div class="taskDetailsTable">
                    <table>
                        <tr>
                            <th>Task ID:</th>
                            <td><%= t.getId()%></td>
                            <th>Start Date:</th>
                            <td><%=t.getSdate()%></td>
                        </tr>

                        <tr>
                            <th>Task Title:</th>
                            <td><%=t.getName()%></td>
                            <th>End Date:</th>
                            <td><%=t.getEdate()%></td>
                        </tr>

                        <tr>
                            <th>Assigned Employee:</th>
                            <td><%=t.getAssignEmp()%></td>
                            <th>Assigned By:</th>
                            <td><%=t.getAssignBy()%></td>
                        </tr>

                        <tr>
                            <th>Priority:</th>
                            <td><%=t.getPriority()%></td>

                            <th>Progress:</th>
                            <td>
                                <progress class="progress-bar "  id="file"  value="<%out.print(String.format("%.2f", subtaskDAO.progress(id)));%>"  max="100">  </progress>
                                    <% out.println("" + String.format("%.2f", subtaskDAO.progress(id)) + "%");%>
                            </td>
                        </tr>

                        <tr>
                            <th>Description:</th>
                            <td><textarea rows="4" cols="50" ><%=t.getDescription()%></textarea></td>
                            <th>Status:</th>
                            <td><%=t.getStatus()%></td>
                        </tr>

                        <tr>
                            <th>Upload Files:</th>
                            <td><a href="uploadfile.jsp?id=<%= t.getId()%>"><button class="button-35" ><i class="fa-solid fa-upload"></i><span style="margin-left: 5px"> Upload</span></button></a></td>
                            <th>Add Feedback:</th>
                            <td><a href="Feedback.jsp?id=<%= t.getId()%>"><button class="button-35" ><i class="fa-solid fa-comment"></i><span style="margin-left: 5px"> Feedback</span></button></a></td>
                        </tr>

                    </table>

                </div>

                <h3 class="addDetailsTitle">See Manager Comment (Feedback):</h3>

                <div class="taskDetailsTable">
                    <%

                        CommentDAO commentDAO = new CommentDAO();
                        List<Comment> comments = commentDAO.selectAllComment(id);
                        for (Comment c : comments) {
                    %>
                    <p>Comment:</p>
                    <p ><strong><%=c.getComment()%></strong></p>
                            <%}%>
                </div>

            </main>
        </section>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>

            <c:if test="${not empty sucMsg}">
            swal("Done!", "File Upload Sucessfully!", "success");
                <c:remove var="sucMsg" scope="session"/>
            </c:if>
            
            <c:if test="${not empty feedback}">
            swal("Done!", "Feedback Add Sucessfully!", "success");
                <c:remove var="feedback" scope="session"/>
            </c:if>
        </script>
    </body>
</html>

