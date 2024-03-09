using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Student_Feedback_and_Evaluation_Platform.Admin
{
    public partial class nav : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Session["Username"] == null)
                {
                    Response.Redirect("Login.aspx");
                }
                lblUserEmail.Text = Session["Username"].ToString();
            }


            if (Request.QueryString["logout"] == "true")
            {
                Session.Abandon();
                Session.RemoveAll();
                Session.Clear();
                Response.Redirect("Logout.aspx");
            }

        }


        


    }
}