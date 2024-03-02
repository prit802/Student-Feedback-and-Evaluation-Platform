using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student_Feedback_and_Evaluation_Platform.Admin
{
    public partial class Dashboard : System.Web.UI.Page
    {
        string connString = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;

        protected void Page_Load(object sender, EventArgs e)
        {

            int facultyCount = GetFacultyCount();
            Label1.Text =facultyCount.ToString();
        }

        protected int GetFacultyCount()
        {
            int count = 0;

            try
            {
                // Retrieve the connection string from web.config

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

    }
}
   