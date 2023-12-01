using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CU.WebAPI.Models
{
    public class ClientInfo
    {
        public long ApiClientID { get; set; }
        
        public string Company { get; set; }
        public string ContactName { get; set; }
        public string ContactNo { get; set; }
        public string Email { get; set; }
        public string Address { get; set; }
        
        public bool IsExpiry { get; set; }
        public DateTime? ExpiryDate { get; set; }

        public string ClientID { get; set; }
        public string ClientSecret { get; set; }

        public bool Disable { get; set; }
    }
}