<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WUC_Login.ascx.cs" Inherits="blocks_WUC_Login" %>
<asp:MultiView ID="MultiView1" runat="server">
    <asp:View ID="ViewLogin" runat="server">
        <table align="center" cellpadding="1" cellspacing="0">
            <tr>
                <td>
                    Tài khoản:</td>
                <td>
                    <asp:TextBox ID="txtUser" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Mật khẩu:</td>
                <td>
                    <asp:TextBox ID="txtPass" runat="server" TextMode="Password"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    <asp:ImageButton ID="ImageButton1" runat="server" Height="30px" ImageUrl="~/images/icons/button-title-login.png" Width="80px" OnClick="ibDangNhap_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:Label ID="lblThongBao" runat="server" BackColor="#FFFF99" Font-Bold="True" 
                        Font-Italic="True" ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:HyperLink ID="hlQuenMatKhau" runat="server" 
                        NavigateUrl="~/QuenMatKhau.aspx">Quên mật khẩu</asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td colspan="2">
                    <asp:HyperLink ID="hlDangKy" runat="server" NavigateUrl="~/DangKyTV.aspx">Đăng ký thành viên</asp:HyperLink>
                </td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="ViewLogout" runat="server">
        <table align="center" cellpadding="5" cellspacing="0">
            <tr>
                <td align="center">
                    <asp:ImageButton ID="ibHinh" runat="server" 
                        ImageUrl="~/upload/khachhang/user_male.png" />
                    <br />
                    <asp:HyperLink ID="hlHoTen" runat="server" ForeColor="Red"></asp:HyperLink>
                </td>
            </tr>
            <tr>
                <td>
                    <asp:LinkButton ID="lbDangXuat" runat="server" onclick="lbDangXuat_Click">Đăng xuất</asp:LinkButton>
                    <br />
                    <asp:HyperLink ID="HyperLink4" runat="server" 
                        NavigateUrl="~/LichSuMuaHang.aspx">Lịch sử mua hàng</asp:HyperLink>
                    <br />
                    <asp:HyperLink ID="hlQuanTri" runat="server" NavigateUrl="~/Admin/Default.aspx">Quản trị</asp:HyperLink>
                </td>
            </tr>
        </table>
    </asp:View>
</asp:MultiView>