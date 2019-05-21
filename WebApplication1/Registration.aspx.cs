using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

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
            //start code here
            conn.Open();
            SqlCommand cmd = conn.CreateCommand();
            cmd.CommandType = System.Data.CommandType.Text;
            cmd.CommandText = "INSERT INTO Customer VALUES('"+TextBox1.Text+"','"+TextBox2.Text+"','"+TextBox3.Text+"','"+TextBox4.Text+"')";
            cmd.ExecuteNonQuery();

            conn.Close();
        }
    }
}