<%-- 
    Document   : EditTask
    Created on : Jan 18, 2023, 1:53:58 AM
    Author     : Umair Shafiq
--%>

<%@page import="java.util.List"%>
<%@page import="com.otms.dao.AddEmployeeDAO"%>
<%@page import="com.otms.model.Task"%>
<%@page import="com.otms.dao.TaskDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Task</title>
        <link rel="stylesheet" type="text/css" href="css/Admin.css">
    </head>
    <body>
        <%@include file="ManagerNav.jsp" %>
        <section id="content" class="main-content">
            <main>

                <div class="man-form">
                    <h4 class="task-title">Edit Task</h4>
                    <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        TaskDAO taskDAO = new TaskDAO();
                        Task t = taskDAO.getTaskbyId(id);
                    %>
                    <form method="post" action="UpdateTaskServlet" id="addTask">
                        <p>Task Name:</p>
                        <input type="text" required name="name" placeholder="Task Name" class="input" value="<%=t.getName()%>">
                        <p>Description:</p>
                        <textarea rows="4" cols="50" name="description" form="addTask" placeholder="Enter text here..." class="input"><c:out value="<%=t.getDescription()%>"/></textarea>

                        <p>Start Date:</p>
                        <input type="date" required name="sdate" placeholder="Start Date" class="input" value="<%=t.getSdate()%>">
                        <p>End Date:</p>
                        <input type="date" required name="edate" placeholder="End Date" class="input" value="<%=t.getEdate()%>">
                        <p>Assigned By:</p>
                        <input type="text" required name="assignBy" value="<c:out value="${Manager.name}"/>" readonly  class="input">
                        <input required  name="man_id" type="hidden"  value="<c:out value="${Manager.id}"/>" >
                        <p>Assigning Employee:</p>
                        <select name="assignEmp" >
                            <option value="<%=t.getEmp_id()%>"><%=t.getAssignEmp()%></option>
                            <%
                                AddEmployeeDAO addEmployeeDAO = new AddEmployeeDAO();
                                List<User> users = addEmployeeDAO.selectAllUsers();
                                for (User u : users) {%>
                            <option value="<%=u.getId()%>"><%=u.getName()%></option>    <%--value="<%=u.getId()%>"--%>
                            <% }%>
                        </select>

                        <p>Status:</p>
                        <select name="status" id="status" >
                            <option value="<%=t.getStatus()%>"><%=t.getStatus()%></option>
                            <option >Fresh</option>
                            <option>On Hold</option>
                            <option>Complete</option>
                        </select>
                        <p>Set Priority:</p>
                        <select name="priority" id="priority" >
                            <option value="<%=t.getPriority()%>"><%=t.getPriority()%></option>
                            <option>1</option>
                            <option>2</option>
                            <option>3</option>
                            <option>4</option>
                            <option>5</option>
                        </select>
                        <input type="hidden" name="id" value="<%=t.getId()%>">
                        <button type="submit" >Update Task</button>
                    </form>
                </div>
            </main>
        </section>
    </body>
</html>

