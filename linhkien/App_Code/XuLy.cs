using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.Configuration;

/// <summary>
/// Summary description for XuLy
/// </summary>
public class XuLy
{
	public XuLy()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    //Kết nối database
    public static string connectTheGioi()
    {
        return WebConfigurationManager.ConnectionStrings["thegioidongday"].ConnectionString;
    }

    //Xử lý truy vấn select
    public static DataTable Xuly_Select(string sql)
    {
        string connect = connectTheGioi();
        SqlConnection con = new SqlConnection(connect);
        SqlDataAdapter adapt = new SqlDataAdapter(sql, con);
        DataTable dt = new DataTable();
        adapt.Fill(dt);
        return dt;
    }

    //Xử lý truy vấn Insert update delete
    public static bool XulyTruyvan(string sql)
    {
        try
        {
            string connect = connectTheGioi();
            SqlConnection con = new SqlConnection(connect);
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Connection.Open();
            cmd.ExecuteNonQuery();
            cmd.Connection.Close();
            return true;
        }
        catch
        {
            return false;
        }
    }


    //Mã hóa MD5
    public static string GetMd5Hash(string input)
    {

        MD5 md5Hash = MD5.Create();

        // Convert the input string to a byte array and compute the hash.
        byte[] data = md5Hash.ComputeHash(Encoding.UTF8.GetBytes(input));

        // Create a new Stringbuilder to collect the bytes
        // and create a string.
        StringBuilder sBuilder = new StringBuilder();

        // Loop through each byte of the hashed data
        // and format each one as a hexadecimal string.
        for (int i = 0; i < data.Length; i++)
        {
            sBuilder.Append(data[i].ToString("x2"));
        }

        // Return the hexadecimal string.
        return sBuilder.ToString();

    }

    //Hàm lấy id vừa insert vào đơn hàng
    public static int XulyTruyvanScalar(string sql)
    {
        try
        {
            string connect = connectTheGioi();
            SqlConnection con = new SqlConnection(connect);
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Connection.Open();
            int n = (int)cmd.ExecuteScalar();
            cmd.Connection.Close();
            return n;
        }
        catch
        {
            return 0;
        }
    }

}