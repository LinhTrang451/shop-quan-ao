<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="InfoUser.aspx.cs" Inherits="SE1436_Group4_Assigment.InfoUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <link href="Styles/Info.css" rel="stylesheet" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
        <asp:GridView ID="DvInfo" CssClass="responsTable" runat="server" Height="250px" Width="900" AutoGenerateColumns="false" >
        <Columns>
            <asp:BoundField DataField="Hoten" HeaderText="Ho Va Ten"/>
            <asp:BoundField DataField="TaiKhoan" HeaderText="Account"/>
            <asp:BoundField DataField="MatKhau"  HeaderText="Password"/>
            <asp:BoundField DataField="GioiTinh"  HeaderText="Gioi Tinh"/>
            <asp:BoundField DataField="NgaySinh"  HeaderText="Ngay Sinh"/>
            <asp:BoundField DataField="DiaChi"  HeaderText="Dia Chi"/>
            <asp:BoundField DataField="Sdt"  HeaderText="So Dien Thoai"/>
        </Columns>
    </asp:GridView>

</asp:Content>
