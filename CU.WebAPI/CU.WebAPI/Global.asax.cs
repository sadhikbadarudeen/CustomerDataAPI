using System;
using System.Web.Http;
using System.Web.Mvc;
using System.Web.Optimization;
using System.Web.Routing;

namespace CU.WebAPI
{
    public class WebApiApplication : System.Web.HttpApplication
    {
        protected void Application_Start()
        {
            AreaRegistration.RegisterAllAreas();
            GlobalConfiguration.Configure(WebApiConfig.Register);
            FilterConfig.RegisterGlobalFilters(GlobalFilters.Filters);
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Application_Error()
        {
            Exception Ex = Server.GetLastError();
            var body = "Error Message: <br />" + Ex.Message;
            body += "<br /><br />Url: " + Request.Url.AbsoluteUri;
            body += "<br /><br />Date: " + DateTime.Now;
            body += "<br /><br />Stack: " + Ex.StackTrace;
            Helper.Email.Send("System Error - CUCA.WebApi", body, Helper.AppSettings.DevelopmentMail);
            NLog.LogManager.GetCurrentClassLogger().Error(Ex, "General Exception");
        }
    }
}
