using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;

public partial class productEdit : System.Web.UI.Page
{

    static string mypath = "";
    BLL.productManage_Bll pro = new BLL.productManage_Bll();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["isAdmin"] == null)
        {
            ScriptManager.RegisterStartupScript(
                         this, typeof(Page), "alertExist", "alert('请登录！');location.href='login.aspx'", true);
        }
        if (!IsPostBack)
        {
           
            string proidStr = Request.QueryString["proid"];
            int proid = Convert.ToInt32(proidStr);
            BindData(proid, proidStr);
            DropBind();
        }
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Up_Image();
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


    public void BindData(int proid, string proidStr)
    {
        DataSet newset = pro.ProductEditProcess1(proid);
        productid.Value = proidStr;
        proname.Value = newset.Tables[0].Rows[0][1].ToString();
        DropDownList1.SelectedValue = newset.Tables[0].Rows[0][2].ToString();
        projia.Value = newset.Tables[0].Rows[0][3].ToString();
        mypath = myimg.ImageUrl = newset.Tables[0].Rows[0][4].ToString();
        if (Convert.ToInt32(newset.Tables[0].Rows[0]["IsRecommend"]) == 1)
        {
            ckbIsRecommend.Checked = true;
        }
    }

    //图片处理的方法
    protected void Up_Image()
    {
        bool fileOk = false;
        string d = DateTime.Now.ToString("yyyyMMddHHmmss");
        string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName).ToLower();
        string path = Server.MapPath("/userfiles/product/") + d + fileExtension;

        if (FileUpload1.HasFile)
        {
            string[] allowedExtensions = { ".gif", ".png", ".bmp", ".jpg", "jpeg" };
            for (int i = 0; i < allowedExtensions.Length; i++)
            {
                if (fileExtension == allowedExtensions[i])
                {
                    fileOk = true;
                }
            }
            if (fileOk)
            {

                FileUpload1.SaveAs(path);//保存上传的图片

                mypath = "/userfiles/product/" + d + fileExtension;

                Edit(mypath);
            }
            else
            {
                ltlmsg.Text = "X 图片格式错误。";
            }
        }
        else
        {
            string str = myimg.ImageUrl;
            Edit(str);
            mypath = "";//没有选择图片

        }
    }

    private void Edit(string url)
    {
        int strIsRecommend = 0;
        if (ckbIsRecommend.Checked)
        {
            strIsRecommend = 1;
        }
        int isEditSuccess = pro.ProductEditProcess2(Convert.ToInt32(productid.Value), proname.Value, DropDownList1.SelectedValue, projia.Value, url, strIsRecommend);
        if (isEditSuccess == 1)
        {
            Response.Redirect("productmore.aspx");
        }

    }
}