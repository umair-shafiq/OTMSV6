<%-- 
    Document   : showMangerDetails
    Created on : Jan 15, 2023, 5:28:16 PM
    Author     : Umair Shafiq
--%>
<%@page import="com.otms.model.User"%>
<%@page import="java.util.List"%>
<%@page import="com.otms.dao.AddManagerDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager</title>

        <link rel="stylesheet" type="text/css" href="css/Admin.css">

    </head>
    <body>
        <%@include file="Adminnav.jsp" %>
        <section id="content" class="main-content">
            <main>
                <div >
                    <a href="AddManager.jsp" ><button type="button" class="button-24"><i class="fa-solid fa-plus fa-lg"></i> Add Manager</button></a>  
                </div>
                <h4 class="man-title">Manager Details</h4>

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
                            <%                                AddManagerDAO addManagerDAO = new AddManagerDAO();
                                List<User> users = addManagerDAO.selectAllUsers();
                                for (User u : users) {%>
                            <tr>
                                <td><%= u.getName()%></td>
                                <td><%= u.getEmail()%></td>
                                <td><%= u.getDob()%></td>
                                <td><%= u.getGender()%></td>
                                <td><%= u.getAddress()%></td>
                                <td><%= u.getContact()%></td>
                                <td>
                                    <a href="EditManager.jsp?id=<%=u.getId()%>"><button type="button" class="button1"><i class="fa-solid fa-pen-to-square "></i> Edit</button></a>
                                    <a href="DeleteManagerServlet?id=<%=u.getId()%>"><button type="button" class="button2" onclick="deleteConfirmation(<%=u.getId()%>)"><i class="fa-solid fa-trash"></i> Delete</button></a>
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
                                        function deleteConfirmation(id) {
                                            Swal({
                                                title: "Are you sure?",
                                                text: "You won't be able to revert this!",
                                                icon: "warning",
                                                buttons: true,
                                                dangerMode: true,
                                            }).then((result) => {
                                                if (result.value) {
                                                    // If the user confirms, redirect to the delete link
                                                    window.location.href = `DeleteManagerServlet?id=${id}`;
                                                    swal("Poof! Your imaginary file has been deleted!", {
                                                        icon: "success",
                                                    });
                                                }
                                            });
                                        }

            <c:if test="${not empty sucMsg}">
                                        swal("Congrats", "Account created Sucessfuly", "success");
                <c:remove var="sucMsg" scope="session"/>
            </c:if>

            <c:if test="${not empty EditSucMsg}">
                                        swal("Updated", "User Data update Sucessfuly!", "success");
                <c:remove var="EditSucMsg" scope="session"/>
            </c:if>

            <c:if test="${not empty delMsg}">
                                        swal("Done!", "Manager Delete Sucessfully!", "success");
                <c:remove var="delMsg" scope="session"/>
            </c:if>

        </script>

    </body>
</html>
