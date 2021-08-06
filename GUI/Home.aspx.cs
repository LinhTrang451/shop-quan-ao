using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Lab4_Template;
using Lab4_Template.DTL;

namespace SE1436_Group4_Assigment
{
    public partial class Home : System.Web.UI.Page
    {
        static string strConn = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        DataTable dt = new DataTable();
        int id;
        List<Cart> listA = new List<Cart>();
        protected void Page_Load1(object sender, EventArgs e)
        {
           
        }

        protected void ListView1_PagePropertiesChanging(object sender, PagePropertiesChangingEventArgs e)
        {
            (ListView1.FindControl("DataPager1") as DataPager).SetPageProperties(e.StartRowIndex, e.MaximumRows, false);

        }

        protected void ListView1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
        protected void Button1_Command(object sender, CommandEventArgs e)
        {

            if (Session["user"] == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                if (Session["carts"] == null)
                {

                    id = int.Parse(e.CommandArgument.ToString());
                    SqlConnection conn = new SqlConnection(strConn);
                    SqlCommand cmd = new SqlCommand("select * from SanPham where MaSanPham = @t");
                    cmd.Parameters.AddWithValue("@t", id);
                    cmd.Connection = conn;
                    conn.Open();
                    SqlDataReader dr = cmd.ExecuteReader();
                    while (dr.Read())
                    {
                        Cart c = new Cart();
                        c.Ima = dr.GetValue(4).ToString();
                        c.MaSanPham = int.Parse(dr.GetValue(0).ToString());
                        c.TenSanPham = dr.GetValue(2).ToString();
                        c.UnitPrice = double.Parse(dr.GetValue(5).ToString());
                        c.Count = 1;
                        listA.Add(c);
                    }

                    conn.Close();

                }
                else
                {
                    listA = (List<Cart>)Session["carts"];
                    Cart ca = new Cart();
                    Boolean check = true;
                    foreach (var c in listA)
                    {
                        if (c.MaSanPham == int.Parse(e.CommandArgument.ToString()))
                        {
                            c.Count++;
                            check = false;
                        }

                    }
                    if (check == true)
                    {
                        id = int.Parse(e.CommandArgument.ToString());
                        SqlConnection conn = new SqlConnection(strConn);
                        SqlCommand cmd = new SqlCommand("select * from SanPham where MaSanPham = @t");
                        cmd.Parameters.AddWithValue("@t", id);
                        cmd.Connection = conn;
                        conn.Open();
                        SqlDataReader dr = cmd.ExecuteReader();
                        while (dr.Read())
                        {
                            ca.Ima = dr.GetValue(4).ToString();
                            ca.MaSanPham = int.Parse(dr.GetValue(0).ToString());
                            ca.TenSanPham = dr.GetValue(2).ToString();
                            ca.UnitPrice = double.Parse(dr.GetValue(5).ToString());
                            ca.Count = 1;
                        }
                        listA.Add(ca);
                        conn.Close();
                    }
                }
                Session["carts"] = listA;
                Response.Redirect("Cart.aspx");
            }
            }

       /* protected void Page_Load(object sender, EventArgs e)
        {

        }*/
    }
}