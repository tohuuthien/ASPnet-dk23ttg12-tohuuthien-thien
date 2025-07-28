<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEndMasterPage.master" AutoEventWireup="true" CodeFile="SPTheoLoai.aspx.cs" Inherits="SPTheoLoai" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphNoiDung" Runat="Server">
    <h2 class="nhomsp" runat="server" id="tenloai">Loại: </h2>
    <asp:ListView ID="lvSPTheoLoai" runat="server">
    <ItemTemplate>
        <div class="motsp">
            <div class="tensp"><%# Eval("TenSP") %></div>
            <a href='ChiTietSP.aspx?idSP=<%# Eval("idSP") %>'>
                <img src='upload/sanpham/hinhchinh/<%# Eval("urlHinh") %>' width="80px" height="100px" />
            </a>
            <div class="gia"><%# Eval("Gia", "{0:#,##0} vnđ")%></div>
            <asp:ImageButton ID="ImageButton1" runat="server" onclick="muahang_Click" ImageUrl="~/images/icons/muahang-button.png" CommandArgument='<%# Eval("idSP") %>' CssClass="muangay"/>
        </div>
    </ItemTemplate>
    </asp:ListView>
</asp:Content>

