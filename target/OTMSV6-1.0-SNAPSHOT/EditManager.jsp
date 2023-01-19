<%-- 
    Document   : EditManager
    Created on : Jan 16, 2023, 7:36:06 PM
    Author     : Umair Shafiq
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="com.otms.model.User"%>
<%@page import="com.otms.dao.AddManagerDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Manager</title>
        <link rel="stylesheet" type="text/css" href="css/Admin.css">
    </head>
    <body>
        <%@include file="Adminnav.jsp" %>
        <section id="content" class="main-content">
            <main>

                <div class="man-form">
                    <h4 class="man-title">Edit Manager Details</h4>
                    <%
                        int id = Integer.parseInt(request.getParameter("id"));
                        AddManagerDAO addManagerDAO = new AddManagerDAO();
                        User u = addManagerDAO.getManagerbyId(id);
                    %>
                    <form method="post" action="UpdateManagerServlet">
                        <p>Full Name:</p>
                        <input type="text" required name="name" placeholder="Full Name" value="<%=u.getName()%>" class="input">
                        <p>Email:</p>
                        <input type="email" required name="email" placeholder="Email" value="<%=u.getEmail()%>" class="input">
                        <p>Date of Birth:</p>
                        <input type="date" required name="dob" placeholder="Date of Birth" value="<%=u.getDob()%>" class="input">
                        <p>Gender:</p>
                        <select name="gender">
                            <option value="<%=u.getGender()%>"><%=u.getGender()%></option>
                            <option value="male">Male</option>
                            <option value="female">Female</option>
                        </select>
                        <p>Set Password:</p>
                        <input type="text" required name="password" placeholder="Set Password" value="<%=u.getPassword()%>" class="input">
                        <p>Address:</p>
                        <input type="text" required name="address" placeholder="Adress" value="<%=u.getAddress()%>" class="input">
                        <p>Phone Number:</p>
                        <input type="text" required name="contact" placeholder="Phone Number" value="<%=u.getContact()%>" class="input">
                        <input type="hidden" name="id" value="<%=u.getId()%>">
                        <button type="submit" >Update</button>
                    </form>
                </div>
            </main>
        </section>
    </body>
</html>
