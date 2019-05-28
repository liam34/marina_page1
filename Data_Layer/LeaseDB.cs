
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using Business_Layer;



namespace Data_Layer
{
    public class LeaseDB
    {

        public static List<Lease> GetLease()
        {
            SqlConnection connection = MarinaDB.GetConnection();
            List<Lease> results = new List<Lease>();
            try
            {
                string sql = "SELECT * FROM Lease";

                SqlCommand command = new SqlCommand(sql, connection);
                SqlDataReader reader = command.ExecuteReader(System.Data.CommandBehavior.CloseConnection);
                while (reader.Read())
                {
                    Lease s = new Lease();
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

       





            public static int AddSlip(int SlipID, int CustomerID)
        {
            string sql = "INSERT INTO Lease (SlipID,CustomerID)  VALUES  (@SlipID,@CustomerID)";
            SqlConnection connection = Data_Layer.MarinaDB.GetConnection();
            SqlCommand command = new SqlCommand(sql, connection);

            command.Parameters.AddWithValue("@SlipID", SlipID);
            command.Parameters.AddWithValue("@CustomerID", CustomerID);

            int qq = command.ExecuteNonQuery();
            return qq;


        }

        public static int DeleLease(int SlipID)
        {
            string sql = "Delete Lease where SlipID=" + SlipID;

            SqlConnection connection = Data_Layer.MarinaDB.GetConnection();
            SqlCommand command = new SqlCommand(sql, connection);
            int qq = command.ExecuteNonQuery();
            return qq;

        }




    }
}

