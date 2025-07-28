<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/BackEndMasterPage.master" AutoEventWireup="true" CodeFile="QLDonHang.aspx.cs" Inherits="Admin_QLDonHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphNoiDung" Runat="Server">
    <h2 class="nhomsp">QUẢN LÝ ĐƠN HÀNG</h2>
    <br />
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="1" Visible="True">
        <asp:View ID="View1" runat="server">
            <table align="center" cellpadding="5" cellspacing="0">
                <tr>
                    <td>
                        Mã đơn hàng:</td>
                    <td>
                        <asp:Label ID="lblMaDH" runat="server" Font-Bold="True" Font-Size="15pt"></asp:Label>
                    </td>
                </tr>
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
                        Tình trạng:</td>
                    <td>
                        <asp:DropDownList ID="ddlTinhTrang" runat="server">
                        </asp:DropDownList>
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
                    <td class="style1">
                        Tổng tiền:</td>
                    <td class="style1">
                        <asp:Label ID="lblTongTienView1" runat="server"></asp:Label>
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
                    <td>
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
                        <asp:ImageButton ID="ibXacNhan" runat="server" Height="30px" ImageUrl="~/images/icons/button-xacnhan.png" OnClick="ibXacNhan_Click"/>
                        <asp:ImageButton ID="ibSua" runat="server" Height="30px" ImageUrl="~/images/icons/button-sua.png" OnClick="ibSua_Click" />
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
                        <asp:ImageButton ID="ibDanhSach" runat="server" Height="30px" ImageUrl="~/images/icons/button-danhsachdonhang.png" OnClick="ibDanhSach_Click"  />
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:GridView ID="gvChiTietDH" runat="server" CellPadding="4" 
                            ForeColor="#333333" GridLines="None">
                            <AlternatingRowStyle BackColor="White" />
                            <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
                            <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                            <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                            <SortedAscendingCellStyle BackColor="#FDF5AC" />
                            <SortedAscendingHeaderStyle BackColor="#4D0000" />
                            <SortedDescendingCellStyle BackColor="#FCF6C0" />
                            <SortedDescendingHeaderStyle BackColor="#820000" />
                        </asp:GridView>
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <asp:GridView ID="gvDanhSachDH" runat="server" BackColor="White" 
                BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                onselectedindexchanged="gvDanhSachDH_SelectedIndexChanged" HorizontalAlign="Center">
                <Columns>
                    <asp:CommandField SelectText="Chi Tiết" ShowSelectButton="True" >
                    <ControlStyle Width="60px" />
                    </asp:CommandField>
                    <asp:CommandField DeleteText="Xóa" ShowDeleteButton="True" />
                </Columns>
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
            <br />
            
        </asp:View>
    </asp:MultiView>
     
</asp:Content>

