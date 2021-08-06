<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="sanphamdamua.aspx.cs" Inherits="SE1436_Group4_Assigment.thongtincanhan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Styles/Info.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
         <asp:Label ID="Label1" runat="server" Text="Chon ngay Order: "></asp:Label><asp:DropDownList AutoPostBack="true" ID="ddlDate" runat="server" OnSelectedIndexChanged="ddlDate_SelectedIndexChanged"></asp:DropDownList>
        <asp:GridView ID="GvProduct" CssClass="responsTable" runat="server" Height="250px" Width="900" AutoGenerateColumns="false" AllowPaging="True" >
        <Columns>
            <asp:BoundField DataField="MaDonHang" HeaderText="Ma Don Hang"/>
            <asp:BoundField DataField="NgayDatHang" HeaderText="Ngay Dat Hang"/>
            <asp:BoundField DataField="Total"  HeaderText="Tong So Tien"/>
            <asp:BoundField DataField="MaDonHangCT"  HeaderText="Ma Don Hang Chi Tiet"/>
            <asp:BoundField DataField="MaSanPham"  HeaderText="Ma San Pham"/>
             <asp:BoundField DataField="TenSanPham" HeaderText="Ten San Pham"/>
            <asp:BoundField DataField="Gia"  HeaderText="Gia"/>
            <asp:BoundField DataField="SoLuongSP"  HeaderText="So Luong San Pham"/>
            <asp:BoundField DataField="Size"  HeaderText="Size"/>
            <asp:ImageField ControlStyle-Width="120px" ControlStyle-CssClass="image" ControlStyle-Height="90px" DataImageUrlField="ImgUrl" HeaderText="Image"></asp:ImageField>
        </Columns>
    </asp:GridView>

</asp:Content>
