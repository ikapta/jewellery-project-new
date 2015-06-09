using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using BLL;

public partial class content : System.Web.UI.Page
{
    public int IsRecommendId = 0;
    public string strProductName = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
          
       
        if (!IsPostBack)
        {
            Bind();
            getIsRecommend();
        }
        

            //Master.masterPageLable.Text = Session["userInfo"].ToString();
        
    }

    /// <summary>
    /// 加载产品
    /// </summary>
    private void Bind()
    {
        productManage_Bll bll = new productManage_Bll();
        DataTable dt = new DataTable();
        dt = bll.productShow().Tables[0];
        if (dt.Rows.Count>0)
        {
            Rep_Product.DataSource = dt;
            Rep_Product.DataBind();
        }
    }

    /// <summary>
    /// 获取最后一个推荐的图片
    /// </summary>
    private void getIsRecommend() { 
        productManage_Bll bll = new productManage_Bll();
        DataTable dt = new DataTable();
        dt = bll.getIsRecmmondList().Tables[0];
        if (dt.Rows.Count>0)
        {
            IsRecommendId = Convert.ToInt32(dt.Rows[0]["Id"]);
            imgSrc.Src = dt.Rows[0]["Url"].ToString();
            strProductName = dt.Rows[0]["ProductName"].ToString();
        }
     
    }
}