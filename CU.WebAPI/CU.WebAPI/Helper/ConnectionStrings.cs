using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;

namespace CU.WebAPI.Helper
{
    public static class ConnectionStrings
    {
        public static string Live_dbName =>  ConfigurationManager.ConnectionStrings["live_dbName"].ConnectionString;
    }
}