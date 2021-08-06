<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Cart.aspx.cs" Inherits="SE1436_Group4_Assigment.WebForm3" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView ID="ListView1" runat="server" >
           <ItemTemplate>
                <tr style="">
                    <td>
                        <asp:HyperLink ID="TitleLink" runat="server" Text='<%# Eval("TenSanPham") %>' />
                    </td>
                    <td>
                         <asp:Image ID="AlbumUrlImage" runat="server" ImageUrl='<%# Eval("Ima") %>' Height=300px Width=300px />
                    </td>
                    <td>
                        <asp:Label ID="CountLabel" runat="server" Text='<%# Eval("Count") %>' />
                    </td>
                    <td>
                        <asp:Label ID="PriceLabel" runat="server" Text='<%# Eval("UnitPrice") %>' />
                    </td>
                    <td>
                         <asp:LinkButton ID="RemoveLink" runat="server" ForeColor="Black" OnCommand="RemoveLink_Command" Text="Remove from cart"  CommandArgument='<%# Eval("MaSanPham", "{0}") %>' />
                    </td>
                    
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="1" style="">
                                <tr runat="server" style="">
                                    <th id="Th1" runat="server">
                                        Title</th>
                                    <th id="Th5" runat="server">
                                        Image</th>
                                    <th id="Th2" runat="server">
                                        Count</th>
                                    <th id="Th3" runat="server">
                                        UnitPrice</th>
                                    <th id="Th4" runat="server">
                                        Remove</th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr> 
                            </table>
                        </td>
                    </tr>
                </table>
             </LayoutTemplate>
        </asp:ListView>
    Total:<asp:Label ID="LblT" runat="server" Text="Label"></asp:Label>
     <asp:Button ID="btnSave" runat="server" style="margin-left: 38px" Text="Save" OnClick="btnSub_Click" />

</asp:Content>
