<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Course.aspx.cs" Inherits="Student_Feedback_and_Evaluation_Platform.Admin.Course" %>
<!DOCTYPE html>
<html>
<head>
    <title> Course</title>
    <style>
        .form-group {
            max-width: 300px;
            margin: auto;
        }

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

        .form-control {
            width: 100%;
            padding: 10px;
            border-radius: 5px;
            border: 1px solid #ccc;
            box-sizing: border-box;
            margin-bottom: 10px;
        }

        .btn {
            padding: 10px 20px;
            border: none;
            background-color: #007bff;
            color: #fff;
            border-radius: 5px;
            cursor: pointer;
        }

        .btn-primary {
            background-color: darkgray;
        }

        .btn-danger {
            background-color: gray;
        }

        .table {
            width: 100%;
            border-collapse: collapse;
        }

        .table th, .table td {
            padding: 8px;
            border-bottom: 1px solid #ddd;
            text-align: left;
        }

        .table th {
            background-color: #f2f2f2;
        }

        .text-center {
            text-align: center;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="form-group">Add Course</h2>
            <hr>

            <div class="form-group">
                <label for="courseName">Course Name:</label>
                <input type="text" class="form-control" id="courseName" name="courseName" runat="server">
                <asp:RequiredFieldValidator ID="courseNameRequiredFieldValidator" runat="server" ControlToValidate="courseName" ErrorMessage="*" ForeColor="Red" />
            </div>
            <br>
            <div class="form-group">
                <label for="courseType">Course Type:</label>
                <asp:DropDownList ID="courseType" runat="server" CssClass="form-control" onchange="courseType_Changed" AppendDataBoundItems="true">
                    <asp:ListItem Value=" " Selected="True"></asp:ListItem>
                    <asp:ListItem Value="ug">Undergraduate</asp:ListItem>
                    <asp:ListItem Value="pg">Postgraduate</asp:ListItem>
                    <asp:ListItem Value="phd">PhD</asp:ListItem>
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="courseTypeValidator" runat="server" ControlToValidate="courseType" ErrorMessage="*  " Display="Dynamic" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>

            <div class="form-group" id="semesterGroup" runat="server" style="display: none;">
                <label for="noOfSemester">No of Semester:</label>
                <asp:DropDownList ID="noOfSemester" runat="server" CssClass="form-control">
                    <asp:ListItem Value="4">4</asp:ListItem>
                    <asp:ListItem Value="6">6</asp:ListItem>
                </asp:DropDownList>
            </div>

            <br>
            <div class="form-group">
                <asp:Button runat="server" ID="submitButton" Text="Submit" CssClass="btn btn-primary" OnClick="submitButton_Click" />
            </div>
            <br>
        </div>

        <br>
        <br>

        <center>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" Height="110px" Width="800px" DataKeyNames="CourseId" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowDeleting="GridView1_RowDeleting" OnRowUpdating="GridView1_RowUpdating">
                <Columns>
                    <asp:BoundField DataField="CourseId" HeaderText="Course ID" ItemStyle-CssClass="text-center" ReadOnly="True">
                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Coursename" HeaderText="Course Name" ItemStyle-CssClass="text-center">
                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Coursetype" HeaderText="Course Type" ItemStyle-CssClass="text-center">
                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>
                    <asp:BoundField DataField="Semester" HeaderText="Semester" ItemStyle-CssClass="text-center">
                        <ItemStyle CssClass="text-center"></ItemStyle>
                    </asp:BoundField>
                    <asp:CommandField ButtonType="Button" ShowEditButton="True" ControlStyle-CssClass="btn btn-primary" CausesValidation="False" >
                        <ControlStyle CssClass="btn btn-primary"></ControlStyle>
                    </asp:CommandField>
                    <asp:CommandField ButtonType="Button" ShowDeleteButton="True" ControlStyle-CssClass="btn btn-danger" >
                        <ControlStyle CssClass="btn btn-danger"></ControlStyle>
                    </asp:CommandField>
                </Columns>
            </asp:GridView>
        </center>
    </form>

    <script>
        $(document).ready(function () {
            $('#courseType').change(function () {
                var courseType = $(this).val();
                if (!courseType) {
                    // Display alert box if course type is empty
                    alert('Please select a valid course type.');
                    return; // Exit the function
                }

                // Rest of your code for handling course types
                if (courseType === 'ug' || courseType === 'pg' || courseType === 'phd') {
                    $('#semesterGroup').show();
                    $('#noOfSemester').val(courseType === 'ug' ? '6' : '4');
                    $('#noOfSemester option[value="4"]').toggle(courseType !== 'ug');
                    $('#noOfSemester option[value="6"]').toggle(courseType === 'ug');
                } else {
                    $('#semesterGroup').hide();
                }
            });

            // Submit button click event handler
            $('#submitButton').click(function () {
                var courseType = $('#courseType').val();
                if (!courseType) {
                    alert('Please select a valid course type.');
                    return false; // Prevent form submission
                }
            });
        });

       

    </script>

    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.16.0/umd/popper.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.4/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>

