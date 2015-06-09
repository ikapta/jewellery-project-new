using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Model;
using System.Data;
using System.Data.SqlClient;


namespace DAL
{
    public class userInfo_Dal
    {

        Model.userInfo_Model user = new userInfo_Model();
        public int userLogin(string userName, string passWord)
        {
            string str = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
            SqlConnection conn = new SqlConnection(str);
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("finduser", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter Para = new SqlParameter("@userName", SqlDbType.NVarChar);
            Para.Value = userName;
            cmd.Parameters.Add(Para);
            SqlParameter Paraa = new SqlParameter("@passWord", SqlDbType.NVarChar);
            Paraa.Value = passWord;
            cmd.Parameters.Add(Paraa);

            DataTable mytable = new DataTable();
            SqlDataAdapter adapter = new SqlDataAdapter(cmd);
            adapter.Fill(mytable);

            if (Convert.ToInt32(mytable.Rows[0].ItemArray[0]) != 0 && DBNull.Value != mytable.Rows[0][5])
            {
                user.Isexist = 1; //管理员
            }
            else if (Convert.ToInt32(mytable.Rows[0].ItemArray[0]) != 0)
            {
                user.Isexist = 2;//非管理员
            }
            else
            {
                user.Isexist = 0;//用户不存在    
            }
            conn.Close();
            return user.Isexist;
        }
    }

}
