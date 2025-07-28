using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class GioHang : CommonPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            hienthi();
        }
    }

    private void hienthi()
    {
        GridView1.DataSource = GioHang;
        GridView1.DataBind();

        // Cập nhật WUC_GioHang
        FrontEndMasterPage mp = this.Master as FrontEndMasterPage;
        mp.HienGH();
    }
    
    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        // Xoá dòng SP đang chọn
        this.GioHang.RemoveAt(e.RowIndex);
        hienthi();
    }
    

    protected void ibXoa_Click(object sender, ImageClickEventArgs e)
    {
        // Xoá giỏ hàng
        this.GioHang.Clear(); // Hoặc dùng Session["MatHang"] = null

        // Cập nhật gridview
        hienthi();
    }
    protected void ibCapNhat_Click(object sender, ImageClickEventArgs e)
    {
        // Cập nhật khi ta thay đổi trực tiếp cột SoLuong trong giỏ hàng

        // Duyệt qua từng dòng trong Gridview
        for (int i = 0; i < GridView1.Rows.Count; i++)
        {
            // Tìm cột SoLuong
            int SL = int.Parse((GridView1.Rows[i].FindControl("txtSoLuong") as TextBox).Text);
            this.GioHang[i].SoLuong = SL;
        }
        hienthi();
    }
}