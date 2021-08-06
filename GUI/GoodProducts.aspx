<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="GoodProducts.aspx.cs" Inherits="SE1436_Group4_Assigment.GoodProducts" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Styles/Info.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Text="San Pham Ban Chay Nhat"></asp:Label>
        <asp:GridView ID="GvProduct" CssClass="responsTable" runat="server" Height="250px" Width="900" AutoGenerateColumns="false">
        <Columns>
            <asp:BoundField DataField="MaSanPham" HeaderText="ID"/>
            <asp:BoundField DataField="TenSanPham" HeaderText="Ten San Pham"/>
            <asp:BoundField DataField="Size"  HeaderText="Size"/>
            <asp:BoundField DataField="Gia"  HeaderText="Gia San Pham"/>
            <asp:BoundField DataField="TenDanhMuc"  HeaderText="Ten Danh Muc"/>
            <asp:ImageField ControlStyle-Width="120px" ControlStyle-CssClass="image" ControlStyle-Height="90px" DataImageUrlField="ImgUrl" HeaderText="Image"></asp:ImageField>
            <asp:BoundField DataField="TongSoSanPham"  HeaderText="Tong So San Pham da ban"/>
        </Columns>
    </asp:GridView>
</asp:Content>
