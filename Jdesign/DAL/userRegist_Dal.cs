using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Model;

namespace DAL
{
    public class userRegist_Dal
    {
        Model.userInfo_Model umo = new userInfo_Model();

        public int userRegist(userInfo_Model umo)
        {
            string str = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
            SqlConnection conn = new SqlConnection(str);
            if (conn.State != ConnectionState.Open)
            {
                conn.Open();
            }
            SqlCommand cmd = new SqlCommand("userRegist", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter username_para = new SqlParameter("@userName", SqlDbType.NVarChar);
            username_para.Value = umo.UserName;
            cmd.Parameters.Add(username_para);
            SqlParameter password_para = new SqlParameter("@passWord", SqlDbType.NVarChar);
            password_para.Value = umo.PassWord;
            cmd.Parameters.Add(password_para);
            SqlParameter userbirth_para = new SqlParameter("@userBirth", SqlDbType.NVarChar);
            userbirth_para.Value = umo.Date;
            cmd.Parameters.Add(userbirth_para);
            SqlParameter usersex_para = new SqlParameter("@userSex", SqlDbType.NVarChar);
            usersex_para.Value = umo.Sex;
            cmd.Parameters.Add(usersex_para);

            //输出判断参数
            SqlParameter checkUser_para = new SqlParameter("@checkUser", SqlDbType.Int, 4);
            checkUser_para.Direction = ParameterDirection.Output;　　　//指定为输出类型
            cmd.Parameters.Add(checkUser_para);

            IAsyncResult result = cmd.BeginExecuteNonQuery();
            cmd.EndExecuteNonQuery(result);
            conn.Close();
            int sdfs = checkUser_para.Value == null ? 0 : Int32.Parse(checkUser_para.Value.ToString());
            return sdfs;
        }
    }
}
