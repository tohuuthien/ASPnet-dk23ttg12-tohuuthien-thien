<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/BackEndMasterPage.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphNoiDung" Runat="Server">
    <h2 class="nhomsp"> Trang Quản Trị</h2>
    <div align="center">
        <h3>Chào <asp:Label ID="lblHoTen" runat="server"><%# Eval("HoTen") %></asp:Label> đã đến trang quản trị</h3>
    </div>
</asp:Content>

