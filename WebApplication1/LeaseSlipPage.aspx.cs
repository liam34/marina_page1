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
            //Button2.Focus();
          
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

           Button10.Focus();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
           

                int CustomerID = Convert.ToInt32(custID.Text);
                int index = GridView1.SelectedIndex;
                if (index<0)
                { MessageBox.Show("Select a row in available slips table first!");
                Button10.Focus();
                return;
                
                }
                string slipID = GridView1.Rows[index].Cells[1].Text;
                int SlipID = Convert.ToInt32(slipID);
                DateTime ArriveDate = Convert.ToDateTime(TextBox3.Text);
                DateTime LeaveDate = Convert.ToDateTime(TextBox4.Text);
            int qq1 = Data_Layer.LeaseDB.AddSlip(SlipID, CustomerID, ArriveDate,LeaveDate);
                if (qq1 > 0)
                {
                    MessageBox.Show("Add a new lease");
                   
                    // MessageBox.Show(TextBox3.Text);
                    //MessageBox.Show(GridView2.Rows[0].Cells[4].Text);
                    // GridView2.Rows[1].Cells[1].Text = TextBox3.Text;
                }
                else
                { MessageBox.Show("Adding new lease is not successul"); }
                GridView1.DataBind();
                GridView2.DataBind();
                Button10.Focus();
            
        }

        //protected void Button4_Click(object sender, EventArgs e)
        //{
        //    int index = GridView2.SelectedIndex;
        //    if (index < 0)
        //    {
        //        MessageBox.Show("Select a row in customer lease record table first!");
        //        return;
                  
        //    }
        //    string slipID = GridView2.Rows[index].Cells[2].Text;
        //    int SlipID = Convert.ToInt32(slipID);
        //    int qq1 = Data_Layer.LeaseDB.DeleLease(SlipID);
        //    GridView2.DataBind();
        //    GridView1.DataBind();
        //    Button4.Focus();
        //}

        protected void SqlDataSource2_Updating(object sender, SqlDataSourceCommandEventArgs e)
        {

        }

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            GridView1.DataBind();
            Button10.Focus();
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            GridView1.DataBind();
            Button10.Focus();
        }

        protected void Button6_Click(object sender, EventArgs e)
        {

            Calendar1.Visible = true;
            Button11.Focus();
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            Calendar2.Visible = true;
             Button11.Focus();
        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            TextBox3.Text = Calendar1.SelectedDate.ToString("yyyy-MM-dd");
            Button10.Focus();
            Calendar1.Visible = false;
            TextBox3.Visible = true;
        }

        protected void Calendar2_SelectionChanged(object sender, EventArgs e)
        {
            DateTime date1 = Convert.ToDateTime(TextBox3.Text);
            TextBox4.Text = Calendar2.SelectedDate.ToString("yyyy-MM-dd");
            DateTime date2 = Convert.ToDateTime(TextBox4.Text);
            if (date2 > date1)
            {
                Button10.Focus();
                Calendar2.Visible = false;
                TextBox4.Visible = true;
            }
            else
            {
                Button10.Focus();
                Response.Write("<script>alert('leave date can not early than arrive date')</script>"); }
             }

        protected void GridView1_DataBinding(object sender, EventArgs e)
        {

        }

        protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
        {
            Button17.Focus();
        }

        protected void Button9_Click(object sender, EventArgs e)
        {
            Map_Button.Focus();
        }

        protected void Map_Button_Click(object sender, EventArgs e)
        {
            Button17.Focus();
        }

        protected void Button10_Click(object sender, EventArgs e)
        {

            if ((TextBox1.Text == "") || (TextBox2.Text == "")||(TextBox3.Text == "") || (TextBox4.Text == ""))
            {
                MessageBox.Show(" width and length,arrive date, leave date must be filled! ");
                GridView1.Visible = false;
            }
            else
            { GridView1.Visible = true;
                
                if (GridView1.Rows.Count == 0)
                {
                    MessageBox.Show("Sorry, we do not have available slips fit your boats on your date in this dock , please try other docks");
                    DropDownList1.Focus();
                }
                Button10.Focus();
            }
        }

        protected void Button11_Click(object sender, EventArgs e)
        {
            if ((TextBox1.Text == "") || (TextBox2.Text == "") || (TextBox3.Text == "") || (TextBox4.Text == ""))
            {
                MessageBox.Show(" width and length,arrive date, leave date must be filled! ");
                GridView1.Visible = false;
            }
            else
            { GridView1.Visible = true;
                if (GridView1.Rows.Count==0)
                { MessageBox.Show("Sorry, we do not have available slips fit your boats on your date in this dock , please try other docks");
                    DropDownList1.Focus();
                }
                Button10.Focus();
             
            }
        }

        protected void Button14_Click(object sender, EventArgs e)
        {
            GridView2.Visible = true;
            Button10.Focus();
        }

        protected void Button16_Click(object sender, EventArgs e)
        {
            GridView4.Visible = true;
            Button10.Focus();
        }

        protected void GridView2_RowDeleted(object sender, GridViewDeletedEventArgs e)
        {
            GridView1.DataBind();
            Button10.Focus();
        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}