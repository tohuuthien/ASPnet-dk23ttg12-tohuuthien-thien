using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net;
using System.Net.Mail;
using System.Text.RegularExpressions;
using System.IO;

public class GoogleMailer
{
    static String email = "demoasp305@gmail.com";//vui lòng sửa mail của bạn
    static String password = "testmail@123";//vui lòng sửa password của bạn

    // Gửi mail từ hệ thống
    public static void Send(String to, String subject, String body)
    {
        String from = "Administration System <" + email + ">";
        GoogleMailer.Send(from, to, "", "", subject, body, "");
    }

    // Gửi mail đơn giản
    public static void Send(String from, String to, String subject, String body)
    {
        GoogleMailer.Send(from, to, "", "", subject, body, "");
    }

    // Gửi mail nhiều lựa chọn đầy đủ
    public static void Send(String from, String to, String cc, String bcc, String subject, String body, String attachments)
    {
        MailMessage mail = new MailMessage();
        mail.From = new MailAddress(from);
        mail.ReplyTo = new MailAddress(from);
        mail.To.Add(new MailAddress(to));
        mail.Subject = subject;
        mail.Body = body;
        mail.IsBodyHtml = true;

        if (!String.IsNullOrEmpty(cc))
        {
            mail.CC.Add(cc);
        }
        if (!String.IsNullOrEmpty(bcc))
        {
            mail.Bcc.Add(bcc);
        }
        if (!String.IsNullOrEmpty(attachments))
        {
            String[] fileNames = attachments.Split(";,".ToCharArray());
            foreach (String fileName in fileNames)
            {
                if (fileName.Trim().Length > 0)
                {
                    mail.Attachments.Add(new Attachment(fileName.Trim()));
                }
            }
        }

        SmtpClient client = new SmtpClient("smtp.gmail.com", 587);
        client.EnableSsl = true;
        client.UseDefaultCredentials = false;
        client.Credentials = new NetworkCredential(email, password);
        client.Send(mail);
    }
}
