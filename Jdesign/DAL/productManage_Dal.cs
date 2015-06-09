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
    public class productManage_Dal
    {
        Model.userInfo_Model umode = new userInfo_Model();
        string NewStr = System.Configuration.ConfigurationManager.AppSettings["ConnectionString"];
        public DataSet prductShow()
        {

            SqlConnection cn = new SqlConnection(NewStr);
            cn.Open();

            String str = "SELECT * FROM productInfo";
            SqlDataAdapter newadp = new SqlDataAdapter(str, cn);
            DataSet newset = new DataSet();
            newadp.Fill(newset, "newTable");
            return newset;

        }
        public int productDel(int proid)
        {

            SqlConnection cn = new SqlConnection(NewStr);
            cn.Open();

            SqlCommand DeleteCommand = cn.CreateCommand();
            DeleteCommand.CommandText = "delete from productInfo where Id=@proid";
            SqlParameter para = new SqlParameter("@proid", SqlDbType.VarChar, 16);
            para.Value = proid;
            DeleteCommand.Parameters.Add(para);

            int res = DeleteCommand.ExecuteNonQuery();
            cn.Close();
            return res;
        }
        public int productAdd(string pron, string prox, string proj, string url, int IsRecommend)
        {

            SqlConnection conn = new SqlConnection(NewStr);
            conn.Open();

            SqlCommand cmd = new SqlCommand("addProduct", conn);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlParameter productname_para = new SqlParameter("@proname", SqlDbType.NVarChar);
            productname_para.Value = pron;
            cmd.Parameters.Add(productname_para);
            SqlParameter productxing_para = new SqlParameter("@proxing", SqlDbType.NVarChar);
            productxing_para.Value = prox;
            cmd.Parameters.Add(productxing_para);
            SqlParameter productjia_para = new SqlParameter("@projia", SqlDbType.NVarChar);
            productjia_para.Value = proj;
            cmd.Parameters.Add(productjia_para);
            SqlParameter producturl_para = new SqlParameter("@url", SqlDbType.VarChar);
            producturl_para.Value = url;
            cmd.Parameters.Add(producturl_para);

            SqlParameter productrIsRecommend_para = new SqlParameter("@IsRecommend", SqlDbType.Int);
            productrIsRecommend_para.Value = IsRecommend;
            cmd.Parameters.Add(productrIsRecommend_para);


            //输出判断参数
            SqlParameter checkUser_para = new SqlParameter("@checkPro", SqlDbType.Int, 4);
            checkUser_para.Direction = ParameterDirection.Output;　　　//指定为输出类型
            cmd.Parameters.Add(checkUser_para);

            IAsyncResult result = cmd.BeginExecuteNonQuery();
            cmd.EndExecuteNonQuery(result);
            conn.Close();
            int sdfs = checkUser_para.Value == null ? 0 : Int32.Parse(checkUser_para.Value.ToString());
            return sdfs;
        }

        public DataSet findProduct(string pron)
        {

            SqlConnection cn = new SqlConnection(NewStr);
            cn.Open();

            String str = "SELECT * FROM productInfo where ProductName LIKE '%" + pron + "%'";
            SqlDataAdapter newadp = new SqlDataAdapter(str, cn);
            DataSet newset = new DataSet();
            newadp.Fill(newset, "newTable");
            return newset;
        }

        /// <summary>
        /// 按照产品分类搜索
        /// </summary>
        /// <param name="CategoryId"></param>
        /// <returns></returns>
        public DataSet SearchByCategory(int CategoryId)
        {

            SqlConnection cn = new SqlConnection(NewStr);
            cn.Open();

            String str = "SELECT * FROM productInfo where ProductCategory=" + CategoryId;
            SqlDataAdapter newadp = new SqlDataAdapter(str, cn);
            DataSet newset = new DataSet();
            newadp.Fill(newset, "newTable");
            return newset;
        }


        public DataSet ProductEditProcess1(int proid)
        {
            //String NewStr = @"Data Source=.\;Initial Catalog = Jdesign;Integrated Security = True;";
            SqlConnection cn = new SqlConnection(NewStr);
            cn.Open();

            String str = "SELECT * FROM productInfo where Id =" + proid + "";
            SqlDataAdapter newadp = new SqlDataAdapter(str, cn);
            DataSet newset = new DataSet();
            newadp.Fill(newset, "newTable");
            return newset;
        }
        public int ProductEditProcess2(int proid, string pron, string prox, string proj, string url, int IsRecommend)
        {
            //String NewStr = @"Data Source=.\;Initial Catalog = Jdesign;Integrated Security = True;";
            SqlConnection cn = new SqlConnection(NewStr);
            cn.Open();
            String str = "SELECT * FROM productInfo where Id =" + proid + "";
            SqlCommand UpdateCommand = cn.CreateCommand();
            UpdateCommand.CommandText = "update productInfo set ProductName='" + pron + "', ProductCategory='" + prox + "', Price='" + proj + "',Url='" + url + "',IsRecommend=" + IsRecommend + " where id='" + proid + "'";
            int res = UpdateCommand.ExecuteNonQuery();
            cn.Close();
            return res;
        }

        /// <summary>
        /// 是否推荐
        /// </summary>
        /// <param name="id">id</param>
        /// <param name="IsRecmmond">推荐标识0：不推荐 1：推荐</param>
        /// <returns></returns>
        public int UpdateIsRecmmond(int id, int IsRecommend)
        {

            Order_Model model = new Order_Model();
            SqlConnection cn = new SqlConnection(NewStr);
            cn.Open();
            SqlParameter[] para = { 
                                  
                                     new SqlParameter("@id",id),
                                     new SqlParameter("@IsRecommend",IsRecommend)
                                  };
            string strSql = "update productInfo set IsRecommend=@IsRecommend where id=@id";
            SqlCommand cmd = new SqlCommand();
            cmd.CommandType = CommandType.Text;
            cmd.CommandText = strSql;
            cmd.Parameters.AddRange(para);
            int count = cmd.ExecuteNonQuery();
            cn.Close();
            return count;
        }

        /// <summary>
        /// 获取最后一个推荐的图片
        /// </summary>
        /// <returns></returns>
        public DataSet getIsRecmmondList()
        {
            SqlConnection cn = new SqlConnection(NewStr);
            cn.Open();

            String str = "SELECT top 1 * FROM productInfo where IsRecommend=1 order by id desc";
            SqlDataAdapter newadp = new SqlDataAdapter(str, cn);
            DataSet newset = new DataSet();
            newadp.Fill(newset, "newTable");
            return newset;

        }

        /// <summary>
        /// 将查询结果集填充到DataTable
        /// </summary>
        /// <param name="query">查询T-Sql</param>
        /// <returns></returns>
        public DataTable FillDataTable(String query)
        {
            SqlConnection cn = new SqlConnection(NewStr);
            cn.Open();
            DataTable dt = new DataTable();

            SqlCommand cmd = new SqlCommand();
            cmd.Connection = cn;
            cmd.CommandText = query;
            SqlDataAdapter ada = new SqlDataAdapter();
            ada.SelectCommand = cmd;
            ada.Fill(dt);

            return dt;
        }

    }
}
