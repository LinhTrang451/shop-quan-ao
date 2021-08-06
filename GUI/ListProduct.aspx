<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="ListProduct.aspx.cs" Inherits="SE1436_Group4_Assigment.ListProduct" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Styles/ListProduct.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <p style="text-align:center"> List Product </p>
    <asp:GridView ID="GvProduct" CssClass="responsTable" runat="server" Height="250px" Width="900" AutoGenerateColumns="false" AllowPaging="True" OnPageIndexChanging="GvProduct_PageIndexChanging" PageSize="5">
        <Columns>
            <asp:BoundField DataField="MaSanPham" HeaderText="ID"/>
            <asp:BoundField DataField="TenSanPham" HeaderText="Ten San Pham"/>
            <asp:BoundField DataField="Size"  HeaderText="Size"/>
            <asp:BoundField DataField="Gia"  HeaderText="Gia San Pham"/>
            <asp:BoundField DataField="TenDanhMuc"  HeaderText="Ten Danh Muc"/>
            <asp:ImageField ControlStyle-Width="120px" ControlStyle-CssClass="image" ControlStyle-Height="90px" DataImageUrlField="ImgUrl" HeaderText="Image"></asp:ImageField>
            <asp:HyperLinkField HeaderText="Remove" ControlStyle-CssClass="linkHref" ControlStyle-ForeColor="#6699ff" Text="remove" DataNavigateUrlFormatString="remove.aspx?aid={0}" DataNavigateUrlFields="MaSanPham" />
            <asp:HyperLinkField HeaderText="Update"  ControlStyle-CssClass="linkHref" ControlStyle-ForeColor="#ff0000" Text="update" DataNavigateUrlFormatString="update.aspx?aid={0}" DataNavigateUrlFields="MaSanPham" />
        </Columns>
        <PagerSettings LastPageText="Last" PageButtonCount="3" FirstPageText="first" Mode="NumericFirstLast" />
    </asp:GridView>

</asp:Content>
