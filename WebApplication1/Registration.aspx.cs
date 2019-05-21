using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Web.Security;

namespace WebApplication1
{
    public partial class Registration_page : System.Web.UI.Page
    {
        SqlConnection conn = new SqlConnection(@"Data Source=softdev;Initial Catalog=Marina;Integrated Security=True");
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            

            
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "INSERT INTO Customer VALUES('"+TextBox1.Text+"','"+TextBox2.Text+"','"+TextBox3.Text+"','"+TextBox4.Text+ "','" + TextBox5.Text + "','" + TextBox6.Text + "')";
            int affectedRows = cmd.ExecuteNonQuery();
            conn.Close();
            Label1.Text = (affectedRows + " Records inserted successfully.");

            TextBox1.Text = string.Empty;
            TextBox2.Text = string.Empty;
            TextBox3.Text = string.Empty;
            TextBox4.Text = string.Empty;
            TextBox5.Text = string.Empty;
            TextBox6.Text = string.Empty;

        }
    }
}