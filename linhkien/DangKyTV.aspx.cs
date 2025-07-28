using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DangKyTV : CommonPage
{
    phamhieucomputerDataContext db = new phamhieucomputerDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
    {
        //tìm xem đã có user chưa
        user u = db.users.SingleOrDefault(p => p.Username == args.Value);
        //u == null: chưa có --> dc phép đăng ký
        args.IsValid = (u == null);
    }

    protected void ibDangKy_Click(object sender, ImageClickEventArgs e)
    {
        //tạo đối tượng
        if (IsValid)// server hợp lệ
        {
            string pass_has = FormsAuthentication.HashPasswordForStoringInConfigFile(txtMatKhau.Text, "MD5");
            user u = new user
            {
                HoTen = txtHoTen.Text,
                Username = txtTenDangNhap.Text,
                Password = pass_has,
                DiaChi = txtDiaChi.Text,
                Dienthoai = txtDienThoai.Text,
                Email = txtEmail.Text,
                NgayDangKy = DateTime.Now,
                idGroup = 0, //kiem tra sau
                NgaySinh = DateTime.Parse(txtNgaySinh.Text),
                GioiTinh = decimal.Parse(rdbGioiTinh.SelectedValue),
                Active = 0, //cần phải mở email active
                Expiration = 0,//chưa hết hạn
                Hinh = fupHinh.FileName
            };
            //upload hình
            if (fupHinh.HasFile)
            {
                fupHinh.SaveAs(Server.MapPath("~/upload/khachhang/") + fupHinh.FileName);
            }
            try
            {
                db.users.InsertOnSubmit(u);
                db.SubmitChanges();
                lblThongBao.Text = "Bạn đã đăng ký thành công";
                txtHoTen.Text = txtTenDangNhap.Text = txtMatKhau.Text = txtNhapLaiMatKhau.Text = txtDiaChi.Text = txtDienThoai.Text = txtEmail.Text = txtNgaySinh.Text = "";
            }
            catch
            {
                lblThongBao.Text = "Có lỗi xảy ra. Đăng ký thất bại";
            }
            //xóa thông tin đã đăng ký
            
        }
    }
    protected void ibLamLai_Click(object sender, ImageClickEventArgs e)
    {
        txtHoTen.Text = txtTenDangNhap.Text = txtMatKhau.Text = txtNhapLaiMatKhau.Text = txtDiaChi.Text = txtDienThoai.Text = txtEmail.Text = txtNgaySinh.Text = "";
    }
}