using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace CU.WebAPI.Models
{
    public class CUCAResponse<T> : BaseLogic
    {
        public string Description { get; set; }
        public T Response { get; set; }
        public bool Status { get; set; }
    }
    public class SaveResponseModel
    {
        public bool DBFlag { get; set; }
        public string DBMessage { get; set; }
        public long DBOutid { get; set; }
    }

    public class CustomerData
    {
        public long CustomerID { get; set; }

        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string PhoneNumber { get; set; }
        public string Email { get; set; }

        public List<CustomerData_Address> _CustomerData_Address { get; set; }
    }

    public class CustomerData_Address
    {
        public long CustomerID { get; set; }
        public long AddressID { get; set; }

        public string City { get; set; }
        public string Country { get; set; }
        public string AddressLine { get; set; }
    }

    public class GetCustomerData : CustomerData
    {
        public long AddressID { get; set; }
        public string City { get; set; }
        public string Country { get; set; }
        public string AddressLine { get; set; }
    }
}