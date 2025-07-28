using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for AdminPage
/// </summary>
public class AdminPage: CommonPage
{
    protected void Page_PreInit(object sender, EventArgs e)
    {
        if (!this.DaDangNhap)//false
        {
            //Lưu lại trang yêu cầu trước đó
            Session["TrangYeuCau"] = Request.Url.AbsoluteUri;

            //chuyển trang yêu cầu đăng nhập
            Response.Redirect("~/ThongBao.aspx");
        }
        else//đã đăng nhập
        {
            if (KhachHang.idGroup == 0)//user
                Response.Redirect("~/Default.aspx");
            //sẽ xử lý cho loại user quản trị sau
        }
    }
}