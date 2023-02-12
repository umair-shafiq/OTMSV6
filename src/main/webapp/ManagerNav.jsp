<%-- 
    Document   : Adminnav
    Created on : Jan 15, 2023, 3:03:27 AM
    Author     : Umair Shafiq
--%>
<%@page import="com.otms.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>Manager</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <script src="https://code.jquery.com/jquery-3.6.3.min.js" integrity="sha256-pvPw+upLPUjgMXY0G+8O0xUf+/Im1MZjXxxgOcBQBXU=" crossorigin="anonymous"></script>
        <link rel="stylesheet" type="text/css" href="css/Adminnav.css">

    </head>

    <%-- For Session Validation--%>
    <c:if test="${empty Manager}">
        <c:redirect url="Login.jsp"></c:redirect>
    </c:if>

    <body>
        <input type="checkbox" id="sidebar-toggle">
        <section id="sidebar">
            <div class="sidebar-header">
                <h3 href="#" class="brand">

                    <span><i class="fa-solid fa-user-clock bs"></i></span>
                    <span class="text">OTMS</span>

                </h3>
                <label for="sidebar-toggle" class="ti-menu-alt"><i class="fa-solid fa-bars bar-clr fa-lg"></i></label>
            </div>

            <ul class="side-menu top" id="side-menu">
                <li >
                    <a href="Manager.jsp" class="btn active">
                        <i class="fa-sharp fa-solid fa-house-user bs"></i>
                        <span class="text">Home</span>
                    </a>
                </li>

                <li >
                    <a href="EmployeeDetails.jsp" class="btn">
                        <i class="fa-solid fa-user bs"></i>
                        <span class="text">Employee</span>
                    </a>
                </li>

                <li>
                    <a href="Task.jsp" class="btn">
                        <i class="fa-solid fa-list-check bs"></i>
                        <span class="text">Tasks</span>
                    </a>
                </li>

                <li>
                    <a href="Noticeboard.jsp" class="btn">
                        <i class="fa-solid fa-sheet-plastic bs"></i>
                        <span class="text">Noticeboard</span>
                    </a>
                </li>

                <li>
                    <a href="ManagerNotification.jsp?id=${Manager.id}" class="btn">
                        <i class="fa-solid fa-bell bs"></i>
                        <span class="text">Notification</span>
                    </a>
                </li>

                <li>
                    <a href="<%=request.getContextPath()%>/LogoutServlet" class="logout btn" >
                        <i class="fa-solid fa-right-from-bracket bs"></i>
                        <span class="text">Logout</span>
                    </a>
                </li>
            </ul>
        </section>

        <!-- CONTENT -->
        <section id="content" class="main-content">
            <!-- NAVBAR -->
            <header>

                <h2 href="#" class="nav-link">Online Task Management System</h2>

                <a href="ManagerNotification.jsp?id=${Manager.id}" class="notification">
                    <span><i class="fa-solid fa-bell"></i></span>
                    <span class="num" id="notiCountman">0</span>
                    <div></div>
                </a> 
                <p class="ManagerName"> ${Manager.name}</p>
                <div></div>

                <a href="#" class="profile">
                    <img src="assets/user.jpg">

                </a>

            </header>
            <!-- NAVBAR -->


        </section>
        <!-- CONTENT -->

        <!--<script src="js/adminJavaScripit.js"></script>-->
        <script >
            localStorage.setItem("manNoti", 0);
            function yourFunction() {
                //            alert("hey");
                var tempCheck = 0
                $.ajax({
                    url: "CompleteTaskNotiServlet",
                    method: "POST",
                    dataType: "json",
                    data: {id: "${Manager.id}"},
                    success: function (response)
                    {
                        var notifications = response.data
                        notificationCount = localStorage.getItem('manNoti');
                        if (notificationCount == 0 || notifications.length > notificationCount) {

                            localStorage.setItem("manNoti", notifications.length);
                            document.getElementById("notiCountman").innerHTML = notifications.length;
                            console.log(notifications.length);
                        }

                    }

                });
                setTimeout(yourFunction, 5000);
                // setInterval(yourFunction, 5000);

            }


            yourFunction();
        </script>
    </body>
</html>
