<%-- 
    Document   : Noticeboard
    Created on : Jan 17, 2023, 7:00:55 PM
    Author     : Umair Shafiq
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.otms.model.Noticeboard"%>
<%@page import="java.util.List"%>
<%@page import="com.otms.dao.NoticeboardDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Noticeboard</title>
        <link rel="stylesheet" type="text/css" href="css/Admin.css">
    </head>
    <body>
        <%@include file="ManagerNav.jsp" %>
        <section id="content" class="main-content">
            <main>
                <div >
                    <a href="AddNoticeboard.jsp" ><button type="button" class="button-24"><i class="fa-solid fa-plus fa-lg"></i> Add Notice</button></a>  
                </div>
                <h4 class="man-title">Noticeboard Details</h4>

                <div class="manTable">
                    <table>
                        <thead>
                            <tr>
                                <th>Title</th>
                                <th>Notice</th>
                                <th>Date</th>
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                NoticeboardDAO noticeboardDAO = new NoticeboardDAO();
                                List<Noticeboard> notices = noticeboardDAO.selectAllNotice();
                                 for (Noticeboard n : notices) {%>
                            <tr>
                                <td><%= n.getTitle()%></td>
                                <td><%= n.getNotice()%></td>
                                <td><%= n.getDate()%></td>

                                <td>
                                    <a href="EditNotice.jsp?id=<%=n.getId()%>"><button type="button" class="button1"><i class="fa-solid fa-pen-to-square "></i> Edit</button></a>
                                    <a href="DeleteNoticeServlet?id=<%=n.getId()%>"><button type="button" class="button2"><i class="fa-solid fa-trash"></i> Delete</button></a>
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
            
            <c:if test="${not empty sucMsg}">
            swal("Done!", "Add Notice Sucessfully!", "success");
                <c:remove var="sucMsg" scope="session"/>
            </c:if>
                
            <c:if test="${not empty EditSucMsg}">
            swal("Updated", "Notice update Sucessfuly!", "success");
                <c:remove var="EditSucMsg" scope="session"/>
            </c:if>
                
            <c:if test="${not empty delMsg}">
            swal("Done!", "Notice Delete Sucessfully!", "success");
                <c:remove var="delMsg" scope="session"/>
            </c:if>
        </script>
    </body>
</html>
