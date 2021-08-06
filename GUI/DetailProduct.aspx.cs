using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE1436_Group4_Assigment
{

    public partial class WebForm2 : System.Web.UI.Page
    {
        static string strConn = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        int id;
        protected void Page_Load(object sender, EventArgs e)
        {
            id = int.Parse(Request.QueryString["ID"]);
            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("select * from SanPham where MaSanPham = @t");
            cmd.Parameters.AddWithValue("@t", id);
            cmd.Connection = conn;
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                LblT.Text = dr.GetValue(2).ToString();
                lbls.Text = dr.GetValue(3).ToString();
                lblG.Text = dr.GetValue(5).ToString();
                lblmdm.Text = dr.GetValue(1).ToString();
                Image2.ImageUrl = dr.GetValue(4).ToString();
               
            }
            conn.Close();
        }
    }
}