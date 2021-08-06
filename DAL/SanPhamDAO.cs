using Lab4_Template.DAL;
using System;
using System.Data;
using System.Data.SqlClient;


namespace SE1436_Group4_Assigment.DAL
{
    public class SanPhamDAO
    {
        public static DataTable GetAllProduct()
        {
            string sql = @"SELECT [MaSanPham]
                              ,d.[MaDanhMuc]
                              ,[TenSanPham]
                              ,[Size]
                              ,[ImgUrl]
                              ,[Gia]
	                          ,d.TenDanhMuc
                          FROM [SanPham] s inner join DanhmucSanPham d
                          on s.MaDanhMuc = d.MaDanhmuc";
            return DAO.GetDataTable(sql);
        }
        public static int DeleteProduct(int id)
        {
            string sql = @"DELETE FROM [SanPham]
                             WHERE MaSanPham = @id";
            SqlParameter pr2 = new SqlParameter("@id", SqlDbType.Int);
            pr2.Value = id;
            return DAO.ExecuteSQlWithParameters(sql, pr2);
        }

        public static DataTable GetAllDanhMucSanPham()
        {
            string sql = @"SELECT [MaDanhmuc]
                              ,[TenDanhMuc]
                          FROM [DanhmucSanPham]";
            return DAO.GetDataTable(sql);
        }
        public static DataTable GetSanPhamById(int id)
        {
            string sql = @"SELECT  [MaSanPham]
                              ,[MaDanhMuc]
                              ,[TenSanPham]
                              ,[Size]
                              ,[ImgUrl]
                              ,[Gia]
                          FROM [SanPham]
                          Where MaSanPham = @id";
            SqlParameter pr2 = new SqlParameter("@id", SqlDbType.Int);
            pr2.Value = id;
            return DAO.GetDataBySQLWithParamester(sql, pr2);
        }
        public static int UpdateProduct(int id, int madanhmuc, string tensanpham, string size, string url, double gia)
        {
            string sql = @"UPDATE [SanPham]
                               SET [MaDanhMuc] = @madanhmuc
                                  ,[TenSanPham] = @tensanpham
                                  ,[Size] = @size
                                  ,[ImgUrl] = @url
                                  ,[Gia] = @gia
                             WHERE MaSanPham = @id";
            SqlParameter pr1 = new SqlParameter("@id", SqlDbType.Int);
            pr1.Value = id;
            SqlParameter pr2 = new SqlParameter("@madanhmuc", SqlDbType.Int);
            pr2.Value = madanhmuc;
            SqlParameter pr3 = new SqlParameter("@tensanpham", SqlDbType.NVarChar);
            pr3.Value = tensanpham;
            SqlParameter pr4 = new SqlParameter("@size", SqlDbType.NVarChar);
            pr4.Value = size;
            SqlParameter pr5 = new SqlParameter("@url", SqlDbType.NVarChar);
            pr5.Value = url;
            SqlParameter pr6 = new SqlParameter("@gia", SqlDbType.Float);
            pr6.Value = gia;
            return DAO.ExecuteSQlWithParameters(sql, pr1, pr2, pr3, pr4, pr5, pr6);

        }
        public static int CreateProduct(int madanhmuc, string tensanpham, string size, string url, double gia)
        {
            string sql = @"INSERT INTO [SanPham]
                                   ([MaDanhMuc]
                                   ,[TenSanPham]
                                   ,[Size]
                                   ,[ImgUrl]
                                   ,[Gia])
                             VALUES
                                   (@madanhmuc
                                   ,@tensanpham
                                   ,@size
                                   ,@img
                                   ,@gia)";
            SqlParameter pr2 = new SqlParameter("@madanhmuc", SqlDbType.Int);
            pr2.Value = madanhmuc;
            SqlParameter pr3 = new SqlParameter("@tensanpham", SqlDbType.NVarChar);
            pr3.Value = tensanpham;
            SqlParameter pr4 = new SqlParameter("@size", SqlDbType.NVarChar);
            pr4.Value = size;
            SqlParameter pr5 = new SqlParameter("@img", SqlDbType.NVarChar);
            pr5.Value = url;
            SqlParameter pr6 = new SqlParameter("@gia", SqlDbType.Float);
            pr6.Value = gia;
            return DAO.ExecuteSQlWithParameters(sql, pr2, pr3, pr4, pr5, pr6);

        }
        public static int InserNguoiDung(string tk, string mk, string hoten, bool gioitinh, DateTime date, string diachi, string sdt)
        {
            string sql = @"INSERT INTO [NguoiDung]
                               ([TaiKhoan]
                               ,[MatKhau]
                               ,[Hoten]
                               ,[GioiTinh]
                               ,[NgaySinh]
                               ,[DiaChi]
                               ,[Sdt]
                               ,[NhomQuyen])
                         VALUES
                               (@tk
                               ,@mk
                               ,@hoten
                               ,@gioitinh
                               ,@date
                               ,@diachi
                               ,@sdt
                               ,2)";
            SqlParameter pr2 = new SqlParameter("@tk", SqlDbType.NVarChar);
            pr2.Value = tk;
            SqlParameter pr3 = new SqlParameter("@mk", SqlDbType.NVarChar);
            pr3.Value = mk;
            SqlParameter pr4 = new SqlParameter("@hoten", SqlDbType.NVarChar);
            pr4.Value = hoten;
            SqlParameter pr5 = new SqlParameter("@gioitinh", SqlDbType.Bit);
            pr5.Value = gioitinh;
            SqlParameter pr6 = new SqlParameter("@date", SqlDbType.Date);
            pr6.Value = date;
            SqlParameter pr7 = new SqlParameter("@diachi", SqlDbType.NVarChar);
            pr7.Value = diachi;
            SqlParameter pr8 = new SqlParameter("@sdt", SqlDbType.NVarChar);
            pr8.Value = sdt;
            return DAO.ExecuteSQlWithParameters(sql, pr2, pr3, pr4, pr5, pr6, pr7, pr8);
        }
        public static DataTable GetUserNameById(string tk)
        {
            string sql = @"SELECT  [TaiKhoan]
                              ,[MatKhau]
                              ,[Hoten]
                              ,[GioiTinh]
                              ,[NgaySinh]
                              ,[DiaChi]
                              ,[Sdt]
                          FROM [NguoiDung]
                          Where TaiKhoan like @tk";
            SqlParameter pr1 = new SqlParameter("@tk", SqlDbType.NVarChar);
            pr1.Value = tk;
            return DAO.GetDataBySQLWithParamester(sql, pr1);
        }
        public static DataTable GetAllProductByUser(string user, DateTime date)
        {
            string sql = @"select dh.MaDonHang, dh.NgayDatHang,dh.Total,dhct.MaDonHangCT,
                        sp.MaSanPham,sp.TenSanPham,sp.Gia,dhct.SoLuongSP,sp.Size,sp.ImgUrl
                        from NguoiDung nd inner join DonHang dh
                        on nd.TaiKhoan = dh.TaiKhoan inner join DonHangChiTiet dhct
                        on dh.MaDonHang = dhct.MaDonHang inner join SanPham sp
                        on dhct.MaSanPham = sp.MaSanPham
                        where nd.TaiKhoan like @user and NgayDatHang = @date
                        order by dh.NgayDatHang DESC";
            SqlParameter pr1 = new SqlParameter("@user", SqlDbType.NVarChar);
            pr1.Value = user;
            SqlParameter pr2 = new SqlParameter("@date", SqlDbType.Date);
            pr2.Value = date;
            return DAO.GetDataBySQLWithParamester(sql, pr1,pr2);
        }
        public static DataTable GetAllDonHangByDate(DateTime date)
        {
            string sql = @"select dh.MaDonHang,dh.NgayDatHang,dhct.MaDonHangCT,sp.TenSanPham,
                                    sp.MaSanPham,sp.Gia,dhct.SoLuongSP,sp.Size,dm.TenDanhMuc,sp.ImgUrl
                                    from DonHang dh inner join DonHangChiTiet dhct
                                    on dh.MaDonHang = dhct.MaDonHang inner join SanPham sp
                                    on dhct.MaSanPham = sp.MaSanPham inner join DanhmucSanPham dm
                                    on sp.MaDanhMuc = dm.MaDanhmuc
                                    where dh.NgayDatHang = @date
                                    order by SoLuongSP Desc";
            SqlParameter pr1 = new SqlParameter("@date", SqlDbType.Date);
            pr1.Value = date;
            return DAO.GetDataBySQLWithParamester(sql, pr1);
        }

