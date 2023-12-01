using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace CU.WebAPI.Helper
{
    public static class AppSettings
    {
        public static bool IsDevelopment => Convert.ToBoolean(ConfigurationManager.AppSettings["development"]);
        public static string DevelopmentMail => Convert.ToString(ConfigurationManager.AppSettings["developmentmail"]);
    }
}