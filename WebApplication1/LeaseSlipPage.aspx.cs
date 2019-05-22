using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using System.Windows.Forms;

namespace WebApplication1
{
    public partial class LeaseSlipPage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string username = Session["username"].ToString();
            Label3.Text = username;
           custID.Text = GridView3.Rows[0].Cells[1].Text;
          
        }

        protected void GridView1_CreatingModelDataSource(object sender, CreatingModelDataSourceEventArgs e)
        {

        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{

        //    GridView2.DataBind();
        //    GridView2.Visible = true;
        //    GridView1.DataBind();
        //}

        protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
        {

            Button2.Focus();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            int CustomerID = Convert.ToInt32(custID.Text);
            int index = GridView1.SelectedIndex;
            string slipID = GridView1.Rows[index].Cells[1].Text;
            int SlipID = Convert.ToInt32(slipID);
            int qq1 = Data_Layer.LeaseDB.AddSlip(SlipID, CustomerID);
            if (qq1 > 0)
            { MessageBox.Show("Add a new lease");
               // MessageBox.Show(TextBox3.Text);
                //MessageBox.Show(GridView2.Rows[0].Cells[4].Text);
               // GridView2.Rows[1].Cells[1].Text = TextBox3.Text;
            }
            else
            { MessageBox.Show("Adding new lease is not successul"); }
            GridView1.DataBind();
            GridView2.DataBind();
            Button2.Focus();
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            int index = GridView2.SelectedIndex;
            string slipID = GridView2.Rows[index].Cells[2].Text;
            int SlipID = Convert.ToInt32(slipID);
            int qq1 = Data_Layer.LeaseDB.DeleLease(SlipID);
            GridView2.DataBind();
            GridView1.DataBind();
            Button4.Focus();
        }

        protected void SqlDataSource2_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            GridView1.DataBind();
            Button2.Focus();
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            GridView1.DataBind();
            Button2.Focus();
        }

        protected void Button6_Click(object sender, EventArgs e)
        {

            Calendar1.Visible = true;
            Button2.Focus();
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Calendar2.Visible = true;
            Button2.Focus();
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox3.Text = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
            Button2.Focus();
            Calendar1.Visible = false;
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            DateTime date1 = Convert.ToDateTime(TextBox3.Text);
            TextBox4.Text = Calendar2.SelectedDate.ToString("yyyy-MM-dd");
            DateTime date2 = Convert.ToDateTime(TextBox4.Text);
            if (date2 > date1)
            {
                Button2.Focus();
                Calendar2.Visible = false;
            }
            else
            {
                Button2.Focus();
                Response.Write("<script>alert('leave date can not early than arrive date')</script>"); }
             }

        protected void GridView1_DataBinding(object sender, EventArgs e)
        {

        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Button2.Focus();
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Map_Button.Focus();
        }

        protected void Map_Button_Click(object sender, EventArgs e)
        {
            Button2.Focus();
        }
    }
}