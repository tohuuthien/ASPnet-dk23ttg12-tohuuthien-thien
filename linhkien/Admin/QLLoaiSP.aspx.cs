using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_QLLoaiSP : System.Web.UI.Page
{
    phamhieucomputerDataContext db = new phamhieucomputerDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            fillGrid();
            ddlChungLoai.DataSource = db.chungloais;
            ddlChungLoai.DataTextField = "TenCL";
            ddlChungLoai.DataValueField = "idCL";
            ddlChungLoai.DataBind();
        }
    }

    private void fillGrid()
    {
        GridView1.DataSource = db.loaisps;
        GridView1.DataBind();
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        //xác định mã loại
        string idLoai = GridView1.SelectedRow.Cells[1].Text;
        //lấy loại (nếu có)
        loaisp losp = db.loaisps.SingleOrDefault(p => p.idLoai == int.Parse(idLoai));
        if (losp != null)
        {
            txtMaLoai.Text = losp.idLoai.ToString();
            txtTenLoai.Text = losp.TenLoai;
            txtTenLoaiKhongDau.Text = losp.TenLoai_KhongDau;
            txtThuTu.Text = losp.ThuTu.ToString();
            rblAnHien.SelectedValue = losp.AnHien.ToString();
            ddlChungLoai.SelectedValue = losp.idCL.ToString();
            MultiView1.ActiveViewIndex = 0;
        }
    }
    protected void ibDanhSach_Click(object sender, ImageClickEventArgs e)
    {
        MultiView1.ActiveViewIndex = 1;
    }
    protected void ibXoa_Click(object sender, ImageClickEventArgs e)
    {
        //lấy loại (nếu có)
        loaisp losp = db.loaisps.SingleOrDefault(p => p.idLoai == int.Parse(txtMaLoai.Text));
        if (losp != null)
        {
            db.loaisps.DeleteOnSubmit(losp);
            db.SubmitChanges();
            MultiView1.ActiveViewIndex = 1;
            fillGrid();
        }
    }
    protected void ibSua_Click(object sender, ImageClickEventArgs e)
    {
        //lấy loại (nếu có)
        loaisp losp = db.loaisps.SingleOrDefault(p => p.idLoai == int.Parse(txtMaLoai.Text));
        if (losp != null)
        {
            losp.TenLoai = txtTenLoai.Text;
            losp.TenLoai_KhongDau = txtTenLoaiKhongDau.Text;
            losp.AnHien = int.Parse(rblAnHien.SelectedValue);
            losp.idCL = int.Parse(ddlChungLoai.SelectedValue);
            losp.ThuTu = int.Parse(txtThuTu.Text);
            db.SubmitChanges();//cập nhật
            fillGrid();
        }
    }
    protected void ibThem_Click(object sender, ImageClickEventArgs e)
    {
        loaisp losp = new loaisp
        {
            TenLoai = txtTenLoai.Text,
            TenLoai_KhongDau = txtTenLoaiKhongDau.Text,
            AnHien = int.Parse(rblAnHien.SelectedValue),
            idCL = int.Parse(ddlChungLoai.SelectedValue),
            ThuTu = int.Parse(txtThuTu.Text)
        };
        db.loaisps.InsertOnSubmit(losp);
        db.SubmitChanges();
        //hiển thị mã loại
        txtMaLoai.Text = losp.idLoai.ToString();
        fillGrid();
    }
}