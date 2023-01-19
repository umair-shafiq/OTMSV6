<%-- 
    Document   : uploadfile
    Created on : Jan 18, 2023, 10:51:10 PM
    Author     : Umair Shafiq
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Upload File</title>
        <link rel="stylesheet" type="text/css" href="css/Admin.css">
    </head>
    <body>
        <%@include file="EmployeeNav.jsp" %>
        <section id="content" class="main-content">
            <main>

                <div class="man-form">
                    <h4 class="man-title">Upload File</h4>
                    <%
                        int id = Integer.parseInt(request.getParameter("id"));
                    %>
                    <form method="post" action="UploadFile" enctype="multipart/form-data">
                        <input type="hidden" name="taskid" value="<%=id%>" >
                        <p>Upload File:</p>
                        <input type="file" required name="files" placeholder="Upload FIle" class="input">
                        <p>Remark:</p>
                        <input type="text" name="remark" required class="input"> 
                        <button type="submit" ><i class="fa-solid fa-upload"></i> Upload!</button>
                    </form>
                </div>
            </main>
        </section>
    </body>
</html>
