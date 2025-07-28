using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_ThongKe : System.Web.UI.Page
{
    phamhieucomputerDataContext db = new phamhieucomputerDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void ibXem_Click(object sender, ImageClickEventArgs e)
    {
        DateTime tu = DateTime.Now.AddYears(-1);
        try
        {
            tu = DateTime.ParseExact(txtTuNgay.Text, "dd/MM/yyyy", null);
        }
        catch { }
        DateTime den = DateTime.Now;
        try
        {
            den = DateTime.ParseExact(txtDenNgay.Text, "dd/MM/yyyy", null);
        }
        catch { }

        var ds = from cthd in db.donhangchitiets
                 where cthd.donhang.ThoiDiemDatHang >= tu && cthd.donhang.ThoiDiemDatHang <= den
                 //doanh thu theo sản phẩm
                 group cthd by cthd.sanpham into g
                 select new
                 {
                     g.Key.idSP,
                     g.Key.TenSP,
                     DoanhSo = g.Sum(p => p.Gia * p.SoLuong),
                     
                 };
        GridView1.DataSource = ds;
        GridView1.DataBind();
        lblTongTien.Text = db.donhangchitiets.Sum(p => p.Gia * p.SoLuong).ToString("#,##0") + " vnđ";
    }
}