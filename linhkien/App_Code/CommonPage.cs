using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CommonPage
/// </summary>
public class CommonPage :System.Web.UI.Page
{
    //Định nghĩa property GioHang: dạng List<CartItem>
    public List<CartItem> GioHang
    {
        get
        {
            //khi thêm 1 mặt hàng vào giỏ hàng
            //ghi Session["MyCart"]
            if (Session["MyCart"] == null)
                Session["MyCart"] = new List<CartItem>();

            //chắc là luôn luôn có
            return Session["MyCart"] as List<CartItem>;
        }
    }

    public user KhachHang
    {
        get { return Session["NguoiDung"] as user; }
        set 
        {
            if (value == null)
                Session.Remove("NguoiDung");
            else
                Session["NguoiDung"] = value;
        }
    }

    public bool DaDangNhap
    {
        get { return (Session["NguoiDung"] != null); }
    }

    public void themvaogiahang(int idSP)
    {
        //kiểm tra xem idSP đã có trong giỏ hàng chưa
        CartItem item = this.GioHang.SingleOrDefault(p => p.idSP == idSP);
        if (item == null) //chưa có
        {
            phamhieucomputerDataContext db = new phamhieucomputerDataContext();
            //thêm vào giỏ hàng
            sanpham sp = db.sanphams.SingleOrDefault(p => p.idSP == idSP);
            item = new CartItem
            {
                idSP = idSP,
                TenSP = sp.TenSP,
                Gia = sp.Gia,
                SoLuong = 1
            };
            this.GioHang.Add(item);
        }
        else//có rồi
        {
            item.SoLuong += 1;
        }
        
    }
    protected override void InitializeCulture()
    {
        //việt hóa giao diện
        base.InitializeCulture();
    }

}