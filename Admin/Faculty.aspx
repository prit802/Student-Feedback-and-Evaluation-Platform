<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Faculty.aspx.cs" Inherits="Student_Feedback_and_Evaluation_Platform.Admin.Faculty" %>


<!DOCTYPE html>
<html>
<head>
    <title>Add Faculty</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f8f9fa;
            margin: 0;
            padding: 0;
        }
        .container {
            width: 50%;
            box-shadow: rgba(0, 0, 0, 0.16) 0px 10px 36px 0px, rgba(0, 0, 0, 0.06) 0px 0px 0px 1px;
            margin-top: 50px;
            margin-left: auto;
            margin-right: auto;
            padding: 20px;
            background-color: #fff;
        }
        .form-group label {
            font-weight: bold;
        }
        .form-control {
            width: 100%;
            padding: 8px;
            margin-top: 6px;
            margin-bottom: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        .btn-primary,.btn-danger {
            background-color: darkgray;
            border: none;
            color: white;
            padding: 10px 24px;
            text-align: center;
            text-decoration: none;
            display: inline-block;
            font-size: 16px;
            margin: 4px 2px;
            cursor: pointer;
            border-radius: 4px;
        }
        .btn-primary:hover {
            background-color: gray;
        }
        hr {
            border: 3px solid gray;
            width: 100%;
            margin-top: 30px;
            margin-bottom: 30px;
        }
        .table {
            width: 100%;
            border-collapse: collapse;
        }
        .table th, .table td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        .table th {
            background-color: #f2f2f2;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <center>
                <h1> FACULTY</h1> 
            </center>
            <hr>
            <div class="form-group">
                <label for="txtFullName">Full Name:</label>
                <asp:TextBox ID="txtFullName" runat="server" CssClass="form-control"></asp:TextBox>
            </div>

            <div class="form-group">
                <label for="txtDateOfJoining">Date of Joining:</label>
                <asp:TextBox ID="txtDateOfJoining" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="txtExperience">Experience (In years):</label>
                <asp:TextBox ID="txtExperience" runat="server" CssClass="form-control" TextMode="Number"></asp:TextBox>
            </div>
            <div class="form-group">
                <label for="ddlCourse">Course:</label>
                <asp:DropDownList ID="DropDownList1" runat="server" class="form-control" AutoPostBack="True" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged"></asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="ddlSubject">Subject:</label>
                <asp:DropDownList ID="DropDownList2" runat="server" CssClass="form-control"></asp:DropDownList>
            </div>

            <div class="form-group">
                <label for="txtDescription">Description:</label>
                <asp:TextBox ID="txtDescription" runat="server" CssClass="form-control" TextMode="MultiLine" Rows="4"></asp:TextBox>
            </div>
            <center>
                <asp:Button ID="Button1" runat="server" Text="ADD" CssClass="btn btn-primary" OnClick="Button1_Click" />
            </center>
        </div>
        <br>
        <br>
               <div>
                   <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label>
                   </div>
        <div>
            <center>
                <h1> FACULTY'S</h1>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" Height="120px" Width="1000px" DataKeyNames="FacultyId" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowDeleting="GridView1_RowDeleting" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating">
                    <Columns>
                        <asp:BoundField DataField="FacultyId" HeaderText="Faculty ID" ItemStyle-CssClass="text-center" ReadOnly="True">
                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Fullname" HeaderText="Full Name" ItemStyle-CssClass="text-center">
                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Date_of_Joining" HeaderText="Date of Joining" DataFormatString="{0:d}" ItemStyle-CssClass="text-center">
                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Experience" HeaderText="Experience" ItemStyle-CssClass="text-center">
                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="CourseId" HeaderText="Course ID" ItemStyle-CssClass="text-center">
                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="SubjectId" HeaderText="Subject ID" ItemStyle-CssClass="text-center">
                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>
                        <asp:BoundField DataField="Description" HeaderText="Description" ItemStyle-CssClass="text-center">
                            <ItemStyle CssClass="text-center"></ItemStyle>
                        </asp:BoundField>
                        <asp:CommandField ButtonType="Button" ShowEditButton="True" ControlStyle-CssClass="btn btn-primary">
                            <ControlStyle CssClass="btn btn-primary"></ControlStyle>
                        </asp:CommandField>
                        <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ControlStyle-CssClass="btn btn-danger">
                            <ControlStyle CssClass="btn btn-danger"></ControlStyle>
                        </asp:CommandField>
                    </Columns>
                </asp:GridView>
            </center>

        </div>

    </form>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
   

</body>
</html>



