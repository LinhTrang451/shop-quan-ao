<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Income.aspx.cs" Inherits="SE1436_Group4_Assigment.Income" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Styles/Info.css" rel="stylesheet" />
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:Label ID="Label1" runat="server" Text="Month"></asp:Label><asp:DropDownList ID="ddlMonth" runat="server"></asp:DropDownList>
    <asp:Label ID="Label2" runat="server" Text="Year"></asp:Label><asp:DropDownList ID="ddlYear" runat="server"></asp:DropDownList>
    <asp:Button ID="Button1" runat="server" Text="Find" OnClick="Button1_Click"/>
    <asp:GridView ID="GvProduct" CssClass="responsTable" runat="server" Height="250px" Width="900" AutoGenerateColumns="false" >
        <Columns>
            <asp:BoundField DataField="date" HeaderText="Date"/>
            <asp:BoundField DataField="tongtien" HeaderText="Total price"/>
        </Columns>
    </asp:GridView>
        <asp:GridView ID="Gv2" CssClass="responsTable" runat="server" Height="250px" Width="900" AutoGenerateColumns="false"  AllowPaging="True" OnPageIndexChanging="Gv2_PageIndexChanging" PageSize="5" >
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
             <PagerSettings LastPageText="Last" PageButtonCount="3" FirstPageText="first" Mode="NumericFirstLast" />
    </asp:GridView>
</asp:Content>
