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
            if ((Session["Username"] == null))
            {
                Response.Redirect("Login.aspx");
            }


            int CRCount = CourseReviewsCount();
            Label1.Text =CRCount.ToString();
            

            int FRCount = FacultyReviewsCount();
            Label2.Text = FRCount.ToString();

            int PRCount = PlacemenetReviewsCount();
            Label3.Text = PRCount.ToString();

            int IRCount = InfrastructureReviewsCount();
            Label4.Text = IRCount.ToString();


            int ORCount = OverallReviewsCount();
            Label5.Text = ORCount.ToString();

            int CR1Count = CourseReviewsCount();
            Label6.Text = CR1Count.ToString();

            int CR2Count = CourseReviewsCount();
            Label7.Text = CR2Count.ToString();

        }
       

        protected int CourseReviewsCount()
        {
            int count = 0;

            try
            {

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();
                    string query = "SELECT COUNT(*) FROM CourseReviews";
                    SqlCommand command = new SqlCommand(query, conn);
                    count = (int)command.ExecuteScalar();
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "error", $"alert('Error: {ex.Message}');", true);
            }

            return count;
        }

        protected int FacultyReviewsCount()
        {
            int count = 0;

            try
            {

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();
                    string query = "SELECT COUNT(*) FROM FacultyReview";
                    SqlCommand command = new SqlCommand(query, conn);
                    count = (int)command.ExecuteScalar();
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "error", $"alert('Error: {ex.Message}');", true);
            }

            return count;
        }

        protected int PlacemenetReviewsCount()
        {
            int count = 0;

            try
            {

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();
                    string query = "SELECT COUNT(*) FROM PlacementReview";
                    SqlCommand command = new SqlCommand(query, conn);
                    count = (int)command.ExecuteScalar();
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "error", $"alert('Error: {ex.Message}');", true);
            }

            return count;
        }

        protected int InfrastructureReviewsCount()
        {
            int count = 0;

            try
            {

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();
                    string query = "SELECT COUNT(*) FROM InfrastructureReview";
                    SqlCommand command = new SqlCommand(query, conn);
                    count = (int)command.ExecuteScalar();
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "error", $"alert('Error: {ex.Message}');", true);
            }

            return count;
        }

        protected int OverallReviewsCount()
        {
            int count = 0;

            try
            {

                using (SqlConnection conn = new SqlConnection(connString))
                {
                    conn.Open();
                    string query = "SELECT COUNT(*) FROM OverallReviews";
                    SqlCommand command = new SqlCommand(query, conn);
                    count = (int)command.ExecuteScalar();
                }
            }
            catch (Exception ex)
            {
                ClientScript.RegisterStartupScript(this.GetType(), "error", $"alert('Error: {ex.Message}');", true);
            }

            return count;
        }
    }
}
   