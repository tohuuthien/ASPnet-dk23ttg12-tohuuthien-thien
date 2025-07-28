using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FrontEndMasterPage : System.Web.UI.MasterPage
{
    
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public void HienGH() // Khai báo dạng Public
    {
        
        WUC_GioHang.HienThiGioHang();
    }
    protected void btnSearch_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/SPTheoLoai.aspx?Search=" + txtSearch.Text);
    }
}
