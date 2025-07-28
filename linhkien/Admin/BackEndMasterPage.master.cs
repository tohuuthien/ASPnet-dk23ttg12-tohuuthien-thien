using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_BackEndMasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void lbDangXuat_Click(object sender, EventArgs e)
    {
        //xóa tất cả session do người dùng định nghĩa
        Session.RemoveAll();
        //chuyển trang
        Response.Redirect("~/Default.aspx");
    }
}
