using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net.Mail;

public partial class QuenMatKhau : CommonPage
{
    DataProvider db = new DataProvider();
    protected void Page_Load(object sender, EventArgs e)
    {
        txtTenDN.Focus();
    }

    protected void ibYeuCau_Click(object sender, ImageClickEventArgs e)
    {
        ccJoin.ValidateCaptcha(txtCaptcha.Text);
        if (!ccJoin.UserValidated)
        {
            lblthongbao1.Text = "Mã xác nhận chưa đúng!";
        }
        else
        {
            string strString = "0123456789";
            Random random = new Random();
            int randomCharIndex = 0;
            char randomChar;
            string MatKhauMoi = "";
            for (int i = 0; i < 4; i++)
            {
                randomCharIndex = random.Next(0, strString.Length);
                randomChar = strString[randomCharIndex];
                MatKhauMoi += Convert.ToString(randomChar);
            }
            Session["pass"] = MatKhauMoi;
            try
            {
                if (db.XacNhanDoiMatKhau(txtTenDN.Text, txtEmail.Text) == true)
                {
                    db.DoiMatKhau(txtTenDN.Text, MatKhauMoi);
                    String email = txtEmail.Text;
                    String subject = "New password!";
                    string body = "New Password: " + Session["pass"].ToString();
                    GoogleMail.Send(email, subject, body);
                    ibYeuCau.Enabled = false;
                    lblthongbao.Text = "Yêu cầu đã được xác nhận! Hãy truy cập mail để nhận mật khẩu mới.";
                    lblthongbao1.Text = "";
                }
                else
                {
                    lblthongbao.Text = "Sai tên truy cập hoặc email mà bạn đã đăng kí trên website!";
                    lblthongbao1.Text = "";
                }
            }
            catch
            {
                lblthongbao.Text = "Yêu cầu thất bại!";
                lblthongbao1.Text = "";
            }
        }
    }
    void SendEmailMember()
    {
        string idmember = db.LayIDMember();
        try
        {
            MailMessage message = new MailMessage();
            message.From = new MailAddress("demoasp305@gmail.com", "Administractor");
            message.To.Add(new MailAddress(txtEmail.Text));
            message.CC.Add(new MailAddress("demoasp305@gmail.com"));
            message.Subject = "Mật khẩu mới!";
            message.Body = "Dưới đây là mật khẩu mới của bạn, hãy đăng nhập và thay đổi mật khẩu nếu cần thiết : \n";
            message.Body += "New Password: " + Session["pass"].ToString();
            SmtpClient client = new SmtpClient("relay-hosting.secureserver.net", 25);
            System.Net.NetworkCredential auth = new System.Net.NetworkCredential("demoasp305@gmail.com", "20072011");
            client.EnableSsl = false;
            client.Credentials = auth;
            //client.Credentials = CredentialCache.DefaultNetworkCredentials; 
            client.Send(message);
        }
        catch { }
    }
}