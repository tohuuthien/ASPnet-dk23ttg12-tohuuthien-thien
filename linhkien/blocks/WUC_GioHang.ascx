<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WUC_GioHang.ascx.cs" Inherits="blocks_WUC_GioHang" %>
<style type="text/css">
    .auto-style1 {
        width: 100%;
    }
</style>

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
        <table align="center" class="auto-style1">
    <tr>
        <td style="text-align: right">
            <asp:Label ID="lblSanPham" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        </td>
        <td>&nbsp; Sản phẩm</td>
    </tr>
    <tr>
        <td style="text-align: right">
            <asp:Label ID="lblGiaTien" runat="server" Font-Bold="True" ForeColor="Red"></asp:Label>
        </td>
        <td>&nbsp; VNĐ</td>
    </tr>
    <tr>
        <td>&nbsp;</td>
        <td>&nbsp;
            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl="~/GioHang.aspx" ImageUrl="~/images/icons/xemgiohang.gif"></asp:HyperLink>
        </td>
    </tr>
</table>
    </ContentTemplate>
</asp:UpdatePanel>