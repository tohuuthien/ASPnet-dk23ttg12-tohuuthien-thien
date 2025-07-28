using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Web.Configuration;

/// <summary>
/// Summary description for DBClass
/// </summary>
public class DataProvider
{
    public static string ChuoiKetNoi
    {
        get { return WebConfigurationManager.ConnectionStrings["phamhieucomputer"].ConnectionString; }
    }
    public static bool TruyVan_XuLy(string sql)
    {
        try
        {
            SqlConnection con = new SqlConnection(ChuoiKetNoi);
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            return true;
        }
        catch { 
            return false; 
        }
    }

    public static DataTable TruyVan_LayDuLieu(string sql)
    {
        SqlConnection con = new SqlConnection(ChuoiKetNoi);
        SqlDataAdapter da = new SqlDataAdapter(sql, con);
        DataTable kq = new DataTable();
        da.Fill(kq);
        return kq;
    }

    public static void ExcuteNonQuery(string sql, CommandType type, SqlParameter[] paras)
    {
        SqlConnection sqlcon = new SqlConnection(ChuoiKetNoi);
        sqlcon.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.Connection = sqlcon;
        cmd.CommandText = sql;
        cmd.CommandType = type;

        if (paras != null)//có tham số
            cmd.Parameters.AddRange(paras);

        cmd.ExecuteNonQuery();

        sqlcon.Close();
    }

    public static DataTable SelectData(string sql, CommandType type, SqlParameter[] paras)
    {
        DataTable kq = new DataTable();
        SqlConnection sqlcon = new SqlConnection(ChuoiKetNoi);
        sqlcon.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.Connection = sqlcon;
        cmd.CommandText = sql;
        cmd.CommandType = type;

        if (paras != null)
            cmd.Parameters.AddRange(paras);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        da.Fill(kq);

        sqlcon.Close();
        return kq;
    }
    public static DataSet SelectMultiData(string sql)
    {
        DataSet kq = new DataSet();
        SqlConnection sqlcon = new SqlConnection(ChuoiKetNoi);
        sqlcon.Open();

        SqlDataAdapter da = new SqlDataAdapter(sql, sqlcon);
        da.Fill(kq);

        sqlcon.Close();
        return kq;
    }
    public bool XacNhanDoiMatKhau(string Username, string Email)
    {
        SqlConnection KetNoi = new SqlConnection(ChuoiKetNoi);
        KetNoi.Open();
        string kq;
        SqlDataAdapter da = new SqlDataAdapter("XacNhanDoiMatKhau", KetNoi);
        da.SelectCommand.Parameters.AddWithValue("@username", Username);
        da.SelectCommand.Parameters.AddWithValue("@email", Email);
        da.SelectCommand.CommandType = CommandType.StoredProcedure;
        DataTable dt = new DataTable();
        da.Fill(dt);
        if (dt.Rows.Count > 0)
            return true;
        else
            return false;
        KetNoi.Close();
    }
    public void DoiMatKhau(string Username, string Password)
    {
        SqlConnection KetNoi = new SqlConnection(ChuoiKetNoi);
        KetNoi.Open();
        SqlCommand cmd = new SqlCommand("UpdateMatKhau", KetNoi);
        cmd.Parameters.AddWithValue("@username", Username);
        cmd.Parameters.AddWithValue("@password", Password);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = KetNoi;
        cmd.ExecuteNonQuery();
        cmd.Dispose();
        KetNoi.Close();
    }
    public string LayIDMember()
    {
        SqlConnection KetNoi = new SqlConnection(ChuoiKetNoi);
        KetNoi.Open();
        string kq;
        SqlCommand cmd = new SqlCommand("LayID", KetNoi);
        cmd.CommandType = CommandType.StoredProcedure;
        cmd.Connection = KetNoi;
        kq = cmd.ExecuteScalar().ToString();
        return kq;
        KetNoi.Close();
    }
}
