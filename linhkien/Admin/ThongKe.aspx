<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/BackEndMasterPage.master" AutoEventWireup="true" CodeFile="ThongKe.aspx.cs" Inherits="Admin_ThongKe" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphNoiDung" Runat="Server">
    <h2 class="nhomsp">THỐNG KÊ DOANH SỐ</h2>
    <table align="center" cellpadding="4" cellspacing="0">
        <tr>
            <td>Từ ngày:
    <asp:TextBox ID="txtTuNgay" runat="server"></asp:TextBox>
&nbsp; đến ngày:
    <asp:TextBox ID="txtDenNgay" runat="server"></asp:TextBox>
&nbsp;<asp:ImageButton ID="ibXem" runat="server" Height="30px" ImageUrl="~/images/icons/button-xemdoanhthu.png" OnClick="ibXem_Click" />
            </td>
        </tr>
        <tr>
            <td>
    <asp:GridView ID="GridView1" runat="server" BackColor="White" 
        BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" HorizontalAlign="Center">
        <FooterStyle BackColor="#99CCCC" ForeColor="#003399" />
        <HeaderStyle BackColor="#003399" Font-Bold="True" ForeColor="#CCCCFF" />
        <PagerStyle BackColor="#99CCCC" ForeColor="#003399" HorizontalAlign="Left" />
        <RowStyle BackColor="White" ForeColor="#003399" />
        <SelectedRowStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
        <SortedAscendingCellStyle BackColor="#EDF6F6" />
        <SortedAscendingHeaderStyle BackColor="#0D4AC4" />
        <SortedDescendingCellStyle BackColor="#D6DFDF" />
        <SortedDescendingHeaderStyle BackColor="#002876" />
    </asp:GridView></td>
        </tr>
        <tr>
            <td style="font-weight: bolder; color: #FF0000; text-align: center;">
                Tổng tiền:
                <asp:Label ID="lblTongTien" runat="server"></asp:Label>
            </td>
        </tr>
    </table>
    
    
</asp:Content>

