<%-- 
    Document   : AddTask
    Created on : Jan 18, 2023, 12:55:50 AM
    Author     : Umair Shafiq
--%>
<%@page import="com.otms.model.User"%>
<%@page import="java.util.List"%>
<%@page import="com.otms.dao.AddEmployeeDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add new Task</title>
        <link rel="stylesheet" type="text/css" href="css/Admin.css">
    </head>
    <body>
        <%@include file="ManagerNav.jsp" %>
        <section id="content" class="main-content">
            <main>

                <div class="man-form">
                    <h4 class="task-title">Add New Task</h4>

                    <form method="post" action="<%=request.getContextPath()%>/TaskServlet" id="addTask">
                        <p>Task Name:</p>
                        <input type="text" required name="name" placeholder="Task Name" class="input">
                        <p>Description:</p>
                        <textarea rows="4" cols="50" name="description" form="addTask" placeholder="Enter text here..." class="input"></textarea>
                        
                        <p>Start Date:</p>
                        <input type="date" required name="sdate" placeholder="Start Date" class="input">
                        <p>End Date:</p>
                        <input type="date" required name="edate" placeholder="End Date" class="input">
                        <p>Assigned By:</p>
                        <input type="text" required name="assignBy" value="<c:out value="${Manager.name}"/>" readonly  class="input">
                        <input required  name="man_id" type="hidden"  value="<c:out value="${Manager.id}"/>" >
                        <p>Assigning Employee:</p>
                        <select name="assignEmp" multiple>
                            <option>--Select--</option>
                                        <%
                                            AddEmployeeDAO addEmployeeDAO = new AddEmployeeDAO();
                                            List<User> users = addEmployeeDAO.selectAllUsers();
                                            for (User u : users) {%>
                                        <option value="<%=u.getId() %>"><%=u.getName()%></option>    <%--value="<%=u.getId()%>"--%>
                                        <% } %>
                        </select>
                        
                        <p>Status:</p>
                        <select name="status" id="status" >
                                        <option>Fresh</option>
                                        <option>On Hold</option>
                                        <option>Pending</option>
                                        <option>Close</option>
                                    </select>
                        <p>Set Priority:</p>
                        <select name="priority" id="priority" >
                                        <option>1</option>
                                        <option>2</option>
                                        <option>3</option>
                                        <option>4</option>
                                        <option>5</option>
                                    </select>
                        <button type="submit" >Add Task</button>
                    </form>
                </div>
            </main>
        </section>
    </body>
</html>
