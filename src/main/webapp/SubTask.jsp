<%-- 
    Document   : SubTask
    Created on : Jan 18, 2023, 2:09:19 AM
    Author     : Umair Shafiq
--%>

<%@page import="com.otms.model.SubTask"%>
<%@page import="java.util.List"%>
<%@page import="com.otms.dao.SubTaskDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Sub Task</title>
        <link rel="stylesheet" type="text/css" href="css/Admin.css">
    </head>
    <body>
        <%@include file="ManagerNav.jsp" %>
        <section id="content" class="main-content">
            <main>
                <%int id = Integer.parseInt(request.getParameter("id"));
                    int uid = Integer.parseInt(request.getParameter("uid"));
                %>
                <div >
                    <a href="AddSubtask.jsp?id=<%=id%>&uid=<%=uid%>" ><button type="button" class="button-24"><i class="fa-solid fa-plus fa-lg"></i> Add New SubTask</button></a>  
                </div>
                <h4 class="man-title">Sub task Details</h4>

                <div class="manTable">
                    <table>
                        <thead>
                            <tr>
                                <th>Task ID#</th>
                                <th>Sub Task Name</th>
                                <th>Description</th>
                                <th>Status</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%
                                //int id = Integer.parseInt(request.getParameter("id"));
                                SubTaskDAO subtaskDAO = new SubTaskDAO();
                                List<SubTask> subtask = subtaskDAO.selectAllSubTask(id);
                                for (SubTask st : subtask) {
                            %>
                            <tr>
                                <td><%=st.getTaskId()%></td>
                                <td><%=st.getSubtaskName()%></td>
                                <td><%=st.getSubTaskDescription()%></td>
                                <td><%=st.getSubTaskStatus()%></td>
                            </tr>
                            <% }%> 
                        </tbody>
                </div>

            </main>

        </section>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>       
        <script>
            <%--<%@include file="js/adminJavaScripit.js" %>--%>
            <c:if test="${not empty subMsg}">
            swal("Done!", "Sub Task Add Sucessfully!", "success");
                <c:remove var="subMsg" scope="session"/>
            </c:if>
        </script>
    </body>
</html>
