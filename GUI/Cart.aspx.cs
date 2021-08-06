using Lab4_Template.DAL;
using Lab4_Template.DTL;
using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace SE1436_Group4_Assigment
{
    public partial class WebForm3 : System.Web.UI.Page
    {
        static string strConn = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;

        List<Cart> listA = new List<Cart>();
        string ten;
        string  id;
        DateTime ngaysinh;
        string diachi;
        string sdt;
        double total = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            List<Cart> carts = null;
            if (Session["carts"] != null)
            {
                carts = (List<Cart>)Session["carts"];

            }
            else
            {
                carts = new List<Cart>();
            }

            ListView1.DataSource = carts;
            ListView1.DataBind();
            
            foreach (var c in carts)
            {
                total += c.Count * c.UnitPrice;
            }
            LblT.Text = total.ToString();
        }
        protected void RemoveLink_Command(object sender, CommandEventArgs e)
        {
            //MessageBox.Show(e.CommandArgument.ToString());
            int maSanPham = int.Parse(e.CommandArgument.ToString());
            List<Cart> listC = (List<Cart>)Session["carts"];

            foreach (var c in listC)
            {
                if (maSanPham == c.MaSanPham)
                {
                    if (c.Count > 1)
                    {
                        c.Count--;
                        break;
                    }
                    else if (c.Count == 1)
                    {
                        listC.Remove(c);
                        break;
                    }
                }
            }
            Session["carts"] = listC;
            Response.Redirect("Cart.aspx");
        }

        protected void btnSub_Click(object sender, EventArgs e)
        {

            string id = Session["user"].ToString();


            SqlConnection conn = new SqlConnection(strConn);
            SqlCommand cmd = new SqlCommand("select * from NguoiDung where taikhoan = @t");
            cmd.Parameters.AddWithValue("@t", id);
            cmd.Connection = conn;
            conn.Open();
            SqlDataReader dr = cmd.ExecuteReader();
            while (dr.Read())
            {
                 ten  = dr.GetValue(2).ToString();
                 ngaysinh = Convert.ToDateTime(dr.GetValue(4).ToString());
                 diachi = dr.GetValue(5).ToString();
                sdt = dr.GetValue(6).ToString();
                Order o = new Order();
                /*o.NgayDatHang = DateTime.Parse(DateTime.Now.ToString("yyyy/MM/dd"));*/
                o.NgayDatHang = DateTime.Parse(DateTime.Now.ToString("yyyy/MM/dd"));
                o.Ten = ten;
                o.Diachi = diachi;
                o.Ngaysinh=ngaysinh;
                o.Total = total;
                o.Taikhoan = id;
                o.Sdt = sdt;
                OrderDAO.Insert(o);
                DataTable dt = DAO.GetDataTable("SELECT * FROM DonHang order by MaDonHang desc");
                int orderId = Convert.ToInt32(dt.Rows[0]["MaDonHang"].ToString());
                List<Cart> listC = (List<Cart>)Session["carts"];
                foreach (var c in listC)
                {
                    OrderDetail od = new OrderDetail();
                    od.MaDonHang = orderId;
                    od.MaSanPham = c.MaSanPham;
                    od.TenSanPham = c.TenSanPham;
                    od.Gia = c.UnitPrice;
                    od.SoluongSP = c.Count;
                    OrderDAO.Insert1(od);
                }
            }
            Session["carts"] = null;
            conn.Close();
            Response.Redirect("Home.aspx");
        }
    }
}