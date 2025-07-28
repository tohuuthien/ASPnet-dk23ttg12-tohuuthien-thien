using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_QLSanPham : AdminPage
{
    phamhieucomputerDataContext db = new phamhieucomputerDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            ddlChungLoai.DataSource = db.chungloais;
            ddlChungLoai.DataTextField = "TenCL";
            ddlChungLoai.DataValueField = "idCL";
            ddlChungLoai.DataBind();

            ddlChiTietCL.DataSource = db.chitietchungloais;
            ddlChiTietCL.DataTextField = "TenChiTietCL";
            ddlChiTietCL.DataValueField = "idchitietCL";
            ddlChiTietCL.DataBind();

            ddlLoai.DataSource = db.loaisps;
            ddlLoai.DataTextField = "TenLoai";
            ddlLoai.DataValueField = "idLoai";
            ddlLoai.DataBind();

            loadDSSP();
        }
    }

    private void loadDSSP()
    {
        GridView1.DataSource = db.sanphams.Select(p => new { p.idSP, p.TenSP, p.chungloai.TenCL,p.chitietchungloai.TenChiTietCL, p.loaisp.TenLoai, p.Gia, p.SoLuongTonKho, p.UrlHinh });//thiết kế thêm phần chi tiết cho cái gridview
        GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //xác định đang chọn sp nào
        int idSP = int.Parse(GridView1.SelectedRow.Cells[1].Text);
        sanpham sp = db.sanphams.SingleOrDefault(p => p.idSP == idSP);
        if (sp != null)//có
        {
            lblMaSP.Text = sp.idSP.ToString();
            txtTenSP.Text = sp.TenSP;
            txtTenKhongDau.Text = sp.TenSP_KhongDau;
            lblNgayCapNhat.Text = sp.NgayCapNhat.Value.ToString("dd/MM/yyyy HH:mm:ss");
            lblSoLanXem.Text = sp.SoLanXem.Value.ToString();
            lblTonKho.Text = sp.SoLuongTonKho.Value.ToString();
            txtGia.Text = sp.Gia.ToString();
            ckeMoTa.Text = sp.MoTa;
            ckeBaiViet.Text = sp.baiviet;
            txtGhiChu.Text = sp.GhiChu;
            ddlChungLoai.SelectedValue = sp.idCL.ToString();
            ddlChiTietCL.SelectedValue = sp.idchitietCL.ToString();
            ddlLoai.SelectedValue = sp.idLoai.ToString();
            rdbHienThi.SelectedValue = sp.AnHien.Value.ToString();
            //txtURLYoutube.Text = sp.sanpham_youtubes.Single().value;
            imgHinhChinh.ImageUrl = "~/upload/sanpham/hinhchinh/" + sp.UrlHinh;
            
            MultiView1.ActiveViewIndex = 0;
        }
    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        loadDSSP();
    }

    protected void ibDanhSach_Click(object sender, ImageClickEventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void ibThem_Click(object sender, ImageClickEventArgs e)
    {
        ibThem.Visible = false;
        ibThemMoi.Visible = true;
        txtTonKho.Visible = true;
        lblTonKho.Text = "";
        lblTonKho.Visible = false;
        
        
        txtTenSP.Text = txtTenKhongDau.Text = txtGia.Text = txtGhiChu.Text =  ckeMoTa.Text=ckeBaiViet.Text= "";
        
        //sanpham sp = new sanpham 
        //{
        //    TenSP =txtTenSP.Text,
        //};
    }
    
    protected void ibSua_Click(object sender, ImageClickEventArgs e)
    {
        //tìm sp để sửa
        sanpham sp = db.sanphams.SingleOrDefault(p => p.idSP == int.Parse(lblMaSP.Text));
        if (sp != null)// có
        {
            sp.TenSP = txtTenSP.Text;
            sp.TenSP_KhongDau = txtTenKhongDau.Text;
            sp.idCL = int.Parse(ddlChungLoai.SelectedValue);
            sp.idchitietCL = int.Parse(ddlChiTietCL.SelectedValue);
            sp.idLoai = int.Parse(ddlLoai.SelectedValue);
            sp.baiviet = ckeBaiViet.Text;
            sp.GhiChu = txtGhiChu.Text;
            sp.Gia = int.Parse(txtGia.Text);
            sp.MoTa = ckeMoTa.Text;
            //hình chính
            string duongdan = Server.MapPath("~/upload/sanpham/");
            if (fupHinhChinh.HasFile)
            {
                if (File.Exists(duongdan + "hinhchinh/" + sp.UrlHinh)) //nếu có file hình cũ
                {
                    File.Delete(duongdan + "hinhchinh/" + sp.UrlHinh); //thì xóa file hình cũ
                }
                //up hình mới
                fupHinhChinh.SaveAs(duongdan + "hinhchinh/" + fupHinhChinh.FileName);
                //cập nhật UrlHinh
                sp.UrlHinh = fupHinhChinh.FileName;
            }
            //hình phụ
            //giả sử thay hình phụ
            //lấy tập hợp tất cả các file
            //HttpFileCollection taphopfile = Request.Files;
            //int i = (fupHinhChinh.HasFile) ? 1 : 0;// Nếu đã có hình chính thì lấy vị trí 1, ngược lại thì lấy vị trí 0
            //for (; i < taphopfile.Count; i++)
            //{
            //    //Lưu tất cả hình
            //    taphopfile[i].SaveAs(duongdan + "hinhphu/" + taphopfile[i].FileName);
            //    sanpham_hinh sph = new sanpham_hinh
            //    {
            //        idSP = sp.idSP,
            //        urlHinh = taphopfile[i].FileName,
            //        anhien = 1,//hiện
            //        stt=1
            //    };
            //    db.sanpham_hinhs.InsertOnSubmit(sph);
                
            //}
            db.SubmitChanges();//cập nhật
            loadDSSP();
        }
    }

    protected void ibThemMoi_Click(object sender, ImageClickEventArgs e)
    {
        //xử lý cái upload file
        HttpFileCollection hfc = Request.Files;
        if (fupHinhChinh.HasFile)
            hfc[0].SaveAs(Server.MapPath("~/upload/sanpham/hinhchinh/") + Path.GetFileName(hfc[0].FileName));
        else
            hfc[0].SaveAs(Server.MapPath("~/upload/sanpham/hinhphu/") + Path.GetFileName(hfc[0].FileName));
        for (int i = 1; i < hfc.Count; i++)
        {
            HttpPostedFile cfile = hfc[i];
            if (cfile.ContentLength > 0)
            {
                cfile.SaveAs(Server.MapPath("~/upload/sanpham/hinhphu/") + Path.GetFileName(cfile.FileName));
            }
        }
        //thêm mới sản phẩm
        sanpham sp = new sanpham
        {
            TenSP = txtTenSP.Text,
            TenSP_KhongDau = txtTenKhongDau.Text,
            idLoai = int.Parse(ddlLoai.SelectedValue),
            idchitietCL=int.Parse(ddlChiTietCL.SelectedValue),
            idCL = int.Parse(ddlChungLoai.SelectedValue),
            MoTa = ckeMoTa.Text,
            baiviet= ckeBaiViet.Text,
            NgayCapNhat = DateTime.Now,
            Gia = int.Parse(txtGia.Text),
            UrlHinh = fupHinhChinh.FileName,
            SoLuongTonKho = int.Parse(txtTonKho.Text),
            GhiChu = txtGhiChu.Text,
            SoLanXem=0,
            SoLanMua=0,
            AnHien = int.Parse(rdbHienThi.SelectedValue)
        };
        db.sanphams.InsertOnSubmit(sp);
        db.SubmitChanges();

        ////thêm mới sản phẩm hình
        //for (int i = 1; i < hfc.Count; i++)
        //{
        //    HttpPostedFile cfile = hfc[i];
        //    if (cfile.ContentLength > 0)
        //    {
        //        sanpham_hinh sph = new sanpham_hinh
        //        {
        //            idSP = sp.idSP,
        //            urlHinh = cfile.FileName,
        //            anhien=1,
        //            stt=1

        //        };
        //        db.sanpham_hinhs.InsertOnSubmit(sph);
        //    }
        //}
        //db.SubmitChanges();
        MultiView1.ActiveViewIndex = 1;
        loadDSSP();
    }
    protected void ibXoa_Click(object sender, ImageClickEventArgs e)
    {
        sanpham sp = db.sanphams.SingleOrDefault(p => p.idSP == int.Parse(lblMaSP.Text));
        if (sp != null) //có
        {
            db.sanphams.DeleteOnSubmit(sp);
            db.SubmitChanges();
            MultiView1.ActiveViewIndex = 1;
            loadDSSP();
        }
    }
}