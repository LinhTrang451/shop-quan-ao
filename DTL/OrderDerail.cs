using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Lab4_Template.DTL
{
    public class OrderDetail
    {
        private int maSanPham;
        private int maDonHang;
        private string tenSanPham;
        private double gia;
        private int soluongSP;

        public int MaSanPham { get => maSanPham; set => maSanPham = value; }
        public int MaDonHang { get => maDonHang; set => maDonHang = value; }
        public string TenSanPham { get => tenSanPham; set => tenSanPham = value; }
        public double Gia { get => gia; set => gia = value; }
        public int SoluongSP { get => soluongSP; set => soluongSP = value; }
    }
}
