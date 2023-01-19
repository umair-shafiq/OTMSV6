<%-- 
    Document   : Manager
    Created on : Jan 17, 2023, 6:26:27 PM
    Author     : Umair Shafiq
--%>

<%@page import="com.otms.dao.AddManagerDAO"%>
<%@page import="com.otms.model.User"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Manager Dashboard</title>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
       <link rel="stylesheet" type="text/css" href="css/Admin.css">
    </head>
    <body>
         <%@include file="ManagerNav.jsp" %>
         <section id="content" class="main-content">
         <main>
   	  	<h2 class="dash-title">Manager Dashboard</h2>
             
   	  	<div class="dash-cards">
   	  		<div class="card-single">
   	  			<div class="card-body">
   	  				<span ><i class="fa-solid fa-user"></i></span>
   	  			     <div>
   	  			     	<h5>Total Employees  </h5>
   	  			     	<h4>5</h4>
   	  			     </div>
   	  			</div>
   	  		</div>
   	  		<div class="card-single">
   	  			<div class="card-body">
   	  				<span ><i class="fa-solid fa-bell"></i></span>
   	  			     <div>
   	  			     	<h5>Noticeboard</h5>
   	  			     	<h4><a href="ViewNoticeboardManager.jsp"><button class="button-35" ><i class="fa-solid fa-eye fa-1x"></i></button></a></h4>
   	  			     </div>
   	  			</div>
   	  		</div>
   	  		<div class="card-single">
   	  			<div class="card-body">
   	  				<span><i class="fa-solid fa-list-check"></i></span>
   	  			     <div>
   	  			     	<h5>Total Tasks </h5>
   	  			     	<h4>5</h4>
   	  			     </div>
   	  			</div>
   	  		</div>
   	  	</div>
   	  </main>
         </section>
		<!-- MAIN -->
      
         <script>
             <%@include file="js/adminJavaScripit.js" %>
         </script>
    </body>
</html>

