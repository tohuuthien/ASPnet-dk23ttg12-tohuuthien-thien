using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChiTietSP : CommonPage
{
    phamhieucomputerDataContext db = new phamhieucomputerDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["idSP"] == null)
            {
                Response.Redirect("Default.aspx");
                return;
            }
            int idSP = int.Parse(Request.QueryString["idSP"].ToString());
            sanpham sp = db.sanphams.SingleOrDefault(p => p.idSP == idSP);

            if (sp != null)//có
            {
                //đổ dữ liệu vào
                sp.SoLanXem += 1;//tăng số lần xem lên 1
                db.SubmitChanges();//cập nhật số lần xem
                lblTenSP.Text = sp.TenSP;
                lblLuotXem.Text = sp.SoLanXem.ToString();
                lblGia.Text = sp.Gia.ToString("#,##0") + " vnđ";
                lblMoTa.Text = sp.MoTa.Replace("\n", "<br>");
                Image1.ImageUrl = "~/upload/sanpham/hinhchinh/" + sp.UrlHinh;
                ImageButton1.CommandArgument = sp.idSP.ToString();// gắn commandargument để xử lý nút mua hàng

                //lvHinhAnh.DataSource = sp.sanpham_hinhs.Where(p => p.idSP == idSP && p.anhien == 1).OrderBy(p => p.stt).Select(p => new { urlHinh = p.urlHinh });
                //lvHinhAnh.DataBind();

                lvThongSoKT.DataSource = sp.sanpham_thuoctinh_laptops.Select(p => new { p.bo_nho_dem, p.bo_nho_do_hoa,p.cam_ung, p.chipset, p.chipset_do_hoa, p.chuan_wifi, p.cong_giao_tiep, p.cong_lan, p.cong_nghe_am_thanh, p.cong_nghe_cpu, p.cong_nghe_man_hinh, p.do_phan_giai, p.do_phan_giai_wc, p.doc_the_nho, p.dung_luong_o_dia, p.dung_luong_ram, p.hang_cpu, p.hdh_kem_theo, p.ho_tro_ram_toi_da, p.kenh_am_thanh, p.ket_noi_khong_day_khac,p.khe_doc_the_nho,p.kich_thuoc,p.kich_thuoc_man_hinh,p.loai_cpu,p.loai_dia_quang,p.loai_o_dia,p.loai_ram, p.phan_mem_co_san,p.thiet_ke_card,p.thoi_gian_su_dung,p.thong_tin_pin,p.thong_tin_them_am_thanh,p.thong_tin_them_wc,p.tich_hop_dia_quang,p.tinh_nang_mo_rong,p.toc_do_bus_chip,p.toc_do_bus_ram,p.toc_do_cpu,p.toc_do_toi_da,p.trong_luong });
                lvThongSoKT.DataBind();

                lvVideo.DataSource = sp.sanpham_youtubes.Select(p => new { value = p.value });
                lvVideo.DataBind();


                lblBaiViet.Text = sp.baiviet;
                //lvbaiviet.DataBind();
                //xử lý nút share, comment trong facebook
                List<XYZ> lstBC = new List<XYZ>();
                lstBC.Add(
                new XYZ
                {
                    DiaChiWeb = Request.Url.AbsoluteUri
                }
                );
                lvBinhLuan.DataSource = lstBC;
                lvBinhLuan.DataBind();
            }
        }
    } //end page load
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
class XYZ
{
    public string DiaChiWeb { get; set; }
}