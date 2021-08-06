using Lab4_Template.DAL;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE1436_Group4_Assigment
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["user"] = null;
            
        }


        protected void btnSubmit_Click(object sender, EventArgs e)
        {

            DataTable dt = DAO.GetDataTable("SELECT *  " +
                "FROM NguoiDung WHERE TaiKhoan = '" + txtUser.Text + "'" +
                " and MatKhau =  '" + txtPass.Text + "'");
            if (dt.Rows.Count == 0)
            {

                return;
            }
            else
            {
                string s = dt.Rows[0]["NhomQuyen"].ToString();
                Session["user"] = dt.Rows[0][0].ToString();
                if (s.Equals("1"))
                {
                    Response.Redirect("ListProduct.aspx");
                }
                else
                {
                    Response.Redirect("Home.aspx");
                }

            }
           
        }
    }
}