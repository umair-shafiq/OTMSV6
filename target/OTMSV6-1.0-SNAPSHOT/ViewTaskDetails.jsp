<%-- 
    Document   : ViewTaskDetails
    Created on : Jan 18, 2023, 2:44:44 AM
    Author     : Umair Shafiq
--%>
<%@page import="com.otms.model.Feedback"%>
<%@page import="java.util.List"%>
<%@page import="com.otms.dao.FeedbackDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.otms.dao.SubTaskDAO"%>
<%@page import="com.otms.model.Task"%>
<%@page import="com.otms.dao.TaskDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
        <link rel="stylesheet" type="text/css" href="css/Admin.css">
        <link rel="stylesheet" type="text/css" href="css/TaskTable.css">
    </head>
    <body>
        <%@include file="ManagerNav.jsp" %>
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
                            <td><%=t.getId()%></td>
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
                            <th>Download Files:</th>
                            <td><a href="DownloadFile.jsp?id=<%=id%>"><button class="button-35" ><i class="fa-solid fa-download"></i><span style="margin-left: 5px"> Download</span></button></a></td>
                            <th></th>
                            <td></td>
                        </tr>

                    </table>

                </div>

                <h3 class="addDetailsTitle">See Additional Details (Feedback):</h3>
                <%

                    FeedbackDAO fbDAO = new FeedbackDAO();
                    List<Feedback> feedbacks = fbDAO.showFeedback(id);
                    for (Feedback fb : feedbacks) {
                %>
                <div class="taskDetailsTable">
                    <h5 >Title: <%=fb.getSubject()%> </h5>
                    <h6>Comment Date: <%=fb.getDate()%> </h6>
                    <p><%=fb.getFeedback()%></p>
                </div>
                <%}%>
            </main>
        </section>

    </body>
</html>
