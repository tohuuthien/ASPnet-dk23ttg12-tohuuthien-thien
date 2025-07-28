using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class blocks_WUC_GioHang : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            HienThiGioHang();
        }
    }

    public void HienThiGioHang()
    {
        // Lấy thông tin giỏ hàng
        // ở class ComonPage đã tạo Property chứa GioHang
        // this.Page là trả về trang đang chứa Web User Control đó
        CommonPage p = this.Page as CommonPage;
        lblSanPham.Text = p.GioHang.Count.ToString();
        lblGiaTien.Text = p.GioHang.Sum(c => c.SoLuong * c.Gia).ToString("#,##0");

        // Nếu báo lỗi p = null thì ta cho tất cả các trang kế thừa ComonPage

        // Tiếp theo cho hiển thị trên MasterPage (qua MasterPage)
    }
}