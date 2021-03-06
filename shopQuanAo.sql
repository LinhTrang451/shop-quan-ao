USE [master]
GO
/****** Object:  Database [ShopQuanAo]    Script Date: 8/6/2021 10:22:15 PM ******/
CREATE DATABASE [ShopQuanAo]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ShopQuanAo', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ShopQuanAo.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'ShopQuanAo_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\ShopQuanAo_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [ShopQuanAo] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ShopQuanAo].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ShopQuanAo] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ShopQuanAo] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ShopQuanAo] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ShopQuanAo] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ShopQuanAo] SET ARITHABORT OFF 
GO
ALTER DATABASE [ShopQuanAo] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ShopQuanAo] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ShopQuanAo] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ShopQuanAo] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ShopQuanAo] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ShopQuanAo] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ShopQuanAo] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ShopQuanAo] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ShopQuanAo] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ShopQuanAo] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ShopQuanAo] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ShopQuanAo] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ShopQuanAo] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ShopQuanAo] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ShopQuanAo] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ShopQuanAo] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ShopQuanAo] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ShopQuanAo] SET RECOVERY FULL 
GO
ALTER DATABASE [ShopQuanAo] SET  MULTI_USER 
GO
ALTER DATABASE [ShopQuanAo] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ShopQuanAo] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ShopQuanAo] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ShopQuanAo] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [ShopQuanAo] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'ShopQuanAo', N'ON'
GO
ALTER DATABASE [ShopQuanAo] SET QUERY_STORE = OFF
GO
USE [ShopQuanAo]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [ShopQuanAo]
GO
/****** Object:  Table [dbo].[DanhmucSanPham]    Script Date: 8/6/2021 10:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhmucSanPham](
	[MaDanhmuc] [int] IDENTITY(1,1) NOT NULL,
	[TenDanhMuc] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK__DanhmucS__9B709EB57F60ED59] PRIMARY KEY CLUSTERED 
(
	[MaDanhmuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 8/6/2021 10:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[NgayDatHang] [datetime] NOT NULL,
	[TaiKhoan] [nvarchar](50) NOT NULL,
	[Total] [float] NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[Sdt] [nvarchar](20) NOT NULL,
	[Hoten] [nvarchar](50) NOT NULL,
	[NgaySinh] [date] NOT NULL,
 CONSTRAINT [PK__DonHang__129584AD38996AB5] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHangChiTiet]    Script Date: 8/6/2021 10:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHangChiTiet](
	[MaDonHangCT] [int] IDENTITY(1,1) NOT NULL,
	[MaSanPham] [int] NOT NULL,
	[MaDonHang] [int] NOT NULL,
	[TenSanPham] [nvarchar](50) NOT NULL,
	[Gia] [float] NOT NULL,
	[SoLuongSP] [int] NOT NULL,
 CONSTRAINT [PK__DonHangC__A906DF67182C9B23] PRIMARY KEY CLUSTERED 
(
	[MaDonHangCT] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[GioiThieu]    Script Date: 8/6/2021 10:22:16 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[GioiThieu](
	[NoiDung] [ntext] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[LienHe]    Script Date: 8/6/2021 10:22:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[LienHe](
	[MaLienHe] [int] IDENTITY(1,1) NOT NULL,
	[DiaChi] [nvarchar](100) NULL,
	[Email] [nvarchar](100) NULL,
	[Sdt] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[MaLienHe] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 8/6/2021 10:22:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[TaiKhoan] [nvarchar](50) NOT NULL,
	[MatKhau] [nvarchar](50) NOT NULL,
	[Hoten] [nvarchar](50) NOT NULL,
	[GioiTinh] [bit] NOT NULL,
	[NgaySinh] [date] NOT NULL,
	[DiaChi] [nvarchar](50) NOT NULL,
	[Sdt] [nvarchar](20) NOT NULL,
	[NhomQuyen] [int] NOT NULL,
 CONSTRAINT [PK__NguoiDun__D5B8C7F1108B795B] PRIMARY KEY CLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 8/6/2021 10:22:17 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSanPham] [int] IDENTITY(1,1) NOT NULL,
	[MaDanhMuc] [int] NOT NULL,
	[TenSanPham] [nvarchar](50) NOT NULL,
	[Size] [nvarchar](20) NOT NULL,
	[ImgUrl] [nvarchar](100) NOT NULL,
	[Gia] [float] NOT NULL,
 CONSTRAINT [PK__SanPham__FAC7442D03317E3D] PRIMARY KEY CLUSTERED 
(
	[MaSanPham] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[DanhmucSanPham] ON 

INSERT [dbo].[DanhmucSanPham] ([MaDanhmuc], [TenDanhMuc]) VALUES (1, N'Quần áo nam')
INSERT [dbo].[DanhmucSanPham] ([MaDanhmuc], [TenDanhMuc]) VALUES (2, N'Quần áo nữ')
INSERT [dbo].[DanhmucSanPham] ([MaDanhmuc], [TenDanhMuc]) VALUES (3, N'Đồ trẻ em')
SET IDENTITY_INSERT [dbo].[DanhmucSanPham] OFF
SET IDENTITY_INSERT [dbo].[DonHang] ON 

INSERT [dbo].[DonHang] ([MaDonHang], [NgayDatHang], [TaiKhoan], [Total], [DiaChi], [Sdt], [Hoten], [NgaySinh]) VALUES (6, CAST(N'2021-04-01T00:00:00.000' AS DateTime), N'mra', 75000, N'Ha Noi', N'0394837462', N'Nguyen Van A', CAST(N'2000-04-04' AS Date))
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDatHang], [TaiKhoan], [Total], [DiaChi], [Sdt], [Hoten], [NgaySinh]) VALUES (7, CAST(N'2021-04-01T00:00:00.000' AS DateTime), N'mrb', 25000, N'Ha Noi', N'0384957324', N'ABC', CAST(N'2000-03-04' AS Date))
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDatHang], [TaiKhoan], [Total], [DiaChi], [Sdt], [Hoten], [NgaySinh]) VALUES (8, CAST(N'2021-07-22T00:00:00.000' AS DateTime), N'mra', 100000, N'Ha Noi', N'0394837462', N'Nguyen Van A', CAST(N'2000-04-04' AS Date))
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDatHang], [TaiKhoan], [Total], [DiaChi], [Sdt], [Hoten], [NgaySinh]) VALUES (9, CAST(N'2021-07-22T00:00:00.000' AS DateTime), N'mra', 180000, N'Ha Noi', N'0394837462', N'Nguyen Van A', CAST(N'2000-04-04' AS Date))
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDatHang], [TaiKhoan], [Total], [DiaChi], [Sdt], [Hoten], [NgaySinh]) VALUES (10, CAST(N'2021-07-22T00:00:00.000' AS DateTime), N'mra', 620000, N'Ha Noi', N'0394837462', N'Nguyen Van A', CAST(N'2000-04-04' AS Date))
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDatHang], [TaiKhoan], [Total], [DiaChi], [Sdt], [Hoten], [NgaySinh]) VALUES (11, CAST(N'2021-08-06T00:00:00.000' AS DateTime), N'mra', 180000, N'Ha Noi', N'0394837462', N'Nguyen Van A', CAST(N'2000-04-04' AS Date))
INSERT [dbo].[DonHang] ([MaDonHang], [NgayDatHang], [TaiKhoan], [Total], [DiaChi], [Sdt], [Hoten], [NgaySinh]) VALUES (12, CAST(N'2021-08-06T00:00:00.000' AS DateTime), N'mra', 100000, N'Ha Noi', N'0394837462', N'Nguyen Van A', CAST(N'2000-04-04' AS Date))
SET IDENTITY_INSERT [dbo].[DonHang] OFF
SET IDENTITY_INSERT [dbo].[DonHangChiTiet] ON 

INSERT [dbo].[DonHangChiTiet] ([MaDonHangCT], [MaSanPham], [MaDonHang], [TenSanPham], [Gia], [SoLuongSP]) VALUES (1, 1, 6, N'Áo thun', 50000, 2)
INSERT [dbo].[DonHangChiTiet] ([MaDonHangCT], [MaSanPham], [MaDonHang], [TenSanPham], [Gia], [SoLuongSP]) VALUES (2, 2, 6, N'Váy', 180000, 1)
INSERT [dbo].[DonHangChiTiet] ([MaDonHangCT], [MaSanPham], [MaDonHang], [TenSanPham], [Gia], [SoLuongSP]) VALUES (3, 1, 7, N'Áo thun', 50000, 1)
INSERT [dbo].[DonHangChiTiet] ([MaDonHangCT], [MaSanPham], [MaDonHang], [TenSanPham], [Gia], [SoLuongSP]) VALUES (4, 2, 8, N'Áo sơ mi', 100000, 1)
INSERT [dbo].[DonHangChiTiet] ([MaDonHangCT], [MaSanPham], [MaDonHang], [TenSanPham], [Gia], [SoLuongSP]) VALUES (5, 3, 9, N'Áo khoác', 180000, 1)
INSERT [dbo].[DonHangChiTiet] ([MaDonHangCT], [MaSanPham], [MaDonHang], [TenSanPham], [Gia], [SoLuongSP]) VALUES (6, 3, 10, N'Áo khoác', 180000, 2)
INSERT [dbo].[DonHangChiTiet] ([MaDonHangCT], [MaSanPham], [MaDonHang], [TenSanPham], [Gia], [SoLuongSP]) VALUES (7, 6, 10, N'Áo vintage', 260000, 1)
INSERT [dbo].[DonHangChiTiet] ([MaDonHangCT], [MaSanPham], [MaDonHang], [TenSanPham], [Gia], [SoLuongSP]) VALUES (8, 3, 11, N'Áo khoác', 180000, 1)
INSERT [dbo].[DonHangChiTiet] ([MaDonHangCT], [MaSanPham], [MaDonHang], [TenSanPham], [Gia], [SoLuongSP]) VALUES (9, 2, 12, N'Áo sơ mi', 100000, 1)
SET IDENTITY_INSERT [dbo].[DonHangChiTiet] OFF
INSERT [dbo].[GioiThieu] ([NoiDung]) VALUES (N'Shop mang lại cho khách hàng những trải nghiệm mua sắm thời trang hàng hiệu trực tuyến thú vị từ các thương hiệu thời trang quốc tế và trong nước, cam kết chất lượng phục vụ hàng đầu cùng với những bộ sưu tập quần áo nam nữ khổng lồ từ trang phục, phụ kiện cho phụ nữ với những xu hướng thời trang mới nhất. Bạn có thể tìm thấy những bộ trang phục mình muốn từ những bộ đồ ở nhà thật thoải mái hay tự tin trong những bộ trang phục công sở phù hợp.')
INSERT [dbo].[NguoiDung] ([TaiKhoan], [MatKhau], [Hoten], [GioiTinh], [NgaySinh], [DiaChi], [Sdt], [NhomQuyen]) VALUES (N'admin', N'admin', N'Pham Thanh Duy', 1, CAST(N'2000-10-26' AS Date), N'Khanh Hoa', N'0337544235', 1)
INSERT [dbo].[NguoiDung] ([TaiKhoan], [MatKhau], [Hoten], [GioiTinh], [NgaySinh], [DiaChi], [Sdt], [NhomQuyen]) VALUES (N'mra', N'mra', N'Nguyen Van A', 1, CAST(N'2000-04-04' AS Date), N'Ha Noi', N'0394837462', 2)
INSERT [dbo].[NguoiDung] ([TaiKhoan], [MatKhau], [Hoten], [GioiTinh], [NgaySinh], [DiaChi], [Sdt], [NhomQuyen]) VALUES (N'mrb', N'mrb', N'ABC', 1, CAST(N'2000-03-04' AS Date), N'Ha Noi', N'0384957324', 2)
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [Size], [ImgUrl], [Gia]) VALUES (1, 1, N'Áo thun', N'M', N'/images/quanjeansnu.jpg', 50002)
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [Size], [ImgUrl], [Gia]) VALUES (2, 1, N'Áo sơ mi', N'M', N'/images/aosomi.jpg', 100000)
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [Size], [ImgUrl], [Gia]) VALUES (3, 1, N'Áo khoác', N'M', N'/images/aokhoac.jpg', 180000)
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [Size], [ImgUrl], [Gia]) VALUES (5, 1, N'Quần đùi', N'M', N'/images/quanduinam.jpg', 250000)
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [Size], [ImgUrl], [Gia]) VALUES (6, 1, N'Áo vintage', N'M', N'/images/aovintage.jpg', 260000)
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [Size], [ImgUrl], [Gia]) VALUES (7, 2, N'Áo thun nu', N'M', N'/images/aothunnu.jpg', 300000)
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [Size], [ImgUrl], [Gia]) VALUES (8, 2, N'Áo khoác nu', N'M', N'/images/aokhoacnu.jpg', 300000)
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [Size], [ImgUrl], [Gia]) VALUES (9, 2, N'Quần jeans nu', N'M', N'/images/quanjeansnu.jpg', 280000)
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [Size], [ImgUrl], [Gia]) VALUES (10, 2, N'Váy', N'M', N'/images/vay.jpg', 180000)
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [Size], [ImgUrl], [Gia]) VALUES (12, 2, N'Áo hoodie', N'M', N'/images/hoodie.jpg', 300000)
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [Size], [ImgUrl], [Gia]) VALUES (13, 3, N'Áo thun', N'M', N'/images/aothuntreem.jpg', 40000)
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [Size], [ImgUrl], [Gia]) VALUES (14, 3, N'Quần đùi', N'M', N'/images/quandui.jpg', 40000)
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [Size], [ImgUrl], [Gia]) VALUES (15, 3, N'Áo khoác', N'M', N'/images/aokhoactreem.jpg', 150000)
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [Size], [ImgUrl], [Gia]) VALUES (16, 3, N'Đồ jipima', N'M', N'/images/jipima.jpg', 200000)
INSERT [dbo].[SanPham] ([MaSanPham], [MaDanhMuc], [TenSanPham], [Size], [ImgUrl], [Gia]) VALUES (17, 2, N'váy', N'S', N'/images/vay.jpg', 50002)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FK_DonHang_NguoiDung] FOREIGN KEY([TaiKhoan])
REFERENCES [dbo].[NguoiDung] ([TaiKhoan])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FK_DonHang_NguoiDung]
GO
ALTER TABLE [dbo].[DonHangChiTiet]  WITH CHECK ADD  CONSTRAINT [FK__DonHangCh__MaSan__1B0907CE] FOREIGN KEY([MaSanPham])
REFERENCES [dbo].[SanPham] ([MaSanPham])
GO
ALTER TABLE [dbo].[DonHangChiTiet] CHECK CONSTRAINT [FK__DonHangCh__MaSan__1B0907CE]
GO
ALTER TABLE [dbo].[DonHangChiTiet]  WITH CHECK ADD  CONSTRAINT [FK_DonHangChiTiet_DonHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[DonHangChiTiet] CHECK CONSTRAINT [FK_DonHangChiTiet_DonHang]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK__SanPham__MaDanhM__0519C6AF] FOREIGN KEY([MaDanhMuc])
REFERENCES [dbo].[DanhmucSanPham] ([MaDanhmuc])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK__SanPham__MaDanhM__0519C6AF]
GO
USE [master]
GO
ALTER DATABASE [ShopQuanAo] SET  READ_WRITE 
GO
