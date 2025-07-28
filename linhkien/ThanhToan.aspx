<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEndMasterPage.master" AutoEventWireup="true" CodeFile="ThanhToan.aspx.cs" Inherits="ThanhToan" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .style1
        {
            height: 29px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphNoiDung" Runat="Server">
    <h2 class="tieude"> THÔNG TIN ĐẶT HÀNG</h2>
    </br>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
<table align="center" cellpadding="5" cellspacing="0">
    <tr>
        <td>
            Người đặt hàng:</td>
        <td>
            <asp:Label ID="lblHoTen" runat="server" Font-Bold="True" Font-Size="Larger" 
                ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            Thời điểm đặt hàng:</td>
        <td>
            <asp:Label ID="lblThoiDiem" runat="server"></asp:Label>
        </td>
    </tr>
    <tr>
        <td>
            Tên người nhận:</td>
        <td>
            <asp:TextBox ID="txtTenNguoiNhan" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            Địa điểm giao hàng:</td>
        <td>
            <asp:TextBox ID="txtDiaChiGiaoHang" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td style="vertical-align: top">
            Ghi chú:</td>
        <td>
            <asp:TextBox ID="txtGhiChu" runat="server" Height="100px" TextMode="MultiLine" 
                Width="300px"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td>
            &nbsp;</td>
        <td>
            <asp:ImageButton ID="ibDatMua" runat="server" ImageUrl="~/images/icons/button-datmua.png" OnClick="ibDatMua_Click"  />
        </td>
    </tr>
</table>
<asp:GridView ID="GridView1" runat="server" CellPadding="4" ForeColor="#333333" 
    GridLines="None" HorizontalAlign="Center">
    <AlternatingRowStyle BackColor="White" />
    <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
    <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
    <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
    <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
    <SortedAscendingCellStyle BackColor="#FDF5AC" />
    <SortedAscendingHeaderStyle BackColor="#4D0000" />
    <SortedDescendingCellStyle BackColor="#FCF6C0" />
    <SortedDescendingHeaderStyle BackColor="#820000" />
</asp:GridView>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table align="center" cellpadding="5" cellspacing="0">
                <tr>
                    <td>
                        Mã đơn đặt hàng:</td>
                    <td>
                        <asp:Label ID="lblMaDDH" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Người đặt hàng:</td>
                    <td>
                        <asp:Label ID="lblHoTenView2" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Thời điểm đặt hàng:</td>
                    <td>
                        <asp:Label ID="lblThoiDiemView2" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Tên người nhận:</td>
                    <td>
                        <asp:Label ID="lblTenNguoiNhanView2" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        Địa điểm giao hàng:</td>
                    <td>
                        <asp:Label ID="lblDiaDiemView2" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Ghi chú:</td>
                    <td class="style1">
                        <asp:Label ID="lblGhiChuView2" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="style1">
                        Tổng tiền:</td>
                    <td class="style1">
                        <asp:Label ID="lblTongTien" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="background-color: #0099FF; color: #FFFFCC; font-weight: bolder; text-align: center;">
                        DANH SÁCH MẶT HÀNG ĐÃ ĐẶT</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="GridView2" runat="server" BackColor="White" 
                            BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4">
                            <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
                            <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
                            <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
                            <RowStyle BackColor="White" ForeColor="#003399" />
                            <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                            <SortedAscendingCellStyle BackColor="#EDF6F6" />
                            <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
                            <SortedDescendingCellStyle BackColor="#D6DFDF" />
                            <SortedDescendingHeaderStyle BackColor="#002876" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>

