using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CU.WebAPI.Models
{
    public class CustomerDataDL
    {
        public string GetConnectionString()
        {
            return System.Configuration.ConfigurationManager.ConnectionStrings["live_dbName"].ConnectionString;
        }

        public CUCAResponse<List<CustomerData>> GetCustomerData(long CustomerID, string PhoneNumber, string City)
        {
            CUCAResponse<List<CustomerData>> Response = new CUCAResponse<List<CustomerData>>();
            try
            {
                string constr = GetConnectionString();
                using (SqlConnection conn = new SqlConnection(constr))
                {
                    conn.Open();
                    SqlCommand sqlComm = new SqlCommand("SP_CustomerData_SELECT", conn);
                    sqlComm.CommandType = CommandType.StoredProcedure;
                    sqlComm.Parameters.Add(new SqlParameter("@CustomerID", CustomerID));
                    sqlComm.Parameters.Add(new SqlParameter("@PhoneNumber", PhoneNumber));
                    sqlComm.Parameters.Add(new SqlParameter("@City", City));
                    DataTable dt = new DataTable();
                    dt.Load(sqlComm.ExecuteReader());
                    conn.Close();
                    if (dt.Rows.Count > 0)
                    {
                        List<GetCustomerData> _ListGetCustomerData = new List<GetCustomerData>();
                        foreach (DataRow dr in dt.Rows)
                        {
                            GetCustomerData _CustomerData = new GetCustomerData()
                            {
                                CustomerID = !string.IsNullOrEmpty(Convert.ToString(dr["CustomerID"])) ? Convert.ToInt64(dr["CustomerID"]) : 0,
                                FirstName = Convert.ToString(dr["FirstName"]),
                                LastName = Convert.ToString(dr["LastName"]),
                                PhoneNumber = Convert.ToString(dr["PhoneNumber"]),
                                Email = Convert.ToString(dr["Email"]),
                                AddressID = CustomerID = !string.IsNullOrEmpty(Convert.ToString(dr["AddressID"])) ? Convert.ToInt64(dr["AddressID"]) : 0,
                                City = Convert.ToString(dr["City"]),
                                Country = Convert.ToString(dr["Country"]),
                                AddressLine = Convert.ToString(dr["AddressLine"]),
                            };
                            _ListGetCustomerData.Add(_CustomerData);
                        }

                        List<CustomerData> _ListCustomerData = new List<CustomerData>();
                        _ListCustomerData = _ListGetCustomerData
                        .GroupBy(x => new
                        {
                            x.CustomerID,
                            x.FirstName,
                            x.LastName,
                            x.Email,
                            x.PhoneNumber
                        })
                        .Select(group => new CustomerData
                        {
                            CustomerID = group.Key.CustomerID,
                            FirstName = group.Key.FirstName,
                            LastName = group.Key.LastName,
                            Email = group.Key.Email,
                            PhoneNumber = group.Key.PhoneNumber,
                            _CustomerData_Address = group.Select(y => new CustomerData_Address
                            {
                                AddressID = y.AddressID,
                                City = y.City,
                                Country = y.Country,
                                AddressLine = y.AddressLine,
                                CustomerID = y.CustomerID
                            }).Where(z => z.AddressID != 0).ToList()
                        })
                        .ToList();

                        Response.Status = true;
                        Response.Response = _ListCustomerData;
                    }
                    else
                    {
                        Response.Status = true;
                        Response.Description = "No data found";
                        Response.Response = null;
                    }
                }
            }
            catch (Exception ex)
            {
                Response.Status = false;
                Response.Description = ex.Message;
                Response.Response = null;
                return Response;
            }
            return Response;
        }

        public SaveResponseModel SaveCustomerData(CustomerData _CustomerData)
        {
            SaveResponseModel Response = new SaveResponseModel();
            try
            {
                string constr = GetConnectionString();
                using (SqlConnection conn = new SqlConnection(constr))
                {
                    conn.Open();
                    SqlCommand sqlComm = new SqlCommand("SP_CustomerData_CU", conn);
                    sqlComm.CommandType = CommandType.StoredProcedure;
                    sqlComm.Parameters.Add(new SqlParameter("@CustomerID", _CustomerData.CustomerID));
                    sqlComm.Parameters.Add(new SqlParameter("@FirstName", _CustomerData.FirstName));
                    sqlComm.Parameters.Add(new SqlParameter("@LastName", _CustomerData.LastName));
                    sqlComm.Parameters.Add(new SqlParameter("@PhoneNumber", _CustomerData.PhoneNumber));
                    sqlComm.Parameters.Add(new SqlParameter("@Email", _CustomerData.Email));
                    SqlParameter outsqlFLAG = new SqlParameter("@FLAG", SqlDbType.Bit, 100) { Direction = ParameterDirection.Output };
                    sqlComm.Parameters.Add(outsqlFLAG);
                    SqlParameter outDESC = new SqlParameter("@DESC", SqlDbType.NVarChar, 1000) { Direction = ParameterDirection.Output };
                    sqlComm.Parameters.Add(outDESC);
                    SqlParameter outUNID= new SqlParameter("@UNID", SqlDbType.Float, 1000) { Direction = ParameterDirection.Output };
                    sqlComm.Parameters.Add(outUNID);
                    sqlComm.ExecuteNonQuery();
                    conn.Close();
                    SaveResponseModel _SaveResponseModel = new SaveResponseModel();
                    _SaveResponseModel.DBFlag = Convert.ToBoolean(outsqlFLAG.Value.ToString());
                    _SaveResponseModel.DBMessage = Convert.ToString(outDESC.Value.ToString());
                    _SaveResponseModel.DBOutid = Convert.ToInt64(string.IsNullOrEmpty(outUNID.Value.ToString()) ? "0" : outUNID.Value.ToString());
                    Response = _SaveResponseModel;
                }
            }
            catch (Exception ex)
            {
                Response.DBFlag = false;
                Response.DBMessage = ex.Message;
                return Response;
            }
            return Response;
        }

        public SaveResponseModel SaveCustomerDataAddress(long CustomerID, CustomerData_Address _CustomerData_Address)
        {
            SaveResponseModel Response = new SaveResponseModel();
            try
            {
                _CustomerData_Address.CustomerID = CustomerID;
                string constr = GetConnectionString();
                using (SqlConnection conn = new SqlConnection(constr))
                {
                    conn.Open();
                    SqlCommand sqlComm = new SqlCommand("SP_CustomerData_Address_CU", conn);
                    sqlComm.CommandType = CommandType.StoredProcedure;
                    sqlComm.Parameters.Add(new SqlParameter("@CustomerID", _CustomerData_Address.CustomerID));
                    sqlComm.Parameters.Add(new SqlParameter("@AddressID", _CustomerData_Address.AddressID));
                    sqlComm.Parameters.Add(new SqlParameter("@City", _CustomerData_Address.City));
                    sqlComm.Parameters.Add(new SqlParameter("@Country", _CustomerData_Address.Country));
                    sqlComm.Parameters.Add(new SqlParameter("@AddressLine", _CustomerData_Address.AddressLine));
                    SqlParameter outsqlFLAG = new SqlParameter("@FLAG", SqlDbType.Bit, 100) { Direction = ParameterDirection.Output };
                    sqlComm.Parameters.Add(outsqlFLAG);
                    SqlParameter outDESC = new SqlParameter("@DESC", SqlDbType.NVarChar, 1000) { Direction = ParameterDirection.Output };
                    sqlComm.Parameters.Add(outDESC);
                    SqlParameter outUNID = new SqlParameter("@UNID", SqlDbType.Float, 1000) { Direction = ParameterDirection.Output };
                    sqlComm.Parameters.Add(outUNID);
                    sqlComm.ExecuteNonQuery();
                    conn.Close();
                    SaveResponseModel _SaveResponseModel = new SaveResponseModel();
                    _SaveResponseModel.DBFlag = Convert.ToBoolean(outsqlFLAG.Value.ToString());
                    _SaveResponseModel.DBMessage = Convert.ToString(outDESC.Value.ToString());
                    _SaveResponseModel.DBOutid = Convert.ToInt64(string.IsNullOrEmpty(outUNID.Value.ToString()) ? "0" : outUNID.Value.ToString());
                    Response = _SaveResponseModel;
                }
            }
            catch (Exception ex)
            {
                Response.DBFlag = false;
                Response.DBMessage = ex.Message;
                return Response;
            }
            return Response;
        }

        public SaveResponseModel DeleteCustomerDataAddress(long CustomerID, long AddressID)
        {
            SaveResponseModel Response = new SaveResponseModel();
            try
            {
                string constr = GetConnectionString();
                using (SqlConnection conn = new SqlConnection(constr))
                {
                    conn.Open();
                    SqlCommand sqlComm = new SqlCommand("SP_CustomerData_Address_DELETE", conn);
                    sqlComm.CommandType = CommandType.StoredProcedure;
                    sqlComm.Parameters.Add(new SqlParameter("@CustomerID", CustomerID));
                    sqlComm.Parameters.Add(new SqlParameter("@AddressID", AddressID));
                    SqlParameter outsqlFLAG = new SqlParameter("@FLAG", SqlDbType.Bit, 100) { Direction = ParameterDirection.Output };
                    sqlComm.Parameters.Add(outsqlFLAG);
                    SqlParameter outDESC = new SqlParameter("@DESC", SqlDbType.NVarChar, 1000) { Direction = ParameterDirection.Output };
                    sqlComm.Parameters.Add(outDESC);
                    sqlComm.ExecuteNonQuery();
                    conn.Close();
                    SaveResponseModel _SaveResponseModel = new SaveResponseModel();
                    _SaveResponseModel.DBFlag = Convert.ToBoolean(outsqlFLAG.Value.ToString());
                    _SaveResponseModel.DBMessage = Convert.ToString(outDESC.Value.ToString());
                    Response = _SaveResponseModel;
                }
            }
            catch (Exception ex)
            {
                Response.DBFlag = false;
                Response.DBMessage = ex.Message;
                return Response;
            }
            return Response;
        }
    }
}