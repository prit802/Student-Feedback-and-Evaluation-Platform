<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Logout.aspx.cs" Inherits="Student_Feedback_and_Evaluation_Platform.Admin.Logout" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
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

<body>
    <form id="form1" runat="server">
        <div>

          
        </div>
    </form>
</body>
</html>
