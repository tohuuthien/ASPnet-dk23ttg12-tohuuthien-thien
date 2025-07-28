<%@ Page Title="" Language="C#" MasterPageFile="~/FrontEndMasterPage.master" AutoEventWireup="true" CodeFile="ChiTietSP.aspx.cs" Inherits="ChiTietSP" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <link href="css/ui-lightness/jquery-ui-1.10.4.min.css" rel="stylesheet" type="text/css" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="cphNoiDung" Runat="Server">
    <table cellpadding="5" cellspacing="0" class="auto-style1">
        <tr>
            <td align="center" bgcolor="#3399FF" colspan="2">
                <asp:Label ID="lblTenSP" runat="server" Font-Bold="True" Font-Size="Larger" 
                    ForeColor="Yellow"></asp:Label>
            </td>
        </tr>
        <tr>
            <td align="center" valign="top" width="220">
                <asp:Image ID="Image1" runat="server" Width="120px" />
                <br />
                Lượt xem:
                <asp:Label ID="lblLuotXem" runat="server"></asp:Label>
                <br />
                <asp:Label ID="lblGia" runat="server" CssClass="gia" Text="Label"></asp:Label>
                <br />
                <asp:ImageButton ID="ImageButton1" runat="server" 
                    ImageUrl="~/images/icons/muahang-button.png"  onclick="muahang_Click" />
            </td>
            <td valign="top">
                Mô tả sản phẩm:
                <asp:Label ID="lblMoTa" runat="server"></asp:Label>
            </td>
        </tr>
    </table>

    <%-- Phần Tab các nội dung --%>
    <div id="mytabs">
        <!-- Phần tiêu đề --> 
        <ul>
        <li><a href="#tskt">Thông số kỹ thuật</a></li>
        <%--<li><a href="#hinhanh">Hình ảnh</a></li>--%>
        <li><a href="#video">Video</a></li>
        <li><a href="#baiviet">Bài viết</a></li>
        <li><a href="#binhluan">Bình luận</a></li>
        </ul>
        <!-- Phần nội dung -->
        <div id="tskt">
            <asp:ListView ID="lvThongSoKT" runat="server">
                <ItemTemplate>
                   <table align="center" cellpadding="15" cellspacing="0"  border="1" >
        
        <tr>
            <td rowspan="6"> Bộ xử lý</td>
                <td>
                Hãng CPU</td>
                <td><%# Eval("hang_cpu") %></td>
        </tr>
        <tr>
            <td>
                Công nghệ CPU</td>
            <td><%# Eval("cong_nghe_cpu") %></td>
        </tr>
        <tr>
            <td>
                Loại CPU</td>
            <td><%# Eval("loai_cpu") %></td>
        </tr>
        <tr>
            <td>Tốc độ CPU</td>
            <td><%# Eval("toc_do_cpu") %></td>
        </tr>
        <tr>
            <td>Bộ nhớ đệm</td>
            <td><%# Eval("bo_nho_dem") %></td>
        </tr>
        <tr>
            <td>Tốc độ tối đa</td>
            <td><%# Eval("toc_do_toi_da") %></td>
        </tr>
        
        <tr>
            <td rowspan="3">
                Bo mạch</td>
            <td>Chipset</td>
            <td><%# Eval("chipset") %></td>
        </tr>
        <tr>
            <td>Tốc độ Bus</td>
            <td><%# Eval("toc_do_bus_chip") %></td>
        </tr>
        <tr>
            <td>Hỗ trợ RAM tối đa</td>
            <td><%# Eval("ho_tro_ram_toi_da") %></td>
        </tr>
        
        <tr>
         <td rowspan="3">Bộ nhớ</td>
            <td>Dung lượng RAM</td>
            <td><%# Eval("dung_luong_ram") %></td>
        </tr>
        <tr>
            <td>Loại RAM</td>
            <td><%# Eval("loai_ram") %></td>
        </tr>
        <tr>
            <td>Tốc độ Bus</td>
            <td><%# Eval("toc_do_bus_ram") %></td>
        </tr>
        <tr>
            <td rowspan="2">Đãi cứng</td>
            <td>Loại ổ đĩa</td>
            <td><%# Eval("loai_o_dia") %></td>
        </tr>
        <tr>
            <td>Dung lượng đĩa cứng</td>
            <td><%# Eval("dung_luong_o_dia") %></td>
        </tr>
        
        <tr>
            <td rowspan="4">Màn hình</td>
            <td>Kích thước màn hình</td>
            <td><%# Eval("kich_thuoc_man_hinh") %></td>
        </tr>
        <tr>
            <td>Độ phân giải</td>
            <td><%# Eval("do_phan_giai") %></td>
        </tr>
        <tr>
            <td>Công nghệ màn hình</td>
            <td><%# Eval("cong_nghe_man_hinh") %></td>
        </tr>
         <tr>
            <td>Công nghệ màn hình</td>
            <td><%# Eval("cong_nghe_man_hinh") %></td>
        </tr>
         <tr>
            <td>Cảm ứng</td>
            <td><%# Eval("cam_ung") %></td>
        </tr>
        <tr>
            <td rowspan="3">Đồ họa</td>
            <td>Chipset đồ họa</td>
            <td><%# Eval("chipset_do_hoa") %></td>
        </tr>
        <tr>
            <td>Bộ nhớ đồ họa</td>
            <td><%# Eval("bo_nho_do_hoa") %></td>
        </tr>
        <tr>
            <td>Thiết kế card</td>
            <td><%# Eval("thiet_ke_card") %></td>
        </tr>
         <tr>
            <td rowspan="3">Âm thanh</td>
            <td>Kênh âm thanh</td>
            <td><%# Eval("kenh_am_thanh") %></td>
        </tr>
        <tr>
            <td>Công nghệ</td>
            <td><%# Eval("cong_nghe_am_thanh") %></td>
        </tr>
        <tr>
            <td>Thông tin thêm</td>
            <td><%# Eval("thong_tin_them_am_thanh") %></td>
        </tr>
          <tr>
            <td rowspan="2">Đĩa quang</td>
            <td>Tích hợp</td>
            <td><%# Eval("tich_hop_dia_quang") %></td>
        </tr>
                       <tr>
            <td>Loại đĩa quang</td>
            <td><%# Eval("loai_dia_quang") %></td>
        </tr>
                       <tr>
            <td rowspan="2">Tính năng mở rộng và cổng giao tiếp</td>
            <td>Tính năng mở rộng</td>
            <td><%# Eval("tinh_nang_mo_rong") %></td>
        </tr>
                       <tr>
            <td>Cổng giao tiếp</td>
            <td><%# Eval("cong_giao_tiep") %></td>
        </tr>

                       <tr>
            <td rowspan="3">Giao tiếp mạng</td>
            <td>Lan</td>
            <td><%# Eval("cong_lan") %></td>
        </tr>
                       <tr>
            <td>Chuẩn wifi</td>
            <td><%# Eval("chuan_wifi") %></td>
        </tr>
                       <tr>
            <td>Kết nối không dây khác</td>
            <td><%# Eval("ket_noi_khong_day_khac") %></td>
        </tr>
                       <tr>
            <td rowspan="2">Card Reader</td>
            <td>Đọc thẻ nhớ</td>
            <td><%# Eval("doc_the_nho") %></td>
        </tr>
                       <tr>
            <td>Khe đọc thẻ nhớ</td>
            <td><%# Eval("khe_doc_the_nho") %></td>
        </tr>
                    <tr>
            <td rowspan="2">Webcam</td>
            <td>Độ phân giải WC</td>
            <td><%# Eval("do_phan_giai_wc") %></td>
        </tr>
                       <tr>
            <td>Thông tin thêm</td>
            <td><%# Eval("thong_tin_them_wc") %></td>
        </tr>   
                       <tr>
            <td rowspan="2">PIN/Battery</td>
            <td>Thông tin PIN</td>
            <td><%# Eval("thong_tin_pin") %></td>
        </tr>
                       <tr>
            <td>Thời gian sử dụng</td>
            <td><%# Eval("thoi_gian_su_dung") %></td>
        </tr>
                       <tr>
            <td rowspan="2">Hệ điều hành, phần mềm sẵn có/OS</td>
            <td>HĐH kèm theo máy</td>
            <td><%# Eval("hdh_kem_theo") %></td>
        </tr>
                       <tr>
            <td>Phần mềm sẵn có</td>
            <td><%# Eval("phan_mem_co_san") %></td>
        </tr>
                       <tr>
            <td rowspan="2">Kích thước & trọng lượng</td>
            <td>Kích thước</td>
            <td><%# Eval("kich_thuoc") %></td>
        </tr>
                       <tr>
            <td>Trọng lượng (Kg)/td>
            <td><%# Eval("trong_luong") %></td>
        </tr>
                       
    </table>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <div id="binhluan">
            <asp:ListView ID="lvBinhLuan" runat="server">
                <ItemTemplate>
                <!--Add code HTML 5 gen vào-->
                <!--coi bài trong sách: ứng dụng Facebook vào web. Luu y: thay data-href mặc định =  data-href='<%# Eval("DiaChiWeb") %>'-->
            <!--End code HTML 5 gen-->
                    <%--<div>
            <h3><%# Eval("tieude") %></h3>
            <h4 align="right"><%# Eval("hoten") %> <%# Eval("ngay_comment", "{0:dd/MM/yyyy hh:mm:ss}")%></h4>
            <%# Eval("noidung") %>
        </div>--%>
                    <div align="center">
                        <script>    (function (d, s, id) {
                            var js, fjs = d.getElementsByTagName(s)[0];
                            if (d.getElementById(id)) return;
                            js = d.createElement(s); js.id = id;
                            js.src = "//connect.facebook.net/en_US/sdk.js#xfbml=1&appId=834879946536745&version=v2.0";
                            fjs.parentNode.insertBefore(js, fjs);
    }(document, 'script', 'facebook-jssdk'));

                        </script>
                        <div class="fb-like" data-href='<%# Eval("DiaChiWeb") %>' data-width="350" data-layout="standard" data-action="like" data-show-faces="true" data-share="true"></div>
                        <div class="fb-comments" data-href='<%# Eval("DiaChiWeb") %>' data-width="350" data-numposts="5" data-colorscheme="light"></div>
                        </div>
                </ItemTemplate>
            </asp:ListView>
            
        </div>
        <div id="video">
            <asp:ListView ID="lvVideo" runat="server">
                <ItemTemplate>
                    <iframe width="640" height="360" src="//www.youtube.com/embed/<%# Eval("value") %>" frameborder="0" allowfullscreen></iframe>
                </ItemTemplate>
            </asp:ListView>
        </div>
        <%--<div id="hinhanh">
            <asp:ListView ID="lvHinhAnh" runat="server">
                <ItemTemplate>
                   <%-- <img src= 'upload/sanpham/hinhphu/<%# Eval("urlHinh") %>' />
                </ItemTemplate>
            </asp:ListView>
        </div>--%>
        <div id="baiviet">
            <asp:Label ID="lblBaiViet" runat="server" Text="Label"><%# Eval("baiviet") %></asp:Label>
            
        </div>
    </div>
    <script src="js/jquery-ui-1.10.4.js" type="text/javascript"></script>
    <script>
        $(document).ready(function () {
            $("#mytabs").tabs({ event: "mouseover" });
        });
    </script>
</asp:Content>

