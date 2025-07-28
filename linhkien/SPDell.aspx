<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEndMasterPage.master" AutoEventWireup="true" CodeFile="SPDell.aspx.cs" Inherits="SPDell" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphNoiDung" Runat="Server">
    <h2 class="nhomsp">Sản phẩm Dell</h2>
    <asp:ListView ID="lvSPCaoCap" runat="server">
        <ItemTemplate>
            <div class="motsp">
                <div class="tensp"><%# Eval("TenSP") %></div>
                <a href='ChiTietSP.aspx?idSP=<%# Eval("idSP") %>'>
                    <img src='./upload/sanpham/hinhchinh/<%# Eval("urlHinh") %>' width="80px" height="100px" />
                </a>
                <div class="gia"><%#Eval("Gia","{0:#,##0} vnđ") %></div>
                <asp:ImageButton ID="ImageButton1" runat="server" onclick="muahang_Click" ImageUrl="~/images/icons/muahang-button.png" CommandArgument='<%# Eval("idSP") %>' CssClass="muangay"/>
                <%--<div class="nutdathang" id='<%# Eval("idSP") %>'>>Đặt hàng</div>--%>
                
            </div>
        </ItemTemplate>
    </asp:ListView>
    <div class="chan"></div>
</asp:Content>

