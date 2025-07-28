<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEndMasterPage.master" AutoEventWireup="true" CodeFile="GioHang.aspx.cs" Inherits="GioHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphNoiDung" Runat="Server">
    <h2 class="nhomsp"> Giỏ hàng</h2>
    </br>

    <table align="center" cellpadding="4" cellspacing="0">
        <tr>
            <td>

    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" OnRowDeleting="GridView1_RowDeleting" CellPadding="4" ForeColor="#333333" GridLines="None">
        <AlternatingRowStyle BackColor="White" />
        <Columns>
            <asp:BoundField DataField="idSP" HeaderText="Mã SP" />
            <asp:HyperLinkField DataNavigateUrlFields="idSP" DataNavigateUrlFormatString="ChiTietSP.aspx?idSP={0}" DataTextField="TenSP" HeaderText="Tên SP" />
            <asp:TemplateField HeaderText="Số lượng">
                <ItemTemplate>
                    <asp:TextBox ID="txtSoLuong" runat="server" Width="30px" Text='<%# Eval("SoLuong") %>'></asp:TextBox>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="GIa" HeaderText="Đơn giá" />
            <asp:BoundField DataField="ThanhTien" HeaderText="Thành tiền" />
            <asp:CommandField DeleteText="Bỏ chọn" ShowDeleteButton="True" />
        </Columns>
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
    
            </td>
        </tr>
        <tr>
            <td>
    
    <asp:ImageButton ID="ibXoa" runat="server" ImageUrl="~/images/icons/button-xoagiohang.png" OnClick="ibXoa_Click" Height="35px" />
    <asp:ImageButton ID="ibCapNhat" runat="server" ImageUrl="~/images/icons/button-capnhat.png" OnClick="ibCapNhat_Click" Height="35px" />
    <asp:ImageButton ID="ibTiepTuc" runat="server" ImageUrl="~/images/icons/button-tieptucmuahang.png" PostBackUrl="~/Default.aspx" Height="35px" />
    <asp:ImageButton ID="ibThanhToan" runat="server" ImageUrl="~/images/icons/button-thanhtoan.png" PostBackUrl="~/ThanhToan.aspx" Height="35px" />
    
            </td>
        </tr>
    </table>
    
</asp:Content>

