using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CartItem
/// </summary>
public class CartItem
{
    public int idSP { get; set; }
    public string TenSP { get; set; }
    public int Gia { get; set; }
    public int SoLuong { get; set; }
    public int ThanhTien 
    { 
        get { return SoLuong * Gia; } 
    }
}