<%-- 
    Document   : EditEmployee
    Created on : Jan 16, 2023, 11:37:45 PM
    Author     : Umair Shafiq
--%>

<%@page import="com.otms.dao.AddManagerDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edit Employee</title>
        <link rel="stylesheet" type="text/css" href="css/Admin.css">
    </head>
    <body>
        <%@include file="Adminnav.jsp" %>
        <section id="content" class="main-content">
            <main>

                <div class="man-form">
                    <h4 class="man-title">Edit Employee Details</h4>
                    <%
                                int id = Integer.parseInt(request.getParameter("id"));
                                AddManagerDAO addManagerDAO = new AddManagerDAO();
                                User u = addManagerDAO.getManagerbyId(id);
                            %>
                    <form method="post" action="UpdateEmployeeServlet">
                        <p>Full Name:</p>
                        <input type="text" required name="name" placeholder="Full Name" class="input" value="<%=u.getName()%>">
                        <p>Email:</p>
                        <input type="email" required name="email" placeholder="Email" class="input" value="<%=u.getEmail()%>">
                        <p>Date of Birth:</p>
                        <input type="date" required name="dob" placeholder="Date of Birth" class="input" value="<%=u.getDob()%>">
                        <p>Gender:</p>
                        <c:set var="gender" value="<%=u.getGender()%>"/>
                         <label class="input">Male
                          <input type="radio" name="gender" value="male"  <c:if test="${gender=='male'}">checked</c:if>>
                          </label>
                         <label class="input">Female
                          <input type="radio" name="gender" value="female" <c:if test="${gender=='female'}">checked</c:if>>
                          </label>
                        <p>Set Password:</p>
                        <input type="text" required name="password" placeholder="Set Password" class="input" value="<%=u.getPassword()%>">
                        <p>Address:</p>
                        <input type="text" required name="address" placeholder="Adress" class="input" value="<%=u.getAddress()%>">
                        <p>Phone Number:</p>
                        <input type="text" required name="contact" placeholder="Phone Number" class="input" value="<%=u.getContact()%>">
                        <input type="hidden" name="id" value="<%=u.getId()%>">
                        <button type="submit" >Update</button>
                    </form>
                </div>
            </main>
        </section>
    </body>
</html>

