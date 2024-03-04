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
    <style>
        /* Main CSS Here */

        body {
            background-color: #f0f0f0;
            font-family: 'Roboto', sans-serif;
        }

        .main {
            height: calc(100vh - 70px);
            width: 90%;
            
            padding: 0;
        }
        

        .box-container {
            display: flex;
            margin-top:50px;
            margin-left: 135px;
            justify-content: space-evenly;
            align-items: center;
            flex-wrap: wrap;
            gap: 20px;
            box-shadow: 3px 3px 10px rgba(0, 0, 0, 0.1);
            border-radius: 20px;
            background-color: darkgray;
            padding: 20px;
        }

        .box {
            height: 160px;
            width: 250px;
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

        .topic-heading {
            font-size: 28px;
            color: #333;
            margin-bottom: 10px;
        }

        .topic {
            font-size: 16px;
            color: #777;
        }

        /* Responsive CSS Here */

        @media screen and (max-width: 850px) {
            .box-container {
                gap: 30px;
            }

            .box {
                width: 200px;
            }
        }

        @media screen and (max-width: 490px) {
            .box {
                width: 150px;
                height: 100px;
                padding: 10px;
            }

            .topic-heading {
                font-size: 20px;
            }

            .topic {
                font-size: 12px;
            }
        }

        @media screen and (max-width: 400px) {
            .topic-heading {
                font-size: 18px;
            }

            .topic {
                font-size: 10px;
            }
        }
    </style>
</head>

<body>

    <div class="main">
        <div>
                <h1 style="text-align:center;">Faculty review</h1>
            </div>
        <div class="box-container">

            

            <div class="box box2">
                <div class="text">
                    <asp:Label ID="Label1" runat="server" Text="Label" class="topic-heading"></asp:Label>
                    <h2 class="topic">Faculty review</h2>
                </div>
            </div>

            <div class="box box3">
                <div class="text">
                    <h2 class="topic-heading">320</h2>
                    <h2 class="topic">infrastructure review</h2>
                </div>
            </div>

            <div class="box box4">
                <div class="text">
                    <h2 class="topic-heading">70</h2>
                    <h2 class="topic">placement review</h2>
                </div>
            </div>

            <div class="box box4">
                <div class="text">
                    <h2 class="topic-heading">70</h2>
                    <h2 class="topic">Faculty review</h2>
                </div>
            </div>

            <div class="box box4">
                <div class="text">
                    <h2 class="topic-heading">70</h2>
                    <h2 class="topic">over all review</h2>
                </div>
            </div>
        </div>


    </div>


</body>

</html>

