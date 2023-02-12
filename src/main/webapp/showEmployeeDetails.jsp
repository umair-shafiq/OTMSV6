<%-- 
    Document   : showEmployeeDetails
    Created on : Jan 16, 2023, 7:57:16 PM
    Author     : Umair Shafiq
--%>
<%@page import="java.util.List"%>
<%@page import="com.otms.dao.AddEmployeeDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee</title>
        <link rel="stylesheet" type="text/css" href="css/Admin.css">
    </head>
    <body>
        <%@include file="Adminnav.jsp" %>
        <section id="content" class="main-content">
            <main>
                <div >
                    <a href="AddEmployee.jsp" ><button type="button" class="button-24"><i class="fa-solid fa-plus fa-lg"></i> Add Employee</button></a>  
                </div>
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
                                <th>Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <%                                AddEmployeeDAO addEmployeeDAO = new AddEmployeeDAO();
                                List<User> users = addEmployeeDAO.selectAllUsers();
                                for (User u : users) {%>
                            <tr>
                                <td><%= u.getName()%></td>
                                <td><%= u.getEmail()%></td>
                                <td><%= u.getDob()%></td>
                                <td><%= u.getGender()%></td>
                                <td><%= u.getAddress()%></td>
                                <td><%= u.getContact()%></td>
                                <td>
                                    <a href="EditEmployee.jsp?id=<%=u.getId()%>"><button type="button" class="button1"><i class="fa-solid fa-pen-to-square "></i> Edit</button></a>
                                    <a href="DeleteEmployeeServlet?id=<%=u.getId()%>"><button type="button" class="button2"><i class="fa-solid fa-trash"></i> Delete</button></a>
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
            swal("Congrats", "Account created Sucessfuly", "success");
                <c:remove var="sucMsg" scope="session"/>
            </c:if>

            <c:if test="${not empty EditSucMsg}">
            swal("Updated", "User Data update Sucessfuly!", "success");
                <c:remove var="EditSucMsg" scope="session"/>
            </c:if>

            <c:if test="${not empty delMsg}">
            swal("Done!", "Employee Delete Sucessfully!", "success");
                <c:remove var="delMsg" scope="session"/>
            </c:if>
        </script>
    </body>

</html>
