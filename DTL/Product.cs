using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace SE1436_Group4_Assigment
{
    public class Product
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
        public static DataTable GetDataTable()
        {
            string sql = "select * from SanPham";
            return GetDataTable(sql);

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
        public static SqlConnection GetConnection()
        {
            string SqlConnection = ConfigurationManager.ConnectionStrings["MusicStoreConnectionString"].ToString();
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

    }
}