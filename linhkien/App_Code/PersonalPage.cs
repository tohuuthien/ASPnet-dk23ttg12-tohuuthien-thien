using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for PersonalPage
/// </summary>
public class PersonalPage: CommonPage
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
    }
}