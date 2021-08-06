<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="SE1436_Group4_Assigment.Home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    </asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <asp:ListView ID="ListView1" runat="server" DataSourceID="ObjectDataSource1" 
            GroupItemCount="3" OnPagePropertiesChanging="ListView1_PagePropertiesChanging" OnSelectedIndexChanged="ListView1_SelectedIndexChanged" EnableModelValidation="True">
            <GroupTemplate>
                <tr ID="itemPlaceholderContainer" runat="server">
                    <td ID="itemPlaceholder" runat="server">
                    </td>
                </tr>
            </GroupTemplate>
            <ItemTemplate>
                <td runat="server" style="">
                    <asp:Image ID="AlbumUrlImage" runat="server" ImageUrl='<%# Eval("ImgUrl") %>' Height=300px Width=300px />
                    <br />
                    <asp:HyperLink ID="TitleLink" runat="server" ForeColor="Black"  NavigateUrl = '<%# "~/GUI/DetailProduct.aspx?ID=" + Eval("MaSanPham") %>'  Text='<%# Eval("TenSanPham") %>'  />
                    <br />

                     <br />
                      Price:<asp:Label ID="Label1" runat="server" Text='<%# Eval("Gia") %>'></asp:Label>
                     <br />

                    <asp:Button ID="Button1"  runat="server" OnCommand="Button1_Command" Text="Mua" CommandArgument='<%# Eval("MaSanPham","{0}") %>'  />
                    
                    <br />
                    <br />
                    <br />
                    <br />
                    <br />
                </td>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server" style="text-align:center;">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="groupPlaceholderContainer" runat="server" border="0" style="">
                                <tr ID="groupPlaceholder" runat="server">
                                </tr>
                                  <tr>
                                    <td colspan="5" style="text-align:center;">
                                        <asp:DataPager ID="DataPager1" runat="server"
                                            PagedControlID="ListView1" PageSize="6">
                                            <Fields>
                                                <asp:NumericPagerField ButtonType="Button"  />
                                            </Fields>
                                        </asp:DataPager>
                                    </td>
                                </tr>
                               
                            </table>
                        </td>
                    </tr>
                   

                </table>
            </LayoutTemplate>
      
        </asp:ListView>

    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />
    <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" SelectMethod="GetDataTable" TypeName="SE1436_Group4_Assigment.Product"></asp:ObjectDataSource>
    <br />
    <br />
    <br />
    <br />
    <br />
    <br />

   


</asp:Content>
