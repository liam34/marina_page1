using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Data.SqlClient;
using Bussiness_Layer;

namespace Data_Layer
{
   public  class CustomerDB
    {
        public static List<Customer> GetcustID(string username)
        {
            SqlConnection connection = MarinaDB.GetConnection();
            List<Customer> results = new List<Customer>();


            try
            {

                string sql = " select * from customer where username='" + username + "'   ";
                SqlCommand command = new SqlCommand(sql, connection);
                SqlDataReader reader = command.ExecuteReader(System.Data.CommandBehavior.CloseConnection);

                while (reader.Read())
                {
                    Customer s = new Customer();
                    s.ID = Convert.ToInt32(reader["ID"].ToString());

                    results.Add(s);
                }
            }
            catch { }

            finally
            {
                connection.Close();
            }
            return results;
        }



    }
}
