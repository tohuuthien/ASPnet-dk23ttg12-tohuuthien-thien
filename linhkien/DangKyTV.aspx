<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEndMasterPage.master" AutoEventWireup="true" CodeFile="DangKyTV.aspx.cs" Inherits="DangKyTV" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphNoiDung" Runat="Server">
    <h1 class="nhomsp" align="center">ĐĂNG KÝ THÀNH VIÊN</h1>

    <table align="center" cellpadding="5" cellspacing="0">
        <tr>
            <td>
                Họ tên:</td>
            <td>
                <asp:TextBox ID="txtHoTen" runat="server" required placeholder="Nhập họ tên"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Tên đăng nhập:</td>
            <td>
                <asp:TextBox ID="txtTenDangNhap" runat="server" required placeholder="Nhập tên đăng nhập"></asp:TextBox>
                <asp:CustomValidator ID="CustomValidator1" runat="server" 
                    ControlToValidate="txtTenDangNhap" ErrorMessage="Tên này đã tồn tại" 
                    ForeColor="Red" onservervalidate="CustomValidator1_ServerValidate"></asp:CustomValidator>
            </td>
        </tr>
        <tr>
            <td>
                Mật khẩu:</td>
            <td>
                <asp:TextBox ID="txtMatKhau" runat="server" required 
                    placeholder="Nhập mật khẩu" TextMode="Password"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Nhập lại mật khẩu:</td>
            <td>
                <asp:TextBox ID="txtNhapLaiMatKhau" runat="server" required 
                    placeholder="Nhập lại mật khẩu" TextMode="Password"></asp:TextBox>
                <asp:CompareValidator ID="CompareValidator1" runat="server" 
                    ControlToValidate="txtNhapLaiMatKhau" ErrorMessage="Không khớp" ForeColor="Red" 
                    Display="Dynamic" ControlToCompare="txtMatKhau"></asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td>
                Đại chỉ:</td>
            <td>
                <asp:TextBox ID="txtDiaChi" runat="server" required placeholder="Nhập địa chỉ"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Điện thoại:</td>
            <td>
                <asp:TextBox ID="txtDienThoai" runat="server" required placeholder="Nhập điện thoại"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Email:</td>
            <td>
                <asp:TextBox ID="txtEmail" runat="server" required placeholder="Nhập Email"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="txtEmail" ErrorMessage="Sai định dạng" ForeColor="Red" 
                    ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td>
                Ngày sinh:</td>
            <td>
                <asp:TextBox ID="txtNgaySinh" runat="server" ></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td>
                Giới tính:</td>
            <td>
                <asp:RadioButtonList ID="rdbGioiTinh" runat="server" 
                    RepeatDirection="Horizontal" RepeatLayout="Flow">
                    <asp:ListItem Selected="True" Value="1">Nam</asp:ListItem>
                    <asp:ListItem Value="0">Nữ</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td>
                Hình:</td>
            <td>
&nbsp;<asp:FileUpload ID="fupHinh" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center" colspan="2">
                <asp:ImageButton ID="ibDangKy" runat="server" Height="35px" ImageUrl="~/images/icons/button-dangky.png" OnClick="ibDangKy_Click"  />
                <asp:ImageButton ID="ibLamLai" runat="server" Height="35px" ImageUrl="~/images/icons/button-lamlai.png" OnClick="ibLamLai_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <asp:Label ID="lblThongBao" runat="server" Font-Bold="True" Font-Italic="True" 
                    ForeColor="Red"></asp:Label>
            </td>
        </tr>
    </table>
    <script src="js/jquery-ui-1.10.4.js" type="text/javascript"></script>
    <link href="css/ui-lightness/jquery-ui-1.10.4.min.css" rel="stylesheet" type="text/css" />
    <script language="javascript">
        $(document).ready(function () {
            $("#cphNoiDung_txtNgaySinh").datepicker();
        });
    </script>
</asp:Content>

