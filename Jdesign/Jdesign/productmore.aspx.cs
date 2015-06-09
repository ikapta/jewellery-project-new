using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Model;
using System.Web.SessionState;
using BLL;

public partial class Jd_core_Default : System.Web.UI.Page
{
    productManage_Bll pro = new productManage_Bll();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["isAdmin"] == null)
        {
            ScriptManager.RegisterStartupScript(
                         this, typeof(Page), "alertExist", "alert('请登录！');location.href='login.aspx'", true);
        }
        if (!IsPostBack) {
            BindData();
            DropBind();
        }
       
       
    }

    /// <summary>
    /// 产品分类
    /// </summary>
    private void DropBind()
    {
        ProductCategory_Bll bll = new ProductCategory_Bll();
        DataTable dt = bll.getList().Tables[0];
        DropDownList1.DataSource = dt;
        DropDownList1.DataTextField = "Title";
        DropDownList1.DataValueField = "Id";
        DropDownList1.DataBind();
    }

    private void BindData() {
        DataSet ds = pro.productShow();
        if (Session["pron"] == null)
        {
            GridView1.DataSource = ds.Tables["newTable"];
            GridView1.DataBind();
        }
        else {
            string pron = Session["pron"].ToString();
            DataSet newds = pro.findProduct(pron);
            GridView1.DataSource =newds.Tables["newTable"];
            GridView1.DataBind();
            Session.Remove("pron");
        }
        
    }
    

    protected void GridView1_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
       int i = e.RowIndex;  
       int proid = int.Parse((GridView1.Rows[i].Cells[0].Text));

       String NewStr = @"Data Source=.\;Initial Catalog = Jdesign;Integrated Security = True;";
       SqlConnection cn = new SqlConnection(NewStr);
       cn.Open();
       SqlCommand DeleteCommand = cn.CreateCommand();
       DeleteCommand.CommandText = "delete from productInfo where id=@proid";
       SqlParameter para = new SqlParameter("@proid", SqlDbType.VarChar, 16);
       para.Value = proid;
       DeleteCommand.Parameters.Add(para);

       int res = DeleteCommand.ExecuteNonQuery();
       cn.Close();

       BindData();
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {

    }
    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        BindData();
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    { 
        //方法一：获取行索引，会引起自带的page功能错误
        //GridViewRow gvrow = (GridViewRow)(((LinkButton)e.CommandSource).NamingContainer);
        //int index = gvrow.RowIndex;
        //int proid = int.Parse((GridView1.Rows[index].Cells[0].Text));
        int i = Convert.ToInt32(e.CommandArgument.ToString());
        if (e.CommandName == "del") {
            int res = pro.productDel(i);
            BindData();
        }
        else if (e.CommandName == "upd") {
            Response.Redirect("productEdit.aspx?proid="+i);
        }
    }

    protected void GridView1_RowEditing(object sender, GridViewEditEventArgs e)
    {

    }
    protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
    {
        SearchByCategory();
    }

    /// <summary>
    /// 显示搜索后的数据
    /// </summary>
    private void SearchByCategory() {
        productManage_Bll bll = new productManage_Bll();
        int categoryId = Convert.ToInt32(DropDownList1.SelectedValue);
        DataTable dt = bll.SearchByCategory(categoryId).Tables[0];
        GridView1.DataSource = dt;
        GridView1.DataBind();
    }
}