<%-- 
    Document   : EmployeeDetails
    Created on : Jan 17, 2023, 6:43:06 PM
    Author     : Umair Shafiq
--%>

<%@page import="java.util.List"%>
<%@page import="com.otms.dao.AddEmployeeDAO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Details</title>
        <link rel="stylesheet" type="text/css" href="css/Admin.css">
    </head>
    <body>
       <%@include file="ManagerNav.jsp" %>
        <section id="content" class="main-content">
            <main>
                <h4 class="man-title">Employee Details</h4>

                <div class="manTable">
                    <table>
                        <thead>
                            <tr>
                                <th>Name</th>
                                <th>Email</th>
                                <th>DOB</th>
                                <th>Gender</th>
                                <th>Address</th>
                                <th>Contact</th>
                                
                            </tr>
                        </thead>
                        <tbody>
                            <%
                                        AddEmployeeDAO addEmployeeDAO = new AddEmployeeDAO();
                                        List<User> users = addEmployeeDAO.selectAllUsers();
                                        for (User u : users) {%>
                            <tr>
                                <td><%= u.getName()%></td>
                                        <td><%= u.getEmail()%></td>
                                        <td><%= u.getDob()%></td>
                                        <td><%= u.getGender()%></td>
                                        <td><%= u.getAddress()%></td>
                                        <td><%= u.getContact()%></td>
                                
                            </tr>
                           <% } %> 
                        </tbody>
                    </table>
                </div>
            </main>
        </section>
    </body>
</html>
