using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student_Feedback_and_Evaluation_Platform.Admin
{
    public partial class Logout : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
            // Abandon the session
            Session.Abandon();
            // Redirect to the login page
            Response.Redirect("Login.aspx");

            if (Session["Username"] != null)
            {
                Response.Redirect("Login.aspx");
            }

            //Session.Abandon();

            //Response.Redirect("Login.aspx");
        }
    }
}