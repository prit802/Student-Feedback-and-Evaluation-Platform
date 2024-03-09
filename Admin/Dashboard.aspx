<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Dashboard.aspx.cs" Inherits="Student_Feedback_and_Evaluation_Platform.Admin.Dashboard" %>

<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>GeeksForGeeks</title>
    <link rel="stylesheet" href="style.css">
    <link rel="stylesheet" href="responsive.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <script src="https://use.fontawesome.com/releases/v6.3.0/js/all.js" crossorigin="anonymous"></script>
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <style>
        body {
            background-color: #ffffff;
            font-family: 'Trebuchet MS', 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
        }

        .main {
            width: 100%;
            margin: 0 auto;
            padding: 0;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
        }

        .box-container {
            display: flex;
            margin-top: 0px;
            justify-content: space-evenly;
            align-items: center;
            gap: 20px;
            box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.1);
            border-radius: 20px;
            background-color: #002147;
            padding: 20px;
        }

        .box {
            width: 180px;
            height: 120px;
            border-radius: 20px;
            box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            cursor: pointer;
            transition: transform 0.3s ease-in-out;
            background-color: #fff;
        }

            .box:hover {
                transform: scale(1.05);
            }

        .box-container a {
            text-decoration: none;
        }

        .topic-heading {
            font-size: 28px;
            color: #002147;
            margin-bottom: 10px;
        }

        .topic {
            font-size: 17px;
            color: #002147;
        }


        @media screen and (max-width: 850px) {
            .box {
                width: 120px;
                height: 120px;
            }
        }

        .box-container1 {
            width: 40%;
            margin-top: 30px;
            margin-right: 660px;
            box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.1);
            border-radius: 20px;
            background-color: #002147;
            padding: 20px;
        }

        .box1 {
            display: flex;
            align-items: center;
           
            width: 95%;
            height: 45px;
            border-radius: 20px;
            box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.1);
            padding: 10px;
            cursor: pointer;
            transition: transform 0.3s ease-in-out;
            background-color: #fff;
        }

        .topic-heading1 {
            font-size: 20px;
            color: #002147;
            /*margin-left: 300px;*/
            position:fixed;
            right: 750px;
        }

        .topic1 {
            font-size: 22px;
            color: #002147;
        }

       
       .box-container1 a {
            text-decoration: none;
        }
      

    </style>
</head>

<body>

    <div class="main">
        <div>
            <h1 style="text-align: center; color: #002147;">All Review</h1>
        </div>
        <div class="box-container">
            <!-- Horizontal container -->
            <a href="Course.aspx" target="contentFrame">
                <div class="box box2">
                    <div class="text">
                        
                        <i class="fas fa-book" style='font-size: 24px; color: #002147;'></i>&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label1" runat="server" Text="Label" class="topic-heading"></asp:Label>
                        <h2 class="topic">Course Review</h2>
                        
                    </div>
                </div>
            </a>
            <a href="Course.aspx" target="contentFrame">
                <div class="box box3">
                    <div class="text">
                        <i class="fas fa-users" style='font-size: 24px; color: #002147;'></i>&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label2" runat="server" Text="Label" class="topic-heading"></asp:Label>
                        <h2 class="topic">Faculty Review</h2>
                    </div>
                </div>
            </a>
            <a href="Course.aspx" target="contentFrame">
                <div class="box box4">
                    <div class="text">
                        <i class="fas fa-briefcase" style='font-size: 24px; color: #002147;'></i>&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label3" runat="server" Text="Label" class="topic-heading"></asp:Label>
                        <h2 class="topic">Placement Review</h2>
                    </div>
                </div>
            </a>
            <a href="Course.aspx" target="contentFrame">
                <div class="box box4">
                    <div class="text">
                        <i class="fas fa-building" style='font-size: 24px; color: #002147;'></i>&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label4" runat="server" Text="Label" class="topic-heading"></asp:Label>
                        <h2 class="topic">Infrastructure Review</h2>
                    </div>
                </div>
            </a>
            <a href="Course.aspx" target="contentFrame">
                <div class="box box4">
                    <div class="text">
                        <i class="bx bxs-tachometer" style='font-size: 30px; color: #002147;'></i>&nbsp;&nbsp;&nbsp;
                            <asp:Label ID="Label5" runat="server" Text="Label" class="topic-heading"></asp:Label>
                        <h2 class="topic">Over All Review</h2>
                    </div>
                </div>
            </a>
        </div>
        <br />

        <div class="box-container1">
            
            <div class="box1 box2">
                &nbsp;&nbsp;&nbsp;
                <i class="fas fa-graduation-cap" style='font-size: 30px; color: #002147;'></i>&nbsp;&nbsp;&nbsp;

               
                <h3 class="topic1">Students</h3>

                <asp:Label ID="Label6" runat="server" Text="Label" class="topic-heading1"></asp:Label>

                    
            </div>
            <br>
            
                <div class="box1 box3">
                    &nbsp;&nbsp;&nbsp;
                    <i class="fas fa-users" style='font-size: 30px; color: #002147;'></i>&nbsp;&nbsp;&nbsp;

                
                <h3 class="topic1">Facultys</h3>

                <asp:Label ID="Label7" runat="server" Text="Label" class="topic-heading1"></asp:Label>
                </div>
            
            <br>
            
            
                <div class="box1 box4">
                    &nbsp;&nbsp;&nbsp;
                    <i class="fas fa-book" style='font-size: 30px; color: #002147;'></i>&nbsp;&nbsp;&nbsp;

                <!-- Title -->
                <h3 class="topic1">Courses</h3>

                <asp:Label ID="Label8" runat="server" Text="Label" class="topic-heading1"></asp:Label>
                </div>
           
            <br>
            
            <a href="Feedback.aspx" target="contentFrame">
                <div class="box1 box4">
                    &nbsp;&nbsp;&nbsp;
                    <i class="fas fa-comment" style='font-size: 30px; color: #002147;'></i>&nbsp;&nbsp;&nbsp;
                    <h3 class="topic1">All FeedBack</h3>
                    <asp:Label ID="Label9" runat="server" Text="Label" class="topic-heading1"></asp:Label>
                </div>
            </a>
        </div>

        
    </div>






</body>

</html>
