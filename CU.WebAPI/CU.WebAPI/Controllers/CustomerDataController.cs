using CU.WebAPI.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;

namespace CU.WebAPI.Controllers
{
    [Authorize]
    public class CustomerDataController : ApiController
    {
        [Route("customer")]
        [HttpGet]
        public CUCAResponse<List<CustomerData>> GetCustomerData()
        {
            CustomerDataDL _CustomerDataDL = new CustomerDataDL();
            return _CustomerDataDL.GetCustomerData(0, null, null);
        }

        [Route("customer/{id}")]
        [HttpGet]
        public CUCAResponse<List<CustomerData>> GetCustomerData(long id = 0)
        {
            CustomerDataDL _CustomerDataDL = new CustomerDataDL();
            return _CustomerDataDL.GetCustomerData(id, null, null);
        }

        [Route("city/{name}")]
        [HttpGet]
        public CUCAResponse<List<CustomerData>> GetCustomerDataName(string name)
        {
            CustomerDataDL _CustomerDataDL = new CustomerDataDL();
            return _CustomerDataDL.GetCustomerData(0, null, name);
        }

        [Route("phone/{prefix}")]
        [HttpGet]
        public CUCAResponse<List<CustomerData>> GetCustomerDataPhone(string prefix)
        {
            CustomerDataDL _CustomerDataDL = new CustomerDataDL();
            return _CustomerDataDL.GetCustomerData(0, prefix, null);
        }

        [Route("customer")]
        [HttpPost]
        public SaveResponseModel SaveCustomerData(CustomerData _CustomerData)
        {
            CustomerDataDL _CustomerDataDL = new CustomerDataDL();
            return _CustomerDataDL.SaveCustomerData(_CustomerData);
        }

        [Route("customer/{id}/address")]
        [HttpPost]
        public SaveResponseModel SaveCustomerDataAddress(long id, CustomerData_Address _CustomerData_Address)
        {
            CustomerDataDL _CustomerDataDL = new CustomerDataDL();
            return _CustomerDataDL.SaveCustomerDataAddress(id, _CustomerData_Address);
        }

        [Route("customer/{id}/address/{address_id}")]
        [HttpPost]
        public SaveResponseModel DeleteCustomerDataAddress(long id, long address_id)
        {
            CustomerDataDL _CustomerDataDL = new CustomerDataDL();
            return _CustomerDataDL.DeleteCustomerDataAddress(id, address_id);
        }
    }
}
