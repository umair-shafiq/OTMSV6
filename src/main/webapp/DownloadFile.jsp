<%-- 
    Document   : DownloadFile
    Created on : Jan 18, 2023, 12:20:27 PM
    Author     : Umair Shafiq
--%>
<%@page import="com.otms.dao.TaskDAO"%>
<%@page import="com.otms.model.UploadFile"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Download File</title>
        <link rel="stylesheet" type="text/css" href="css/Admin.css">
        <link rel="stylesheet" type="text/css" href="css/TaskTable.css">
    </head>
    <body>
        <%@include file="ManagerNav.jsp" %>
        <section id="content" class="main-content">
            <main>
                <div class="tastTitle">
                    <h1>Download Files</h1>
                </div>

                <div class="taskDetailsTable">
                    <table>
                        <thead>
                            <tr style="text-align: left">
                                <th>File Name:</th>
                                <th>Remarks:</th>
                                <th>Download File</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%

                                int id = Integer.parseInt(request.getParameter("id"));
                                TaskDAO taskDAO = new TaskDAO();
                                List<UploadFile> files = taskDAO.Download(id);
                                for (UploadFile f : files) {

                            %>
                            <tr>

                                <td><%=f.getFileName()%> </td>

                                <td><%=f.getRemark()%></td>

                                <td>
                                    <a href="DownloadFileServlet?fileName=<%=f.getFileName()%>&id=<%=id%>" >Download File</a> 
                                    <c:if test="${not empty fail}">
                                        <p class="text-center text-danger fs-6">${fail}</p>
                                        <c:remove var="fail" scope="session"/>
                                    </c:if>
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
            <c:if test="${not empty fail}">
            swal("Error", "File not Found!", "error");
                <c:remove var="fail" scope="session"/>
            </c:if>
        </script>
    </body>
</html>
