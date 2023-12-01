using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace CU.WebAPI.Helper
{
    public class DBHelper
    {
        #region private
        private static readonly NLog.Logger _logger = NLog.LogManager.GetCurrentClassLogger();
        #endregion

        #region public
        public string ConnectionString { get; set; }
        #endregion

        #region instance
        private static readonly Lazy<DBHelper> instance = new Lazy<DBHelper>(() => new DBHelper(ConnectionStrings.Live_dbName));
        public static DBHelper Instance => instance.Value;
        #endregion

        #region ctor
        public DBHelper(string connectionString)
        {
            ConnectionString = connectionString;
        }
        #endregion

        #region client
        public Models.ClientInfo GetClientInfo(string clientId, string clientSecret)
        {
            Models.ClientInfo response = null;
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            using (SqlCommand sqlComm = new SqlCommand("ADMIN.USP_UMS_API_CLIENT_SELECT", conn)
            {
                CommandType = CommandType.StoredProcedure
            })
            using (SqlDataAdapter adapter = new SqlDataAdapter(sqlComm))
            {
                sqlComm.Parameters.Add(new SqlParameter("@ClientID", GetDBValue(clientId)));
                sqlComm.Parameters.Add(new SqlParameter("@ClientSecret", GetDBValue(clientSecret)));
                DataTable dt = new DataTable();
                adapter.Fill(dt);
                if (dt.Rows.Count > 0)
                {
                    response = dt.ToList<Models.ClientInfo>().FirstOrDefault();
                }
            }
            return response;
        }
        public Models.ResponseModel SaveTokenInfo(string clientId, string token, DateTime issueDate, DateTime expiryDate)
        {
            Models.ResponseModel response = new Models.ResponseModel();
            using (SqlConnection conn = new SqlConnection(ConnectionString))
            using (SqlCommand sqlComm = new SqlCommand("ADMIN.USP_UMS_API_CLIENT_TOKEN_ADD", conn)
            {
                CommandType = CommandType.StoredProcedure
            })
            {
                sqlComm.Parameters.Add(new SqlParameter("@ClientID", GetDBValue(clientId)));
                sqlComm.Parameters.Add(new SqlParameter("@Token", GetDBValue(token)));
                sqlComm.Parameters.Add(new SqlParameter("@IssueDate", GetDBValue(issueDate)));
                sqlComm.Parameters.Add(new SqlParameter("@ExpiryDate", GetDBValue(expiryDate)));

                sqlComm.Parameters.Add(new SqlParameter("@FLAG", SqlDbType.BigInt, 100) { Direction = ParameterDirection.Output });
                sqlComm.Parameters.Add(new SqlParameter("@DESC", SqlDbType.NVarChar, 1000) { Direction = ParameterDirection.Output });

                try
                {
                    conn.Open();
                    sqlComm.ExecuteNonQuery();
                    response.FLAG = Convert.ToInt32(sqlComm.Parameters["@FLAG"].Value);
                    response.DESC = $"{sqlComm.Parameters["@DESC"].Value}";
                }
                catch (Exception ex)
                {
                    _logger.Error(ex, "Exception while sql command execution.");
                }
                finally
                {
                    conn.Close();
                }

            }
            return response;
        }
        #endregion

        #region private methods
        private static object GetDBValue(object val)
        {
            return val == null ? DBNull.Value : val;
        }
        #endregion
    }
}