<%-- 
    Document   : ViewSubTask
    Created on : Jan 18, 2023, 10:06:10 PM
    Author     : Umair Shafiq
--%>
<%@page import="java.util.List"%>
<%@page import="com.otms.model.SubTask"%>
<%@page import="com.otms.dao.SubTaskDAO"%>
<%@page import="com.otms.model.Task"%>
<%@page import="com.otms.dao.TaskDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>View Sub Task</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" type="text/css" href="css/Admin.css">
        <link rel="stylesheet" type="text/css" href="css/TaskTable.css">
    </head>
    <body>
        <%@include file="EmployeeNav.jsp" %>
        <section id="content" class="main-content">
            <main>
                <h4 class="man-title">Sub Task List</h4>
                <div class="manTable">
                    <table>
                        <thead>
                            <tr class="text-center">

                                <th scope="col">Task ID#</th>
                                <th scope="col">Sub Task Name</th>
                                <th scope="col" class="col-md-6">Description</th>
                                <th scope="col" >Status</th>
                                <th scope="col" >Action</th>
                            </tr>
                        </thead>
                        
                        <tbody>
                            <%
                                        int id = Integer.parseInt(request.getParameter("id"));
                                        TaskDAO taskDAO = new TaskDAO();
                                        Task t = taskDAO.getTaskbyId(id);
                                        SubTaskDAO subtaskDAO = new SubTaskDAO();
                                        List<SubTask> comments = subtaskDAO.selectAllSubTask(id);
                                        for (SubTask ts : comments) {
                                    %>
                                    <tr>

                                        <td><%=ts.getTaskId()%></td>
                                        <td><%=ts.getSubtaskName()%></td>
                                        <td><%=ts.getSubTaskDescription()%></td>
                                        <td><%=ts.getSubTaskStatus()%> </td>
                                        <td>
                                            <%
                                                if ("Pending".equals(ts.getSubTaskStatus())) {%>
                                                <a href="UpdateStatusServlet?sid=<%=ts.getId()%>&id=<%=t.getId()%>"  ><button class="button-35" ><i class="fa-solid fa-check"></i> Complete</button> </a>
                                            <% } else {%>
                                           <button  disabled> Completed</button>
                                            <% } %>

                                        </td>
                                    </tr>
                                    <%}%>
                        </tbody>
                    </table>
                </div>
            </main>
        </section>
                        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
                        <script>
                             <c:if test="${not empty updateStatus}">
            swal("Complete", "Status Update Successfully!", "success");
                <c:remove var="updateStatus" scope="session"/>
            </c:if>
                        </script>
    </body>
</html>
