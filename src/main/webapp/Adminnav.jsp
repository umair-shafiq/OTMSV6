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
        <title>Admin</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" type="text/css" href="css/Adminnav.css">
    </head>
    
    <%
  response.setHeader("Cache-Control","no-cache");
  response.setHeader("Cache-Control","no-store");
  response.setHeader("Pragma","no-cache");
  response.setDateHeader ("Expires", 0);

  if(session.getAttribute("Admin")==null)
      response.sendRedirect("Login.jsp");
%>

    <%-- For Session Validation--%>
    <c:if test="${empty Admin}">
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
                    <a href="Admin.jsp" class="btn active">
                        <i class="fa-sharp fa-solid fa-house-user bs"></i>
                        <span class="text">Home</span>
                    </a>
                </li>

                <li >
                    <a href="showMangerDetails.jsp" class="btn">
                        <i class="fa-sharp fa-solid fa-people-roof bs"></i>
                        <span class="text">Manager</span>
                    </a>
                </li>

                <li>
                    <a href="showEmployeeDetails.jsp" class="btn">
                        <i class="fa-solid fa-user bs"></i>
                        <span class="text">Employee</span>
                    </a>
                </li>

                <li>
                    <a href="ShowTaskDetails.jsp" class="btn">
                        <i class="fa-solid fa-list-check bs"></i>
                        <span class="text">Tasks</span>
                    </a>
                </li>
                
                <li>
                    <a href="ViewNoticeboardAdmin.jsp" class="btn">
                        <i class="fa-solid fa-sheet-plastic bs"></i>
                        <span class="text">Noticeboard</span>
                    </a>
                </li>

                <li>
                    <a href="<%=request.getContextPath()%>/AdminLogoutServlet" class="logout btn" >
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

                <!-- 	<a href="#" class="notification">
                                <span><i class="fa-solid fa-bell"></i></span>
                                <span class="num">8</span>
                                <div></div>
                        </a> -->
                <p class="AdminName">${Admin.name}</p>
                <div></div>

                <a href="#" class="profile">
                    <img src="assets/user.jpg">

                </a>

            </header>
            <!-- NAVBAR -->


        </section>
        <!-- CONTENT -->

        <!--<script src="js/adminJavaScripit.js"></script>-->
        <script defer src="js/activePage.js"></script>
    </body>
</html>
