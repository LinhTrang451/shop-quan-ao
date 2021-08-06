using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Lab4_Template.DTL
{
    public class Cart
    {
 
        private int maSanPham;

       

        private string tenSanPham;


        private string ima;

        private int count;

        public int Count
        {
            get { return count; }
            set { count = value; }
        }

        private double unitPrice;

        public double UnitPrice
        {
            get { return unitPrice; }
            set { unitPrice = value; }
        }

        public string Ima 
        { 
            get => ima; 
            set => ima = value;
        }
        public int MaSanPham { get => maSanPham; set => maSanPham = value; }
        public string TenSanPham { get => tenSanPham; set => tenSanPham = value; }
    }
}
