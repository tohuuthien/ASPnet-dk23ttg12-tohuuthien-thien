<%@ Control Language="C#" AutoEventWireup="true" CodeFile="WUC_HangSX.ascx.cs" Inherits="WUC_HangSX" %>
<div id="hangsx">
    <asp:ListView ID="lvLoaiSP" runat="server">
        <ItemTemplate>
            <a href='SPTheoLoai.aspx?idLoai=<%# Eval("idLoai") %>'>
                <%# Eval("TenLoai") %>(<%# Eval("SoSP") %>)</a>
        </ItemTemplate>
    </asp:ListView>
</div>