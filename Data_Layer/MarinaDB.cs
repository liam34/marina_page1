
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;

namespace Data_Layer
{

    public class MarinaDB
    {
        public static SqlConnection GetConnection()
        {
            SqlConnection connection = new SqlConnection();
            string ConnectionString = "Data Source=SoftDev;" + "Initial Catalog=Marina;" + "Integrated Security=true;";

            connection.ConnectionString = ConnectionString;
            connection.Open();
            return connection;

        }

    }
}
