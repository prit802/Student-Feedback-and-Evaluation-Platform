using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student_Feedback_and_Evaluation_Platform.Admin
{
    public partial class Course : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindGridView();
            }
        }

        protected void submitButton_Click(object sender, EventArgs e)
        {

            string courseNameValue = courseName.Value.Trim();

            if (string.IsNullOrEmpty(courseNameValue))
            {
                // Display error message if the course name is empty
                ClientScript.RegisterStartupScript(this.GetType(), "insertFailure", "alert('Please enter a course name.');", true);
                return; // Exit the method without proceeding further
            }

            string courseNameUpper = courseNameValue.ToUpper();

            using (SqlConnection conn = new SqlConnection(connString))
            {
                string queryCheck = "SELECT COUNT(*) FROM Course WHERE UPPER(Coursename) = @Coursename";

                using (SqlCommand commandCheck = new SqlCommand(queryCheck, conn))
                {
                    commandCheck.Parameters.AddWithValue("@Coursename", courseNameUpper);

                    conn.Open();
                    int existingCount = (int)commandCheck.ExecuteScalar();

                    if (existingCount > 0)
                    {
                        ClientScript.RegisterStartupScript(this.GetType(), "insertFailure", "alert('Course already exists.');", true);
                    }
                    else
                    {
                        string queryInsert = "INSERT INTO Course (Coursename, Coursetype, Semester) VALUES (@Coursename, @Coursetype, @Semester)";

                        using (SqlCommand commandInsert = new SqlCommand(queryInsert, conn))
                        {
                            commandInsert.Parameters.AddWithValue("@Coursename", courseNameUpper); // Use the uppercase course name
                            commandInsert.Parameters.AddWithValue("@Coursetype", courseType.SelectedValue);
                            commandInsert.Parameters.AddWithValue("@Semester", Convert.ToInt32(noOfSemester.SelectedValue));

                            int rowsAffected = commandInsert.ExecuteNonQuery();

                            if (rowsAffected > 0)
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "insertSuccess", "alert('Course added successfully.');", true);
                            }
                            else
                            {
                                ClientScript.RegisterStartupScript(this.GetType(), "insertFailure", "alert('Failed to add course.');", true);
                            }
                        }
                    }
                }
            }

            BindGridView();
        }

        protected void BindGridView()
        {
            try
            {

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    string query = "SELECT * FROM Course";

                    using (SqlDataAdapter adapter = new SqlDataAdapter(query, conn))
                    {
                        DataTable dt = new DataTable();
                        adapter.Fill(dt);

                        dt.DefaultView.Sort = "CourseId DESC";
                        DataTable sortedDt = dt.DefaultView.ToTable();

                        GridView1.DataSource = sortedDt;
                        GridView1.DataBind();
                    }
                }
            }
            catch (Exception ex)
            {
                // Handle exception
                ClientScript.RegisterStartupScript(this.GetType(), "error", $"alert('Error: {ex.Message}');", true);
            }
        }

        protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {

                int courseId = Convert.ToInt32(GridView1.DataKeys[e.RowIndex].Value);

                string query = "DELETE FROM Course WHERE CourseId = @CourseId";

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    using (SqlCommand command = new SqlCommand(query, conn))
                    {
                        command.Parameters.AddWithValue("@CourseId", courseId);

                        conn.Open();
                        command.ExecuteNonQuery();
                    }
                }

                BindGridView();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "error", $"alert('Error: {ex.Message}');", true);
            }
        }

        protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
        {
            GridView1.EditIndex = e.NewEditIndex;
            BindGridView();
        }

        protected void GridView1_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            GridView1.EditIndex = -1;
            BindGridView();
        }

        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {

                string courseId = GridView1.DataKeys[e.RowIndex].Values["CourseId"].ToString();

                string courseName = e.NewValues["Coursename"].ToString();
                string courseType = e.NewValues["Coursetype"].ToString();
                int semester = Convert.ToInt32(e.NewValues["Semester"].ToString());

                string query = "UPDATE Course SET Coursename = @Coursename, Coursetype = @Coursetype, Semester = @Semester WHERE CourseId = @CourseId";

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    using (SqlCommand command = new SqlCommand(query, conn))
                    {
                        command.Parameters.AddWithValue("@CourseId", courseId);
                        command.Parameters.AddWithValue("@Coursename", courseName);
                        command.Parameters.AddWithValue("@Coursetype", courseType);
                        command.Parameters.AddWithValue("@Semester", semester);

                        conn.Open();
                        int rowsAffected = command.ExecuteNonQuery();

                        if (rowsAffected > 0)
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "updateSuccess", "alert('Update successful!');", true);
                        }
                        else
                        {
                            ClientScript.RegisterStartupScript(this.GetType(), "updateFailure", "alert('Update failed!');", true);
                        }
                    }
                }

                GridView1.EditIndex = -1;
                BindGridView();
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "error", $"alert('Error: {ex.Message}');", true);
            }
        }
    }
}
