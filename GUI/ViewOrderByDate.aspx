<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ViewOrderByDate.aspx.cs" Inherits="SE1436_Group4_Assigment.ViewOrder" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Styles/Info.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <h4> Order Date:</h4> 

    <asp:Label ID="Label1" runat="server" Text="Ngay Tim Kiem (yyyy-MM-dd): "></asp:Label><asp:TextBox ID="txtDate" runat="server"></asp:TextBox>
    <asp:Button ID="btnSearch" runat="server" Text="Tim Kiem" OnClick="btnSearch_Click" />
    <asp:GridView ID="GvProduct" CssClass="responsTable" runat="server" Height="250px" Width="900" AutoGenerateColumns="false" AllowPaging="True" >
        <Columns>
            <asp:BoundField DataField="MaDonHang" HeaderText="Ma Don Hang"/>
            <asp:BoundField DataField="NgayDatHang" HeaderText="Ngay Dat Hang"/>
            <asp:BoundField DataField="MaDonHangCT"  HeaderText="Ma Don Hang Chi Tiet"/>
            <asp:BoundField DataField="MaSanPham"  HeaderText="Ma San Pham"/>
             <asp:BoundField DataField="TenSanPham" HeaderText="Ten San Pham"/>
            <asp:BoundField DataField="Gia"  HeaderText="Gia"/>
            <asp:BoundField DataField="SoLuongSP"  HeaderText="So Luong San Pham"/>
            <asp:BoundField DataField="Size"  HeaderText="Size"/>
            <asp:BoundField DataField="TenDanhMuc"  HeaderText="Ten Danh Muc"/>
            <asp:ImageField ControlStyle-Width="120px" ControlStyle-CssClass="image" ControlStyle-Height="90px" DataImageUrlField="ImgUrl" HeaderText="Image"></asp:ImageField>
        </Columns>
    </asp:GridView>
</asp:Content>
