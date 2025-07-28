using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_QLDonHang : AdminPage
{
    phamhieucomputerDataContext db = new phamhieucomputerDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {

            ddlTinhTrang.DataSource = db.trangthais;
            ddlTinhTrang.DataTextField = "tentt";
            ddlTinhTrang.DataValueField = "matt";
            ddlTinhTrang.DataBind();
            loaddsHD();
        }
    }

    private void loaddsHD()
    {

        //sắp xếp thời điểm đặt hàng tính theo ngày
        var dshoadon = db.donhangs.OrderByDescending(p => p.ThoiDiemDatHang).Select(p => new { p.idDH, p.ThoiDiemDatHang, NguoiMua = p.user.HoTen, TongTien = p.donhangchitiets.Sum(q => q.Gia * q.SoLuong), TrangThai=p.trangthai1.tentt});
        gvDanhSachDH.DataSource = dshoadon;
        gvDanhSachDH.DataBind();
        
    }

    protected void ibDanhSach_Click(object sender, ImageClickEventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void gvDanhSachDH_SelectedIndexChanged(object sender, EventArgs e)
    {
        //xác định idDH
        int idDH = int.Parse(gvDanhSachDH.SelectedRow.Cells[2].Text);
        donhang ddh = db.donhangs.SingleOrDefault(p => p.idDH == idDH);
        if (ddh != null)//có
        {
            //hiển thị
            lblMaDH.Text = ddh.idDH.ToString();
            lblHoTen.Text = ddh.user.HoTen;
            lblThoiDiem.Text = ddh.ThoiDiemDatHang.ToString();
            txtTenNguoiNhan.Text = ddh.TenNguoiNhan;
            txtDiaChiGiaoHang.Text = ddh.DiaDiemGiaoHang;
            txtGhiChu.Text = ddh.GhiChu;
            ddlTinhTrang.SelectedValue = ddh.trangthai.ToString();
            lblTongTienView1.Text = db.donhangchitiets.Where(p => p.idDH == ddh.idDH).Sum(p => p.Gia * p.SoLuong).ToString("#,##0") + "vnđ";
            //danh sách hàng đã mua
            gvChiTietDH.DataSource = ddh.donhangchitiets.Select(p => new { p.idSP, p.sanpham.TenSP, p.Gia, p.SoLuong, ThanhTien = p.Gia * p.SoLuong });
            gvChiTietDH.DataBind();
            //chuyển view
            MultiView1.ActiveViewIndex = 0;
        }
    }
    
    protected void ibSua_Click(object sender, ImageClickEventArgs e)
    {
        donhang dh = db.donhangs.SingleOrDefault(p => p.idDH == int.Parse(lblMaDH.Text));
        if (dh != null)
        {
            dh.TenNguoiNhan = txtTenNguoiNhan.Text;
            dh.trangthai = int.Parse(ddlTinhTrang.SelectedValue);
            dh.DiaDiemGiaoHang =  txtDiaChiGiaoHang.Text;
            dh.GhiChu = txtGhiChu.Text;

            db.SubmitChanges();
        }
    }
    protected void ibXacNhan_Click(object sender, ImageClickEventArgs e)
    {
        //cập nhật đơn hàng
        int idDH = int.Parse(lblMaDH.Text);
        donhang ddh = db.donhangs.SingleOrDefault(p => p.idDH == idDH);
        if (ddh != null)
        {
            //nếu tình trạng chưa giao dịch thành công thì mới cho sửa -- xử lý

            ddh.TenNguoiNhan = txtTenNguoiNhan.Text;
            ddh.DiaDiemGiaoHang = txtDiaChiGiaoHang.Text;
            ddh.GhiChu = txtGhiChu.Text;
            ddh.trangthai = int.Parse(ddlTinhTrang.SelectedValue);
            ddh.idUser = KhachHang.idUser;//Lưu người sửa sau cùng

            db.SubmitChanges();
            //cập nhật lưới ds hóa đơn
            loaddsHD();
        }
    }
}