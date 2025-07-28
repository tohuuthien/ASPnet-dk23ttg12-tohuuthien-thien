<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/BackEndMasterPage.master" AutoEventWireup="true" CodeFile="QLSanPham.aspx.cs" Inherits="Admin_QLSanPham" %>

<%@ Register assembly="CKEditor.NET" namespace="CKEditor.NET" tagprefix="CKEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphNoiDung" Runat="Server">
    <h2 class="nhomsp">QUẢN LÝ SẢN PHẨM</h2>
    <br/>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="1">
        <asp:View ID="View1" runat="server">
            <table align="center" cellpadding="5" cellspacing="0" style="width: 800px;">
                <tr>
                    <td style="width: 150px">
                        Mã sản phẩm:</td>
                    <td>
                        <asp:Label ID="lblMaSP" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        Tên sản phẩm:</td>
                    <td>
                        <asp:TextBox ID="txtTenSP" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        Tên không dấu:</td>
                    <td>
                        <asp:TextBox ID="txtTenKhongDau" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        Chủng loại:</td>
                    <td>
                        <asp:DropDownList ID="ddlChungLoai" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">Chi tiết chủng loại:</td>
                    <td>
                        <asp:DropDownList ID="ddlChiTietCL" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        Loại:</td>
                    <td>
                        <asp:DropDownList ID="ddlLoai" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px; vertical-align: top;">
                        Mô tả:</td>
                    <td>
                        <CKEditor:CKEditorControl ID="ckeMoTa" runat="server">
                        </CKEditor:CKEditorControl>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        Ngày cập nhật:</td>
                    <td>
                        <asp:Label ID="lblNgayCapNhat" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        Giá:</td>
                    <td>
                        <asp:TextBox ID="txtGia" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px; vertical-align: top;">
                        Hình chính:</td>
                    <td>
                        <asp:Image ID="imgHinhChinh" runat="server" Width="120px" />
                        <br />
                        <asp:FileUpload ID="fupHinhChinh" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px; vertical-align: top;">
                        Bài viết:</td>
                    <td>
                        <CKEditor:CKEditorControl ID="ckeBaiViet" runat="server">
                        </CKEditor:CKEditorControl>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        Số lần xem:</td>
                    <td>
                        <asp:Label ID="lblSoLanXem" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        Tồn kho:</td>
                    <td>
                        <asp:Label ID="lblTonKho" runat="server"></asp:Label>
                        <asp:TextBox ID="txtTonKho" runat="server" Visible="False"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        Ghi chú:</td>
                    <td>
                        <asp:TextBox ID="txtGhiChu" runat="server" TextMode="MultiLine"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        Số lần mua:</td>
                    <td>
                        <asp:Label ID="lblSoLanMua" runat="server"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        Hiển thị:</td>
                    <td>
                        <asp:RadioButtonList ID="rdbHienThi" runat="server" 
                            RepeatDirection="Horizontal" RepeatLayout="Flow">
                            <asp:ListItem Value="0">Ẩn</asp:ListItem>
                            <asp:ListItem Selected="True" Value="1">Hiện</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">
                        &nbsp;</td>
                    <td>
                        <asp:ImageButton ID="ibThem" runat="server" Height="30px" ImageUrl="~/images/icons/button-them.png" OnClick="ibThem_Click" />
                        <asp:ImageButton ID="ibThemMoi" runat="server" Height="30px" ImageUrl="~/images/icons/button-themmoi.png" OnClick="ibThemMoi_Click" Visible="False" />
                        <asp:ImageButton ID="ibXoa" runat="server" Height="30px" ImageUrl="~/images/icons/button-xoa.png" OnClick="ibXoa_Click" />
                        <asp:ImageButton ID="ibSua" runat="server" Height="30px" ImageUrl="~/images/icons/button-sua.png" OnClick="ibSua_Click" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 150px">&nbsp;</td>
                    <td>
                        <asp:ImageButton ID="ibDanhSach" runat="server" Height="30px" ImageUrl="~/images/icons/button-danhsachsanpham.png" OnClick="ibDanhSach_Click"  />
                    </td>
                </tr>
            </table>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                BorderColor="#3366CC" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
                HorizontalAlign="Center" AllowPaging="True" 
                onpageindexchanging="GridView1_PageIndexChanging" 
                onselectedindexchanged="GridView1_SelectedIndexChanged" AutoGenerateColumns="False">
                <Columns>
                    <asp:CommandField SelectText="Chi tiết" ShowSelectButton="True" >
                    <ControlStyle Width="60px" />
                    </asp:CommandField>
                    <asp:BoundField DataField="idSP" HeaderText="Mã SP" />
                    <asp:BoundField DataField="TenSP" HeaderText="Tên sản phẩm" />
                    <asp:BoundField DataField="TenCL" HeaderText="Chủng loại" />
                    <asp:BoundField DataField="TenChiTietCL" HeaderText="Chi tiết chủng loại" />
                    <asp:BoundField DataField="TenLoai" HeaderText="Loại" />
                    <asp:BoundField DataField="Gia" DataFormatString="{0:#,##0} " HeaderText="Giá" />
                    <asp:BoundField DataField="SoLuongTonKho" HeaderText="Số lượng" />
                    <asp:TemplateField HeaderText="Hình">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("urlHinh", "~/upload/sanpham/hinhchinh/{0}") %>' Width="80px" />
                        </ItemTemplate>
                    </asp:TemplateField>
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

