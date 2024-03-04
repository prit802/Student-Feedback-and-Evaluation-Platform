using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace Student_Feedback_and_Evaluation_Platform.Admin
{
    public partial class Faculty : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if ((Session["Username"] == null))
            {
                Response.Redirect("Login.aspx");
            }

            if (!IsPostBack)
            {
                CoursesDropdown();
                BindGridView();

            }

            int facultyCount = FacultyCount();
            Label1.Text = "Total Faculty: " + facultyCount.ToString();
        }
        protected int FacultyCount()
        {
            int count = 0;

            try
            {

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();
                    string query = "SELECT COUNT(*) FROM Faculty";
                    SqlCommand command = new SqlCommand(query, conn);
                    count = (int)command.ExecuteScalar();
                }
            }
            catch (Exception ex)
            {
                // Handle exception
                ClientScript.RegisterStartupScript(this.GetType(), "error", $"alert('Error: {ex.Message}');", true);
            }

            return count;
        }

        private void CoursesDropdown()
        {
            string query = "SELECT CourseID, CourseName FROM Course";

            using (SqlConnection connection = new SqlConnection(connString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    if (reader.HasRows)
                    {
                        DropDownList1.DataSource = reader;
                        DropDownList1.DataTextField = "CourseName";
                        DropDownList1.DataValueField = "CourseID";
                        DropDownList1.DataBind();
                    }

                    reader.Close();
                    DropDownList1.Items.Insert(0, new ListItem(" Select ", ""));
                }
            }
        }

        private void SubjectsDropdown()
        {
            string selectedCourseID = DropDownList1.SelectedValue;

            string query = "SELECT SubjectID, SubjectName FROM Subject WHERE CourseId = @CourseId";

            using (SqlConnection connection = new SqlConnection(connString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@CourseId", selectedCourseID);

                    connection.Open();
                    SqlDataReader reader = command.ExecuteReader();

                    DropDownList2.Items.Clear();

                    if (reader.HasRows)
                    {
                        DropDownList2.DataSource = reader;
                        DropDownList2.DataTextField = "SubjectName";
                        DropDownList2.DataValueField = "SubjectID";
                        DropDownList2.DataBind();
                    }
                    else
                    {
                        DropDownList2.Items.Insert(0, new ListItem(" No Subjects Found ", ""));
                    }

                    reader.Close();
                }
            }
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            SubjectsDropdown();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            string fullName = txtFullName.Text;
            string dateOfJoining = txtDateOfJoining.Text;
            int experience = Convert.ToInt32(txtExperience.Text);
            string description = txtDescription.Text;

            string selectedCourseID = DropDownList1.SelectedValue;
            string selectedSubjectID = DropDownList2.SelectedValue;

            string insertQuery = "INSERT INTO Faculty (SubjectId, CourseId, Fullname, Experience, Description, Date_of_Joining) " +
                                 "VALUES (@SubjectId, @CourseId, @FullName, @Experience, @Description, @DateOfJoining)";


            using (SqlConnection connection = new SqlConnection(connString))
            {
                using (SqlCommand command = new SqlCommand(insertQuery, connection))
                {
                    command.Parameters.AddWithValue("@SubjectId", selectedSubjectID);
                    command.Parameters.AddWithValue("@CourseId", selectedCourseID);
                    command.Parameters.AddWithValue("@FullName", fullName);
                    command.Parameters.AddWithValue("@Experience", experience);
                    command.Parameters.AddWithValue("@Description", description);
                    command.Parameters.AddWithValue("@DateOfJoining", dateOfJoining);

                    try
                    {
                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Faculty added successfully!');", true);

                            txtFullName.Text = "";
                            txtDateOfJoining.Text = "";
                            txtExperience.Text = "";
                            txtDescription.Text = "";
                            DropDownList1.SelectedIndex = 0;
                            DropDownList2.Items.Clear();
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Failed to add faculty.');", true);
                        }
                    }
                    catch (Exception ex)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('An error occurred: " + ex.Message + "');", true);
                    }
                }
            }
            BindGridView();
        }

        protected void BindGridView()
        {
            DataTable dt = new DataTable();

            try
            {

                using (SqlConnection connection = new SqlConnection(connString))
                {
                    string query = "SELECT * FROM Faculty";

                    using (SqlDataAdapter adapter = new SqlDataAdapter(query, connection))
                    {
                        connection.Open();
                        adapter.Fill(dt);
                    }
                }

                dt.DefaultView.Sort = "FacultyId DESC";
                DataTable sortedDtdesc = dt.DefaultView.ToTable();

                GridView1.DataSource = sortedDtdesc;
                GridView1.DataBind();
            }
            catch (Exception ex)
            {
                Console.WriteLine("Error fetching data from database: " + ex.Message);
            }
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGridView();
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            int facultyId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

            string query = "DELETE FROM Faculty WHERE FacultyId = @FacultyId";

            using (SqlConnection connection = new SqlConnection(connString))
            {
                using (SqlCommand command = new SqlCommand(query, connection))
                {
                    command.Parameters.AddWithValue("@FacultyId", facultyId);

                    connection.Open();
                    command.ExecuteNonQuery();

                    ScriptManager.RegisterStartupScript(this, GetType(), "deleteAlert", "alert('Record deleted successfully');", true);
                }
            }

            BindGridView();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                int facultyId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Values["FacultyId"]);

                string fullName = e.NewValues["Fullname"]?.ToString();
                string dateOfJoining = e.NewValues["Date_of_Joining"]?.ToString();
                string description = e.NewValues["Description"]?.ToString();
                int subjectId = Convert.ToInt32(e.NewValues["SubjectId"] ?? "0");
                int courseId = Convert.ToInt32(e.NewValues["CourseId"] ?? "0");
                int experience = Convert.ToInt32(e.NewValues["Experience"] ?? "0");

                string updateQuery = "UPDATE Faculty SET Fullname = @FullName, Date_of_Joining = @DateOfJoining, Experience = @Experience, CourseId = @CourseId, SubjectId = @SubjectId, Description = @Description WHERE FacultyId = @FacultyId";

                using (SqlConnection connection = new SqlConnection(connString))
                {
                    using (SqlCommand command = new SqlCommand(updateQuery, connection))
                    {
                        command.Parameters.AddWithValue("@FullName", fullName);
                        command.Parameters.AddWithValue("@Experience", experience);
                        command.Parameters.AddWithValue("@CourseId", courseId);
                        command.Parameters.AddWithValue("@SubjectId", subjectId);
                        command.Parameters.AddWithValue("@Description", description);
                        command.Parameters.AddWithValue("@FacultyId", facultyId);

                        if (!string.IsNullOrEmpty(dateOfJoining))
                        {
                            command.Parameters.AddWithValue("@DateOfJoining", Convert.ToDateTime(dateOfJoining));
                        }
                        else
                        {
                            command.Parameters.AddWithValue("@DateOfJoining", DBNull.Value);
                        }

                        connection.Open();
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Record updated successfully!');", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "alert", "alert('Failed to update record.');", true);
                        }
                    }
                }

                GridView1.EditIndex = -1;
                BindGridView();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "alert", $"alert('An error occurred: {ex.Message}');", true);
            }
        }


    }
}