        public static DataTable GetDdlDate(string user)
        {
            string sql = @"select distinct dh.NgayDatHang from NguoiDung nd inner join DonHang dh
                              on nd.TaiKhoan = dh.TaiKhoan
                              where nd.TaiKhoan like @user";
            SqlParameter pr1 = new SqlParameter("@user", SqlDbType.NVarChar);
            pr1.Value = user;
            return DAO.GetDataBySQLWithParamester(sql, pr1);
        }
        public static DataTable GetProductGood()
        {
            string sql = @"With R as
                            (
	                            select Top (5) sp.MaSanPham,sp.TenSanPham,sp.ImgUrl,sp.Size,
	                            sp.Gia,sp.MaDanhMuc,SUM(dhct.SoLuongSP) TongSoSanPham
	                            from SanPham sp inner join DonHangChiTiet dhct
	                            on sp.MaSanPham = dhct.MaSanPham
	                            Group By sp.MaSanPham,sp.TenSanPham,sp.ImgUrl,sp.Size,sp.Gia,sp.MaDanhMuc
	                            order by TongSoSanPham desc
                            )
                            select R.MaSanPham,R.TenSanPham,R.ImgUrl,R.Size,R.Gia,dmsp.TenDanhMuc,R.TongSoSanPham
                            from DanhmucSanPham dmsp inner join R
                            on dmsp.MaDanhmuc = R.MaDanhMuc";
            return DAO.GetDataTable(sql);
        }
        public static DataTable GetIncomeByMonth(string month, string year)
        {
            string sql = @"select SUM(Total) tongtien,CONVERT(nvarchar(100),MONTH(NgayDatHang)) +' - '+ CONVERT(nvarchar(100),YEAR(NgayDatHang)) as date
                                            from DonHang
                                            where MONTH(NgayDatHang) = @month and YEAR(NgayDatHang) = @year
                                            group by MONTH(NgayDatHang),YEAR(NgayDatHang)";
            SqlParameter pr1 = new SqlParameter("@month", SqlDbType.NVarChar);
            pr1.Value = month;
            SqlParameter pr2 = new SqlParameter("@year", SqlDbType.NVarChar);
            pr2.Value = year;
            return DAO.GetDataBySQLWithParamester(sql,pr1,pr2);
        }
        public static DataTable GetAllDonHangByMonth(string month,string year)
        {
            string sql = @"select dh.MaDonHang,dh.NgayDatHang,dhct.MaDonHangCT,sp.TenSanPham,
                                    sp.MaSanPham,sp.Gia,dhct.SoLuongSP,sp.Size,dm.TenDanhMuc,sp.ImgUrl
                                    from DonHang dh inner join DonHangChiTiet dhct
                                    on dh.MaDonHang = dhct.MaDonHang inner join SanPham sp
                                    on dhct.MaSanPham = sp.MaSanPham inner join DanhmucSanPham dm
                                    on sp.MaDanhMuc = dm.MaDanhmuc
                                    where MONTH(NgayDatHang) = @month and YEAR(NgayDatHang) = @year
                                    order by SoLuongSP Desc";
            SqlParameter pr1 = new SqlParameter("@month", SqlDbType.NVarChar);
            pr1.Value = month;
            SqlParameter pr2 = new SqlParameter("@year", SqlDbType.NVarChar);
            pr2.Value = year;
            return DAO.GetDataBySQLWithParamester(sql, pr1,pr2);
        }
    }
}