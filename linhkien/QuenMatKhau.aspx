<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEndMasterPage.master" AutoEventWireup="true" CodeFile="QuenMatKhau.aspx.cs" Inherits="QuenMatKhau" %>

<%@ Register Assembly="MSCaptcha" Namespace="MSCaptcha" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphNoiDung" Runat="Server">
    <table align="center" cellspacing="1" class="tbl_noidung">
                <tr>
                    <td class="tieude" colspan="2">
                        KHÔI PHỤC MẬT KHẨU BỊ MẤT</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Label ID="lblthongbao" runat="server" 
                            style="color: #FF6600; font-style: italic"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" class="style1" style="text-align: left">
                        Để khôi phục mật khẩu, yêu cầu nhập đúng các thông tin sau:</td>
                </tr>
                <tr>
                    <td class="thongtin">
                        Tên đăng nhập:</td>
                    <td class="noidung">
                        <asp:TextBox ID="txtTenDN" runat="server" Width="180px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtTenDN" ErrorMessage="*"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                   <td class="thongtin">
                       Email đã đăng kí:</td>
                    <td class="noidung">
                        <asp:TextBox ID="txtEmail" runat="server" Width="180px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtEmail" ErrorMessage="*"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                            ControlToValidate="txtEmail" ErrorMessage="Nhập đúng email" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="thongtin">
                        Nhập mã xác nhận:</td>
                    <td class="noidung">
                        <asp:TextBox ID="txtCaptcha" runat="server"></asp:TextBox>
                        <asp:Label ID="lblthongbao1" runat="server" 
                            style="color: #FF0000; font-style: italic"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="thongtin">
                        &nbsp;</td>
                    <td class="noidung">
                        
                        <cc1:CaptchaControl ID="ccJoin" runat="server" BackColor="#9999FF" 
                            CaptchaBackgroundNoise="None" 
                            CaptchaChars="abcdefghijklmlopqrstuvwxyz1234567890" CaptchaFont="small" 
                            CaptchaFontWarping="None" CaptchaHeight="31" CaptchaLineNoise="None" 
                            CaptchaMaxTimeout="240" CaptchaMinTimeout="5" CaptchaWidth="120" 
                            Font-Size="Small" Height="31px" Width="120px" />
                    </td>
                </tr>
                <tr>
                    <td class="thongtin">
                        &nbsp;</td>
                    <td class="noidung">
                        <asp:ImageButton ID="ibYeuCau" runat="server" Height="30px" ImageUrl="~/images/icons/button-guiyeucau.png" OnClick="ibYeuCau_Click" />
                    </td>
                </tr>
            </table>
</asp:Content>

