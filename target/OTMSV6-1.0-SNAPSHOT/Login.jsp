<%-- 
    Document   : Login
    Created on : Jan 16, 2023, 5:31:34 PM
    Author     : Umair Shafiq
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Login</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" type="text/css" href="css/indexStyle.css">
    </head>
    <body>
        <div class="container">
            <div class="form-box">
                <i class="fa-solid fa-right-to-bracket icon-cog fa-4x "></i>
                <h1>Login</h1>
                <form method="post" action="<%=request.getContextPath()%>/LoginServlet">
                    <div class="input-group">
                        <div class="input-field">
                            <i class="fa-solid fa-envelope"></i>
                            <input type="email" name="email" placeholder="Email" required>
                        </div>
                        <div class="input-field">
                            <i class="fa-solid fa-lock"></i>
                            <input type="password" name="password" placeholder="Password" required>
                        </div>
                    </div>
                    <div class="btn-field">
                        <button type="submit">Login</button>
                        <a href="index.jsp"><button type="button">Back</button></a>
                    </div>
                </form>
            </div>
        </div>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            <c:if test="${not empty logout}">
            swal("logged Out", "You have logged out Successfully!", "success");
                <c:remove var="logout" scope="session"/>
            </c:if>

            <c:if test="${not empty errorMsg}">
            swal("Try Again!", "Invalid Email Or Password!", "error");
                <c:remove var="errorMsg" scope="session"/>
            </c:if>
        </script>
    </body>
</html>
