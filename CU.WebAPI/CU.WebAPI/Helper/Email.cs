using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Threading.Tasks;
using System.Web;

namespace CU.WebAPI.Helper
{
    public class Email
    {
        #region private
        private static readonly NLog.Logger _logger = NLog.LogManager.GetCurrentClassLogger();
        #endregion

        public static bool Send(string subject, string body, string toEmail, string fromEmail = "noreply-ums@cuca.ae", List<Attachment> attachments = null)
        {
            List<string> emails = toEmail.Replace(" ", string.Empty)
                                         .Split(new string[] { ",", ";" }, StringSplitOptions.RemoveEmptyEntries)
                                         .ToList();
            return Send(subject, body, emails, fromEmail, attachments);
        }

        public static bool Send(string subject, string body, List<string> toEmail, string fromEmail = "noreply-ums@cuca.ae", List<Attachment> attachments = null)
        {
            try
            {
                if (AppSettings.IsDevelopment)
                {
                    toEmail = new List<string>
                    {
                        AppSettings.DevelopmentMail
                    };
                }

                if (toEmail.Count == 0)
                {
                    return false;
                }

                MailMessage msg = new MailMessage
                {
                    Subject = subject,
                    Body = body,
                    IsBodyHtml = true,
                    From = new MailAddress(fromEmail)
                };
                foreach (string s in toEmail)
                {
                    msg.To.Add(new MailAddress(s));
                }

                if (attachments != null)
                {
                    foreach (Attachment a in attachments)
                    {
                        msg.Attachments.Add(a);
                    }
                }

                using (SmtpClient client = new SmtpClient("smtp.gmail.com", 587))
                {
                    client.EnableSsl = true;
                    client.UseDefaultCredentials = false;
                    client.Credentials = new System.Net.NetworkCredential("noreply-ums@cuca.ae", "Cuca$6239");
                    client.DeliveryMethod = SmtpDeliveryMethod.Network;
                    client.Send(msg);
                }
                Task.Delay(1000);
                return true;
            }
            catch (Exception ex)
            {
                _logger.Error(ex, "Exception while sending email.");
                return false;
            }
        }
    }
}