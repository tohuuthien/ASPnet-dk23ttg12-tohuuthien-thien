<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/BackEndMasterPage.master" AutoEventWireup="true" CodeFile="QLLoaiSP.aspx.cs" Inherits="Admin_QLLoaiSP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphNoiDung" Runat="Server">
    <h2 class="nhomsp">QUẢN LÝ LOẠI SẢN PHẨM</h2>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="1">
    <asp:View ID="View1" runat="server">
        <table align="center">
            <tr>
                <td>
                    Mã loại</td>
                <td>
                    <asp:TextBox ID="txtMaLoai" runat="server" ReadOnly="True"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Tên loại</td>
                <td>
                    <asp:TextBox ID="txtTenLoai" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Tên loại không dấu</td>
                <td>
                    <asp:TextBox ID="txtTenLoaiKhongDau" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Chủng loại</td>
                <td>
                    <asp:DropDownList ID="ddlChungLoai" runat="server">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td>
                    Thứ tự</td>
                <td>
                    <asp:TextBox ID="txtThuTu" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td>
                    Hiển thị</td>
                <td>
                    <asp:RadioButtonList ID="rblAnHien" runat="server" 
                        RepeatDirection="Horizontal">
                        <asp:ListItem Value="0">Ẩn</asp:ListItem>
                        <asp:ListItem Selected="True" Value="1">Hiện</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:ImageButton ID="ibThem" runat="server" Height="30px" ImageUrl="~/images/icons/button-them.png" OnClick="ibThem_Click" />
                    <asp:ImageButton ID="ibXoa" runat="server" Height="30px" ImageUrl="~/images/icons/button-xoa.png" OnClick="ibXoa_Click" />
                    <asp:ImageButton ID="ibSua" runat="server" Height="30px" ImageUrl="~/images/icons/button-sua.png" OnClick="ibSua_Click" />
                </td>
            </tr>
            <tr>
                <td align="center" colspan="2">
                    <asp:ImageButton ID="ibDanhSach" runat="server" Height="30px" ImageUrl="~/images/icons/button-danhsachloaisp.png" OnClick="ibDanhSach_Click" />
                </td>
            </tr>
        </table>
    </asp:View>
    <asp:View ID="View2" runat="server">
        <asp:GridView ID="GridView1" runat="server" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" BackColor="White" BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" HorizontalAlign="Center">
            <Columns>
                <asp:CommandField SelectText="Chi tiết" ShowSelectButton="True" >
                <ControlStyle Width="60px" />
                </asp:CommandField>
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
    </asp:View>
</asp:MultiView>
</asp:Content>

