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
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>

    <script>
        window.onload = function () {
            window.history.forward();
            // Disable the back button by manipulating the browser history
            window.history.pushState(null, null, window.location.href);
            window.onpopstate = function () {
                window.history.forward();
            };
        };
    </script>

    <style>
        body {
            font-family: 'Trebuchet MS','Arial', sans-serif;
            background-color: #ffffff;
            margin: 0;
            padding: 0;
        }

        .sidebar {
            height: 100vh;
            width: 100%;
            position: fixed;
            background-color: #002147;
            padding-top: 20px;
            display: flex;
            flex-direction: column;
            overflow-y: auto; /* Allow sidebar to scroll if content overflows */
        }

            .sidebar img {
                border-radius: 50%;
                margin: 10px auto;
                display: block;
            }

            .sidebar a {
                padding: 15px;
                text-decoration: none;
                font-size: 18px;
                color: #ffffff;
                display: block;
                border-radius: 8px;
            }

                .sidebar a:hover {
                    background-color: #ffffff;
                    color: #002147;
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

        .img {
            border-radius: 60%;
            margin-top: 50px;
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
            color: #CDAD68;
            padding: 25px;
            text-align: center;
            position: fixed;
            bottom: 40px;
            margin-left:60px;
            font-size: 18px;
        }

        .button {
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

        .btn {
            display: block;
            padding: 15px;
            align-content:center;
            font-size: 18px;
            color: #ffffff;
            background-color: #002147;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            position: fixed;
            bottom: 0;
            width: 100%;
            transition: background-color 0.3s ease;
        }

            .btn:hover {
                background-color: #ffffff;
                color: #002147;
            }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar">
            <img src="https://www.srki.ac.in/theme/default/assets/images/logo.png" alt="Logo">

            <a href="Dashboard.aspx" target="contentFrame"><i class="fas fa-tachometer-alt"></i>&nbsp;&nbsp;Dashboard</a>
            <a href="Course.aspx" target="contentFrame"><i class="fas fa-book"></i>&nbsp;&nbsp;Course</a>
            <a href="Subject.aspx" target="contentFrame"><i class="fas fa-chalkboard"></i>&nbsp;&nbsp;Subject</a>
            <a href="Faculty.aspx" target="contentFrame"><i class="fas fa-users"></i>&nbsp;&nbsp;Faculty</a>
            <a href="Students.aspx" target="contentFrame"><i class="fas fa-graduation-cap"></i>&nbsp;&nbsp;Students Details</a>
            <a href="Feedback.aspx" target="contentFrame"><i class="fas fa-comment"></i>&nbsp;&nbsp;Feedback Details</a>
            <asp:Label ID="lblUserEmail" runat="server" CssClass="user-email"></asp:Label>
            <asp:Button ID="btnLogout" runat="server" CssClass="btn btn-primary fas fa-sign-out-alt" OnClientClick="return logout();" Text="Log out" />



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
        function logout() {
            window.top.location.href = 'Logout.aspx';

            return false; 
        }
    </script>


</body>
</html>



