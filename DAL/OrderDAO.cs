using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using Lab4_Template.DTL;
using System.Configuration;


namespace Lab4_Template.DAL
{
    class OrderDAO
    {
        static string strConn = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;




        public static bool Insert(Order a)
        {
            SqlCommand cmd = new SqlCommand("Insert into DonHang(NgayDatHang,TaiKhoan,Total,Diachi,Sdt,Hoten,Ngaysinh) " +
                "Values(@NgayDatHang,@TaiKhoan,@Total,@Diachi,@Sdt,@Hoten,@Ngaysinh)");
            cmd.Parameters.AddWithValue("@NgayDatHang", a.NgayDatHang);
            cmd.Parameters.AddWithValue("@TaiKhoan", a.Taikhoan);
            cmd.Parameters.AddWithValue("@Total", a.Total);
            cmd.Parameters.AddWithValue("@Diachi", a.Diachi);
            cmd.Parameters.AddWithValue("@Sdt", a.Sdt);
            cmd.Parameters.AddWithValue("@Hoten", a.Ten);
            cmd.Parameters.AddWithValue("@Ngaysinh", a.Ngaysinh);


            return DAO.UpdateTable(cmd);


        }
        public static bool Insert1(OrderDetail a)
        {
            SqlCommand cmd = new SqlCommand("Insert into DonHangChiTiet(MaSanPham, MaDonHang, TenSanPham, Gia, SoLuongSP) Values(@MaSanPham, @MaDonHang, @TenSanPham,@Gia, @SoLuongSP)");
            cmd.Parameters.AddWithValue("@MaSanPham", a.MaSanPham);
            cmd.Parameters.AddWithValue("@MaDonHang", a.MaDonHang);
            cmd.Parameters.AddWithValue("@TenSanPham", a.TenSanPham);
            cmd.Parameters.AddWithValue("@Gia", a.Gia);
            cmd.Parameters.AddWithValue("@SoLuongSP", a.SoluongSP);

            return DAO.UpdateTable(cmd);
        }



    }
}
