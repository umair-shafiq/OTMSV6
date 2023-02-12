<%-- 
    Document   : AddManager
    Created on : Jan 15, 2023, 7:27:38 PM
    Author     : Umair Shafiq
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Add manager</title>
        <link rel="stylesheet" type="text/css" href="css/Admin.css">
    </head>
    <body>
        <%@include file="Adminnav.jsp" %>
        <section id="content" class="main-content">
            <main>

                <div class="man-form">
                    <h4 class="man-title">Add Manager</h4>

                    <form method="post" action="AddManagerServlet">
                        <p>Full Name:</p>
                        <input type="text" required name="name" placeholder="Full Name" class="input">
                        <p>Email:</p>
                        <input type="email" required name="email" placeholder="Email" class="input">
                        <p>Date of Birth:</p>
                        <input type="date" required name="dob" placeholder="Date of Birth" class="input">
                        <p>Gender:</p>
                        <select name="gender">
                            <option value="">Select Gender</option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                        </select>
                        <p>Set Password:</p>
                        <input type="password" required name="password" placeholder="Set Password" class="input">
                        <p>Address:</p>
                        <input type="text" required name="address" placeholder="Adress" class="input">
                        <p>Phone Number:</p>
                        <input type="text" required name="contact" placeholder="Phone Number" class="input">
                        <button type="submit" >Register</button>
                    </form>
                </div>
            </main>
        </section>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script>
            <c:if test="${not empty errMsg}">
            swal("Try Again", "Email Already Exists!", "error");
                <c:remove var="errMsg" scope="session"/>
            </c:if>
        </script>
    </body>
</html>
