using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class blocks_WUC_Login : System.Web.UI.UserControl
{
    phamhieucomputerDataContext db = new phamhieucomputerDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            hienthiview();
    }

    private void hienthiview()
    {
        //Lưu session nguyên cả KhachHang
        if (Session["NguoiDung"] != null)
        {
            MultiView1.ActiveViewIndex = 1;

            //lấy thông tin
            user u = Session["NguoiDung"] as user;
            hlHoTen.Text = u.HoTen;

            //hình có hay không
            if (u.Hinh != null && u.Hinh.Length > 0)//có hình
                ibHinh.ImageUrl = "~/upload/khachhang/" + u.Hinh;
            else //ko có hình
            {
                ibHinh.ImageUrl = "~/upload/khachhang/" + ((u.GioiTinh == 1) ? "user_male.png" : "user_female.png");
            }
            // không cho user thấy link
            hlQuanTri.Visible = (u.idGroup != 0);
        }
        else //chưa đăng nhập
        {
            MultiView1.ActiveViewIndex = 0;
        }
    }
    protected void ibDangNhap_Click(object sender, ImageClickEventArgs e)
    {
        string pass_hash = FormsAuthentication.HashPasswordForStoringInConfigFile(txtPass.Text, "MD5");
        user u = db.users.SingleOrDefault(p => p.Username == txtUser.Text && p.Password == pass_hash);
        if (u != null) //có --> thành công
        {
            //kiểm tra đã active chưa
            if (u.Active == 0)
                lblThongBao.Text = "Chưa active";
            else
            {
                Session["NguoiDung"] = u;
                //nếu có trang yêu cầu trước đó thì chuyển trang
                if (Session["TrangYeuCau"] != null)
                {
                    Response.Redirect(Session["TrangYeuCau"].ToString());
                }
            }
            hienthiview();
        }
        else
        {
            lblThongBao.Text = "Sai tài khoản hoặc mật khẩu";
            txtUser.Text = txtPass.Text = "";
            txtUser.Focus();
        }
    }
    protected void lbDangXuat_Click(object sender, EventArgs e)
    {
        Session.Remove("NguoiDung");
        Response.Redirect("~/Default.aspx");
    }
}