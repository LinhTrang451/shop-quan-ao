using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace SE1436_Group4_Assigment.Entity
{
    public class SanPham
    {
        int maSanPham;
        int maDanhMuc;
        string tenSanPham;
        string size;
        string imageUrl;
        double gia;

        public SanPham(int maSanPham, int maDanhMuc, string tenSanPham, string size, string imageUrl, double gia)
        {
            this.maSanPham = maSanPham;
            this.maDanhMuc = maDanhMuc;
            this.tenSanPham = tenSanPham;
            this.size = size;
            this.imageUrl = imageUrl;
            this.gia = gia;
        }

        public int MaSanPham { get => maSanPham; set => maSanPham = value; }
        public int MaDanhMuc { get => maDanhMuc; set => maDanhMuc = value; }
        public string TenSanPham { get => tenSanPham; set => tenSanPham = value; }
        public string Size { get => size; set => size = value; }
        public string ImageUrl { get => imageUrl; set => imageUrl = value; }
        public double Gia { get => gia; set => gia = value; }
    }
}