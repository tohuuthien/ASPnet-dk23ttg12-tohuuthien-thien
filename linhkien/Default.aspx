<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEndMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphNoiDung" Runat="Server">
    <h2 class="nhomsp">Sản phẩm cao cấp</h2>
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

    <h2 class="nhomsp">Sản phẩm trung cấp</h2>
    <asp:ListView ID="lvSPTrungCap" runat="server">
        <ItemTemplate>
            <div class="motsp">
                <div class="tensp"><%# Eval("TenSP") %></div>
                <a href='ChiTietSP.aspx?idSP=<%# Eval("idSP") %>'>
                    <img src='./upload/sanpham/hinhchinh/<%# Eval("urlHinh") %>' width="80px" height="100px" />
                </a>
                <div class="gia"><%#Eval("Gia","{0:#,##0} vnđ") %></div>
                <asp:ImageButton ID="ImageButton1" runat="server" onclick="muahang_Click" ImageUrl="~/images/icons/muahang-button.png" CommandArgument='<%# Eval("idSP") %>' CssClass="muangay"/>
            </div>
        </ItemTemplate>
    </asp:ListView>
    <div class="chan"></div>

    <h2 class="nhomsp">Sản phẩm phổ thông</h2>
    <asp:ListView ID="lvSPPhoThong" runat="server">
        <ItemTemplate>
            <div class="motsp">
                <div class="tensp"><%# Eval("TenSP") %></div>
                <a href='ChiTietSP.aspx?idSP=<%# Eval("idSP") %>'>
                    <img src='./upload/sanpham/hinhchinh/<%# Eval("urlHinh") %>' width="80px" height="100px" />
                </a>
                <div class="gia"><%#Eval("Gia","{0:#,##0} vnđ") %></div>
                <asp:ImageButton ID="ImageButton1" runat="server" onclick="muahang_Click" ImageUrl="~/images/icons/muahang-button.png" CommandArgument='<%# Eval("idSP") %>' CssClass="muangay"/>
            </div>
        </ItemTemplate>
    </asp:ListView>
    <div class="chan"></div>
</asp:Content>

