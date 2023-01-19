<%-- 
    Document   : Task
    Created on : Jan 17, 2023, 7:34:28 PM
    Author     : Umair Shafiq
--%>
<%@page import="com.otms.model.DisplayCompleteTaskNoti"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.otms.dao.db_connection"%>
<%@page import="com.otms.dao.SubTaskDAO"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.otms.model.Task"%>
<%@page import="java.util.List"%>
<%@page import="com.otms.dao.TaskDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Task Page</title>
        <link rel="stylesheet" type="text/css" href="css/Admin.css">
        <link rel="styleSheet" type="text/css" href="css/TaskTable.css">
    </head>
    <body>
        <%@include file="ManagerNav.jsp" %>
        <section id="content" class="main-content">
            <main>
                <div >
                    <a href="AddTask.jsp" ><button type="button" class="button-24"><i class="fa-solid fa-plus fa-lg"></i> Add New Task</button></a>  
                </div>

                <div class="tastTitle">
                    <h1>Task List</h1>
                </div>

                <div class="showTable">
                    <table>
                        <thead>
                            <tr>
                                <th>#</th>
                                <th>Priority</th>
                                <th>Name</th>
                                <th>Start Date</th>
                                <th>End Date</th>
                                <th>Assigned By</th>
                                <th>Assigned Employee</th>
                                <th>Status</th>
                                <th>Action</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%
                                User u = (User) session.getAttribute("Manager");
                                TaskDAO taskDAO = new TaskDAO();
                                List<Task> tasks = taskDAO.selectAllTasksByMangerId(u.getId());
                                for (Task t : tasks) {%>
                            <tr>
                                <td> <%= t.getId()%> </td>
                                <td class="text-center"><%= t.getPriority()%></td>
                                <td><%= t.getName()%></td>

                                <td><%= t.getSdate()%></td>
                                <td class="text-danger"><%= t.getEdate()%></td>
                                <td><%= t.getAssignBy()%></td>
                                <td><%= t.getAssignEmp()%></td>

                                <td class="text-center">

                                    <%--if ("Complete".equals(t.getStatus()))--%>
                                    <%
                                        String msg = "This Task(" + t.getName() + ") Has Been Completed By " + t.getAssignEmp() + " Succeffully!";
                                        Connection con = null;
                                        int id = t.getId();
                                        SubTaskDAO subtaskDAO = new SubTaskDAO();
                                        if (subtaskDAO.progress(id) == 100.00) {
                                            // DisplayCompleteTaskNoti.main(msg, id);
                                            try {
                                                con = db_connection.connect();
                                                if (id != 0) {

                                                    String sql = ("UPDATE tasks SET t_status='Completed' WHERE id=" + id + "");
                                                    PreparedStatement ps = con.prepareStatement(sql);
                                                    ps.executeUpdate();
                                                }

                                                PreparedStatement pst = con.prepareStatement("select count(*) from notification where man = " + t.getMan_id() + " and task_id=" + id + " and is_completed=0");
                                                ResultSet rs = pst.executeQuery();
                                                // Get the count
                                                rs.next();
                                                int count = rs.getInt(1);
                                                //  out.println("ABABABABA = = " + count);
                                                // Print the count
                                                if (count > 0) {
                                                    DisplayCompleteTaskNoti.main(msg, id);
                                                }
                                            } catch (Exception e) {
                                                e.printStackTrace();
                                                System.out.println(e);
                                            }

                                    %>

                                    <div   class="btn btn-sm btn-outline-success"    >Complete</div>
                                    <%} else if ("On Hold".equals(t.getStatus())) {%>
                                    <div class="btn btn-sm btn-outline-info "> On Hold</div>
                                    <%} else if ("Fresh".equals(t.getStatus())) {%>
                                    <a href="#" class="btn btn-sm btn-outline-dark">Fresh</a>
                                    <%} else {%>
                                    <a href="#" class="btn btn-sm btn-outline-dark">In Progress</a>
                                    <%}%>
                                </td>
                                <td>
                                    <a href="ViewTaskDetails.jsp?id=<%=t.getId()%>"><button class="button-35" title="View Details"><i class="fa-solid fa-eye"></i></button></a>
                                    <a href="SubTask.jsp?id=<%=t.getId()%>&uid=<%= t.getMan_id()%>"><button class="button-35" title="Sub tasks"><i class="fa-solid fa-diagram-next"></i></button></a>
                                    <div class="dropdown">
                                        <button class="button-35" ><i class="fa-solid fa-caret-down"></i></button>
                                        <div class="dropdown-content">
                                            <a href="EditTask.jsp?id=<%=t.getId()%>">Edit</a>
                                            <a href="Comment.jsp?id=<%=t.getId()%>">Comment</a>
                                            <a href="DeleteTaskServlet?id=<%=t.getId()%>">Delete</a>
                                        </div>
                                    </div>

                                </td>
                            </tr>

                            <% }%>
                        </tbody>
                    </table>
                </div>

            </main>
        </section>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>       
        <script>
            <%--<%@include file="js/adminJavaScripit.js" %>--%>
            <c:if test="${not empty sucMsg}">
            swal("Congrats", "Add Task Sucessfully!", "success");
                <c:remove var="sucMsg" scope="session"/>
            </c:if>
            
            <c:if test="${not empty EditSucMsg}">
            swal("Updated", "Task Data update Sucessfuly!", "success");
                <c:remove var="EditSucMsg" scope="session"/>
            </c:if>
                
            <c:if test="${not empty delMsg}">
            swal("Done!", "Task Delete Sucessfully!", "success");
                <c:remove var="delMsg" scope="session"/>
            </c:if>
        </script>
    </body>
</html>
