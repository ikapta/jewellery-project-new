using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data;
using System.Data.SqlClient;
using Model;
using DAL;

namespace BLL
{
    public class productManage_Bll
    {
        productManage_Dal dpro = new productManage_Dal();

        public DataSet productShow()
        {
            DataSet newdataset = dpro.prductShow();
            if (newdataset != null)
            {
                return newdataset;
            }
            else
            {
                return null;
            }
        }

        public int productDel(int proid)
        {
            int res = dpro.productDel(proid);
            return res;
        }

        public int productAdd(string pron, string prox, string proj, string url, int IsRecommend)
        {
            int res = dpro.productAdd(pron, prox, proj, url, IsRecommend);
            return res;
        }

        /// <summary>
        /// 按照产品分类搜索
        /// </summary>
        /// <param name="CategoryId"></param>
        /// <returns></returns>
        public DataSet SearchByCategory(int CategoryId)
        {
            return dpro.SearchByCategory(CategoryId);
        }

        public DataSet findProduct(string pron)
        {
            DataSet newdataset = dpro.findProduct(pron);
            if (newdataset != null)
            {
                return newdataset;
            }
            else
            {
                return null;
            }
        }

        public DataSet ProductEditProcess1(int proid)
        {
            DataSet newdataset = dpro.ProductEditProcess1(proid);
            if (newdataset != null)
            {
                return newdataset;
            }
            else
            {
                return null;
            }
        }
        public int ProductEditProcess2(int proid, string pron, string prox, string proj, string url, int IsRecommend)
        {
            int res = dpro.ProductEditProcess2(proid, pron, prox, proj, url,IsRecommend);
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
            return dpro.UpdateIsRecmmond(id, IsRecommend);
        }
         /// <summary>
        /// 获取最后一个推荐的图片
        /// </summary>
        /// <returns></returns>
        public DataSet getIsRecmmondList()
        {
            return dpro.getIsRecmmondList();
        }

          /// <summary>
        /// 将查询结果集填充到DataTable
        /// </summary>
        /// <param name="query">查询T-Sql</param>
        /// <returns></returns>
        public DataTable FillDataTable(String query)
        {
            return dpro.FillDataTable(query);
        }
    }
}
