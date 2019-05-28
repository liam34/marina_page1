using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;

namespace WebApplication1
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //if (User.Identity.IsAuthenticated)
            //{
            //    // Refresh this page 60 seconds before session timeout, effectively resetting the session timeout counter.
            //    MetaRefresh.Attributes["content"] = Convert.ToString((Session.Timeout * 60) - 60) + "Login.aspx?q=" + DateTime.Now.Ticks;
            //    WindowStatusText = "Last refresh " + DateTime.Now.ToShortDateString() + " " + DateTime.Now.ToShortTimeString();
            //}
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            SqlConnection conn = new SqlConnection(@"Data Source=softdev;Initial Catalog=Marina;Integrated Security=True");
            conn.Open();
            string query = "SELECT COUNT(1) FROM Customer WHERE UserName=@Username AND PassWrd=@Password";
            SqlCommand sqlCmd = new SqlCommand(query, conn);
            sqlCmd.Parameters.AddWithValue("@Username", TextBox1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@Password", TextBox2.Text.Trim());
            int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
            if (count == 1)
            {
                Session["Username"] = TextBox1.Text.Trim();
                Response.Redirect("Dashboard.aspx");

                
            }
            else
            {
                Label1.Visible = true;
            }
            conn.Close();

            

        }
    }
}