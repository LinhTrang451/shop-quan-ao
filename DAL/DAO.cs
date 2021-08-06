using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Lab4_Template.DAL
{
    class DAO
    {
        static string strConn = ConfigurationManager.ConnectionStrings["MyConnection"].ConnectionString;
        static public DataTable GetDataTable(string sqlSelect)
        {
            try
              {
                    SqlConnection conn = new SqlConnection(strConn);
                    SqlDataAdapter da = new SqlDataAdapter(sqlSelect, conn);
                    DataTable dt = new DataTable();
                    da.Fill(dt);
                    return dt;
              }
            catch (Exception ex)
              {
                return null;
              }
        }

        static public DataTable GetDataTable(SqlCommand cmd)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strConn);
                cmd.Connection = conn;
                SqlDataAdapter da = new SqlDataAdapter();
                da.SelectCommand = cmd;
                DataTable dt = new DataTable();
                da.Fill(dt);
                return dt;
            }
            catch (Exception ex)
            {
                     return null;
            }
        }

        static public bool UpdateTable(SqlCommand cmd)
        {
            try
            {
                SqlConnection conn = new SqlConnection(strConn);
                cmd.Connection = conn;
                conn.Open();
                cmd.ExecuteNonQuery();
                conn.Close();
                return true;
                
            }
            catch (Exception ex)
            {
                return false;

            }

        }
        public static DataTable GetDataTable()
        {
            string sql = "select * from SanPham";
            return DAO.GetDataTable(sql);

        }
        public static SqlConnection GetConnection()
        {
            string SqlConnection = ConfigurationManager.ConnectionStrings["MyConnection"].ToString();
            return new SqlConnection(SqlConnection);
        }
        public static DataTable GetDataBySQLWithParamester(string sql, params SqlParameter[] parameters)
        {
            SqlCommand Command = new SqlCommand(sql, GetConnection());
            Command.Parameters.AddRange(parameters);
            DataTable dataTable = new DataTable();
            Command.Connection.Open();
            SqlDataReader reader = Command.ExecuteReader();
            dataTable.Load(reader);
            Command.Connection.Close();
            return dataTable;
        }
        // insert data to databse no param
        public static int ExecuteSQl(string sql)
        {
            SqlCommand command = new SqlCommand(sql, GetConnection());
            command.Connection.Open();
            int count = command.ExecuteNonQuery();
            command.Connection.Close();
            return count;
        }
        // insert data to databse with param
        public static int ExecuteSQlWithParameters(string sql, params SqlParameter[] parameters)
        {
            SqlCommand Command = new SqlCommand(sql, GetConnection());
            Command.Connection.Open();
            Command.Parameters.AddRange(parameters);
            int k = Command.ExecuteNonQuery();
            Command.Connection.Close();
            return k;
        }

    }
}
