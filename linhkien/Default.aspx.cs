using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class _Default : CommonPage
{
    phamhieucomputerDataContext db = new phamhieucomputerDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //Lấy 12 sản phẩm cao cấp giá > 20 triệu
            lvSPCaoCap.DataSource = db.sanphams.Where(p => p.Gia > 20000000).Take(12);
            lvSPCaoCap.DataBind();

            //Lấy 12 sản phẩm trung cấp giá từ 14 đến 20 triệu 
            lvSPTrungCap.DataSource = db.sanphams.Where(p => p.Gia >= 14000000 && p.Gia <= 20000000).Take(12);
            lvSPTrungCap.DataBind();

            //Lấy 12 sản phẩm phổ thông giá dưới 14 triệu
            lvSPPhoThong.DataSource = db.sanphams.Where(p => p.Gia < 14000000).Take(12);
            lvSPPhoThong.DataBind();
        }
         
    }
    protected void muahang_Click(object sender, ImageClickEventArgs e)
    {
        //lấy lại mã sản phẩm đang chọn
        ImageButton ib = sender as ImageButton;
        int idSP = int.Parse(ib.CommandArgument);

        ////kiểm tra xem idSP đã có trong giỏ hàng chưa
        //CartItem item = this.GioHang.SingleOrDefault(p => p.idSP == idSP);
        //if (item == null) //chưa có
        //{
        //    //thêm vào giỏ hàng
        //    sanpham sp = db.sanphams.SingleOrDefault(p => p.idSP == idSP);
        //    item = new CartItem
        //    {
        //        idSP = idSP,
        //        TenSP = sp.TenSP,
        //        Gia = sp.Gia,
        //        SoLuong = 1
        //    };
        //    this.GioHang.Add(item);
        //}
        //else//có rồi
        //{
        //    item.SoLuong += 1;
        //}
        themvaogiahang(idSP);
        // Cập nhật giỏ hàng
        FrontEndMasterPage MP = this.Master as FrontEndMasterPage; // Truy suất vào trang MasterPage
        MP.HienGH();
    }
}