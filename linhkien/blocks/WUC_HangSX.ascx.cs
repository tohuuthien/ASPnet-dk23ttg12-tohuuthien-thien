using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class WUC_HangSX : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            phamhieucomputerDataContext db = new phamhieucomputerDataContext();
            lvLoaiSP.DataSource = db.loaisps.Select(p => new { p.idLoai, p.TenLoai, SoSP = p.sanphams.Count });
            lvLoaiSP.DataBind();
        }

    }
}