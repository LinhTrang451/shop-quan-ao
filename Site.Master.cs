using Lab4_Template.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Lab4_Template
{
    public partial class SiteMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] == null)
            {
                NavigationMenu.Items[0].Enabled = true;
                NavigationMenu.Items[1].Enabled = true;
                NavigationMenu.Items[2].Enabled = true;
                NavigationMenu.Items[3].Enabled = false;
                NavigationMenu.Items[4].Enabled = false;
                lblUser.Text = "";
            }
            else
            {
                lblUser.Text = "User Name: " + (string)(Session["user"]);
                string s = (string)(Session["user"]);
                if (s.Equals("admin"))
                {
                    NavigationMenu.Items[0].Enabled = false;
                    NavigationMenu.Items[4].Enabled = false;
                }

                else
                {
                    NavigationMenu.Items[0].Enabled = true;
                    NavigationMenu.Items[1].Enabled = true;
                    NavigationMenu.Items[2].Enabled = true;
                    NavigationMenu.Items[3].Enabled = false;
                    NavigationMenu.Items[4].Enabled = true;

                }
            }
         
            if(Session["user"] == null)
            {
                NavigationMenu.Items[5].Text = "Đăng Nhập";
            }
            else
            {
                NavigationMenu.Items[5].Text = "Đăng Xuất";
            }
              
               

            
         

        }

        protected void NavigationMenu_MenuItemClick(object sender, MenuEventArgs e)
        {

        }
    }
}
