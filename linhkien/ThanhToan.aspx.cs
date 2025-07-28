using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ThanhToan : PersonalPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //chuyển trang nếu giỏ hàng ko có
        if (this.GioHang.Count == 0)
            Response.Redirect("Default.aspx");
        if (!IsPostBack)
        {

            lblHoTen.Text = this.KhachHang.HoTen;
            lblThoiDiem.Text = DateTime.Now.ToString("dd/MM/yyyy HH:mm:ss");
            GridView1.DataSource = this.GioHang;
            GridView1.DataBind();
        }
    }

    protected void ibDatMua_Click(object sender, ImageClickEventArgs e)
    {
        phamhieucomputerDataContext db = new phamhieucomputerDataContext();
        //lưu vào csdl
        donhang ddh = new donhang
        {
            idUser = this.KhachHang.idUser,
            ThoiDiemDatHang = DateTime.Now,
            TenNguoiNhan = (txtTenNguoiNhan.Text.Length > 0) ? txtTenNguoiNhan.Text : this.KhachHang.HoTen,
            DiaDiemGiaoHang = (txtDiaChiGiaoHang.Text.Length > 0) ? txtDiaChiGiaoHang.Text : this.KhachHang.DiaChi,
            GhiChu = txtGhiChu.Text,
            trangthai = 0//mới đặt hàng

        };
        db.donhangs.InsertOnSubmit(ddh);
        db.SubmitChanges();

        //thêm chi tiết sản phẩm
        foreach (CartItem item in this.GioHang)
        {
            donhangchitiet dhct = new donhangchitiet
            {
                idDH = ddh.idDH,
                idSP = item.idSP,
                SoLuong = item.SoLuong,
                Gia = item.Gia
            };
            db.donhangchitiets.InsertOnSubmit(dhct);
        }
        db.SubmitChanges();
        //chuyển view
        MultiView1.ActiveViewIndex = 1;
        //hiển thị thông tin
        lblMaDDH.Text = ddh.idDH.ToString();
        lblHoTenView2.Text = this.KhachHang.HoTen;
        lblTenNguoiNhanView2.Text = ddh.TenNguoiNhan;
        lblThoiDiemView2.Text = ddh.ThoiDiemDatHang.ToString("dd/MM/yyyy HH:mm:ss");
        lblDiaDiemView2.Text = ddh.DiaDiemGiaoHang;
        lblGhiChuView2.Text = ddh.GhiChu;
        lblTongTien.Text = "";
        //GridView2.DataSource = ddh.donhangchitiets;
        GridView2.DataSource = db.donhangchitiets.Where(p => p.idDH == ddh.idDH).Select(p => new { p.idSP, p.sanpham.TenSP, p.Gia, p.SoLuong, ThanhTien = p.Gia * p.SoLuong });
        GridView2.DataBind();
        //xóa session
        this.GioHang.Clear();//xóa giỏ hàng
        FrontEndMasterPage mp = this.Master as FrontEndMasterPage;
        mp.HienGH();

        //Gửi mail: sử dụng googlemailer
        //string noidung = "Quý khách đã đặt hàng thành công đơn hàng:" + ddh.idDH.ToString();
        //GoogleMailer.Send(this.KhachHang.Email, "Thông tin đơn đặt hàng", noidung);
    }
}