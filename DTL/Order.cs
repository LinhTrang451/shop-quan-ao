using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Lab4_Template.DTL
{
    public class Order
    {
        private int maDonHang;

       
        private DateTime ngayDatHang;


      
        private double total;
        private string diachi;
        private string ten;
        private DateTime ngaysinh;
        private string sdt;
        private string taikhoan;

        public double Total
        {
            get { return total; }
            set { total = value; }
        }

        public int MaDonHang { get => maDonHang; set => maDonHang = value; }
        public DateTime NgayDatHang { get => ngayDatHang; set => ngayDatHang = value; }
      
        public string Diachi { get => diachi; set => diachi = value; }
        public string Ten { get => ten; set => ten = value; }
        public DateTime Ngaysinh { get => ngaysinh; set => ngaysinh = value; }
        public string Sdt { get => sdt; set => sdt = value; }
        public string Taikhoan { get => taikhoan; set => taikhoan = value; }
    }
}
