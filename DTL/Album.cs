using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Lab4_Template.DTL
{
    public class Album
    {
        private int maSanPham;

     

       
        private int artistID;

        public int ArtistID
        {
            get { return artistID; }
            set { artistID = value; }
        }

        private String title;

        public String Title
        {
            get { return title; }
            set { title = value; }
        }
        private double price;

        public double Price
        {
            get { return price; }
            set { price = value; }
        }

        private string albumUrl;

        public string AlbumUrl
        {
            get { return albumUrl; }
            set { albumUrl = value; }
        }

        public int MaSanPham { get => maSanPham; set => maSanPham = value; }
    }
}
