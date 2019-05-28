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
            
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            SqlConnection conn = new SqlConnection(@"Data Source=DESKTOP-I8OAD8M;Initial Catalog=Marina;Integrated Security=True");
            conn.Open();
            string query = "SELECT COUNT(1) FROM Customer WHERE username=@username AND pass=@pass";
            SqlCommand sqlCmd = new SqlCommand(query, conn);
            sqlCmd.Parameters.AddWithValue("@username", TextBox1.Text.Trim());
            sqlCmd.Parameters.AddWithValue("@pass", TextBox2.Text.Trim());

            int count = Convert.ToInt32(sqlCmd.ExecuteScalar());
            //int count = 1;
            if (count == 1)
            {
                Session["Username"] = TextBox1.Text.Trim();
               
                Button2.Visible = true;
                
                
            }
            else
            {
                Label1.Visible = true;
            }
            
        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {

        }
    }
}