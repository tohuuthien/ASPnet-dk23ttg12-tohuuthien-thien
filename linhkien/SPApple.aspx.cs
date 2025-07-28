using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SPApple : CommonPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        phamhieucomputerDataContext db = new phamhieucomputerDataContext();
        if (!IsPostBack)
        {

            lvSPCaoCap.DataSource = db.sanphams.Where(p => p.idLoai==1);
            lvSPCaoCap.DataBind();

        }
    }
    protected void muahang_Click(object sender, ImageClickEventArgs e)
    {
        //lấy lại mã sản phẩm đang chọn
        ImageButton ib = sender as ImageButton;
        int idSP = int.Parse(ib.CommandArgument);

        themvaogiahang(idSP);
        // Cập nhật giỏ hàng
        FrontEndMasterPage MP = this.Master as FrontEndMasterPage; // Truy suất vào trang MasterPage
        MP.HienGH();
    }
}