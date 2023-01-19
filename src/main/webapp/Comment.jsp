<%-- 
    Document   : Comment
    Created on : Jan 18, 2023, 1:29:28 AM
    Author     : Umair Shafiq
--%>
<%@page import="com.otms.model.Comment"%>
<%@page import="java.util.List"%>
<%@page import="com.otms.dao.CommentDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Comment</title>
        <link rel="stylesheet" type="text/css" href="css/Admin.css">
    </head>
    <body>
        <%@include file="ManagerNav.jsp" %>
        <section id="content" class="main-content">
            <main>
                <%int id = Integer.parseInt(request.getParameter("id"));%>
                <div >
                    <a href="AddComment.jsp?id=<%=id%>" ><button type="button" class="button-24"><i class="fa-solid fa-plus fa-lg"></i> Add New Comment</button></a>  
                </div>
                <h4 class="man-title">Comments Details</h4>

                <div class="manTable">
                    <table>
                        <thead>
                            <tr>
                                <th>Task ID#</th>
                                <th>Task Name</th>
                                <th>Employee Name</th>
                                <th>Comment</th>

                            </tr>
                        </thead>
                        <tbody>
                            <%

                                CommentDAO commentDAO = new CommentDAO();
                                List<Comment> comments = commentDAO.selectAllComment(id);
                                for (Comment c : comments) {
                            %>
                            <tr>
                                <td><%=c.getTaskId()%></td>
                                <td><%=c.getTaskName()%></td>
                                <td><%=c.getEmpName()%></td>
                                <td><%=c.getComment()%></td>
                            </tr>
                            <% }%> 
                        </tbody>
                    </table>
                </div>
            </main>
        </section>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>

            <c:if test="${not empty sucMsg}">
            swal("Done!", "Comment Add Sucessfully!", "success");
                <c:remove var="sucMsg" scope="session"/>
            </c:if>
        </script>
    </body>
</html>
