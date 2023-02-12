<%-- 
    Document   : index
    Created on : Aug 27, 2022, 6:23:17 PM
    Author     : Umair Shafiq
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <title>OTMS</title>
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-GLhlTQ8iRABdZLl6O3oVMWSktQOp6b7In1Zl3/Jr59b6EGGoI1aFkw7cmDA6j6gD" crossorigin="anonymous">
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.1/css/all.min.css" integrity="sha512-MV7K8+y+gLIBoVD59lQIYicR65iaqukzvf/nwasF0nqhPay5w/9lJmVM2hMDcnK1OnMGCdVK+iQrJ7lzPJQd1w==" crossorigin="anonymous" referrerpolicy="no-referrer" />
        <link rel="stylesheet" type="text/css" href="css/indexStyle.css">
    </head>
    <body>
        <div class="banner">
            <div class="navbar">
                <h2 class="logo" ><i class="fa-solid fa-user-clock fa-2x"></i>TMS</h2>
                <!-- <img src="#" class="logo"> -->
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="About.jsp">About</a></li>
                    <li><a href="Login.jsp">Login</a></li>
                </ul>
            </div>

            <div class="content">
                <h1>ONLINE TASK MANAGEMENT SYSTEM</h1>
                <p>The main objective of this project is to provide a paperless environment for office based employees and employers.</p>

                <div>
                    <button type="button" class="" data-bs-toggle="modal" data-bs-target="#exampleModal"><span></span>READ MORE</button>

                </div>

            </div>

        </div>
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog modal-dialog-centered modal-lg modal-dialog-scrollable">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Abstract</h5>

                    </div>
                    <div class="modal-body lh-base text-justify align-text">
                        The main objective of this project is to provide a paperless environment for office-based
                        employees and employers. Employees working in a team have number of tasks on a daily basis
                        like project activities, HR tasks, invoice generation, social media posts and so on. It is very difficult
                        to manage all talks by using pen and paper or even by using excel sheets. This project offers such
                        efficient environment that helps staff member has less contact with paper work. The project will
                        help to get rid of the hassle of managing and maintaining physical files. This system will help team
                        members to keep track the project tasks, their deadlines, track progress as well as manage the
                        team in effective way. This system will dedicate a specific space to assign tasks, manage schedules,
                        monitor progress. It will help in tracking the tasks and sub-tasks more efficiently, so managers will
                        be able to meet the deadlines and targets. It will improve the managing capabilities of tasks for
                        in-office as well as virtual teams and also boost up team collaboration capabilities. This system will
                        have dedicated space to each task enables team member to share relevant information and work
                        on thing together. Every employee assigned to specific task has complete access on that space
                        and nobody left out ignorant. Team members can share their ideas, feedback and more
                        information for effective collaboration over task so work will be done quickly. One more benefit of
                        the system is to prioritize the tasks according to their importance. It will easily track the
                        performance of all the employees. There is no need to call the employees on regular basis and ask
                        for completion of their tasks.
                    </div>
                    <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>

                    </div>
                </div>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js" integrity="sha384-w76AqPfDkMBDXo30jS1Sgez6pr3x5MlQ1ZAGC+nuZB+EYdgRZgiwxhTBTkF7CXvN" crossorigin="anonymous"></script>
    </body>
</html>
