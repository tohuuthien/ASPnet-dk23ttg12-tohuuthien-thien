using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class SPTheoLoai : CommonPage
{
    phamhieucomputerDataContext db = new phamhieucomputerDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["idLoai"] != null)
            {
                string idLoai = Request.QueryString["idLoai"].ToString();
                loaisp loai = db.loaisps.SingleOrDefault(p => p.idLoai == int.Parse(idLoai));
                if (loai != null)//có
                {
                    //ghi thông tin loại
                    tenloai.InnerHtml = string.Format("Loại: <b> {0} có {1} sản phẩm.", loai.TenLoai, loai.sanphams.Count);

                    //hiển thị list sản phẩm
                    lvSPTheoLoai.DataSource = loai.sanphams.Select(p => new { p.idSP, p.TenSP, p.Gia, p.UrlHinh });
                    lvSPTheoLoai.DataBind();
                }
            }
            else if (Request.QueryString["Search"] != null)
            {
                var dssanpham = db.sanphams.Where(p => p.TenSP.Contains(Request.QueryString["Search"].ToString()));
                lvSPTheoLoai.DataSource = dssanpham;
                lvSPTheoLoai.DataBind();
                tenloai.InnerHtml = string.Format("Tìm kiếm theo từ khóa: <b>{0}</b>", Request.QueryString["Search"].ToString());
            }
            else
                Response.Redirect("~/Default.aspx");
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