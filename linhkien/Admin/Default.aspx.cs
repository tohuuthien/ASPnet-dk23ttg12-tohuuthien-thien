using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Default : AdminPage
{
    phamhieucomputerDataContext db = new phamhieucomputerDataContext();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["NguoiDung"] != null)
            {
                user u = Session["NguoiDung"] as user;
                lblHoTen.Text = u.HoTen;
            }
        }
    }
}