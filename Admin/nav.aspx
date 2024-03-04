<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="nav.aspx.cs" Inherits="Student_Feedback_and_Evaluation_Platform.Admin.nav" %>



<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+Wy6pT0aC74P2dEi4qDOpl7uQIDAQAAB"
        crossorigin="anonymous" />
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #ffffff;
            margin: 0;
            padding: 0;
        }

        .sidebar {
            height: 100vh;
            width: 250px;
            position: fixed;
            background-color: #6c757d;
            padding-top: 20px;
            display: flex;
            flex-direction: column;
            overflow-y: auto; /* Allow sidebar to scroll if content overflows */
        }

            .sidebar img {
                border-radius: 50%;
                margin: 20px auto;
                display: block;
            }

            .sidebar a {
                padding: 15px;
                text-decoration: none;
                font-size: 18px;
                color: #ffffff;
                display: block;
            }

                .sidebar a:hover {
                    background-color: #495057;
                }

        .container {
            margin-left: 250px;
            padding: 15px;
        }

        h1 {
            color: #000000;
            text-align: center;
        }

        .jumbotron {
            background-color: #e9ecef;
            color: #212529;
            padding: 50px;
            margin-top: 50px;
            border-radius: 8px;
        }

        img {
            border-radius: 60%;
            margin-top: 10px;
            margin-left: 60px;
        }

        .sidebar .logout {
            padding: 10px;
            text-decoration: none;
            font-size: 18px;
            color: #ffffff;
            display: block;
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: #6c757d;
            border-top: 1px solid #ffffff;
        }

        .user-email {
            color: #ffffff;
            padding: 15px;
            text-align: center;
        }
        .button{
             padding: 10px;
            text-decoration: none;
            font-size: 18px;
            color: #ffffff;
            display: block;
            position: absolute;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: #6c757d;
            border-top: 1px solid #ffffff;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar">
            <img src="https://www.srki.ac.in/theme/default/assets/images/logo.png" alt="Logo">
            <asp:Label ID="lblUserEmail" runat="server" CssClass="user-email"></asp:Label>
            <a href="Dashboard.aspx" target="contentFrame">Dashboard</a>
            <a href="Course.aspx" target="contentFrame">Course</a>
            <a href="Faculty.aspx" target="contentFrame">Faculty</a>
            <a href="Students.aspx" target="contentFrame">Students Details</a>
            <a href="Feedback.aspx" target="contentFrame">Feedback Details</a>
            <a href="Logout.aspx" class="logout" target="_top">Log out</a>
            
        </div>
    </form>
  <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"
        integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
        crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.2/dist/umd/popper.min.js"
        integrity="sha384-1QqxqMTrU2G1DNfP5Q3q/auhI0lVXxKOw9ilcLiHZlQ5uM5f5LBY/fR5JqPaKm69"
        crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"
        integrity="sha384-B4gt1jrGC7Jh4AgTPSdUtOBvfO8sh+Wy6pT0aC74P2dEi4qDOpl7uQIDAQAAB"
        crossorigin="anonymous"></script>
    
    
    <script>
        // JavaScript to handle logout link click event
        document.querySelector('.logout').addEventListener('click', function (event) {
            event.preventDefault(); // Prevent default link behavior
            window.top.location.href = 'Logout.aspx'; // Redirect the parent window to logout page
        });
    </script>
</body>
</html>



