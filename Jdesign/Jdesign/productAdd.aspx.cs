using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using BLL;
using System.Data;

public partial class productAdd : System.Web.UI.Page
{
    private string mypath = "";
    BLL.productManage_Bll pro = new BLL.productManage_Bll();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["isAdmin"] == null)
        {
            ScriptManager.RegisterStartupScript(
                         this, typeof(Page), "alertExist", "alert('请登录！');location.href='login.aspx'", true);
        }
     
        DropBind();
    }

    public void Pro_add(object sender, object o)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        Up_Image();
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

                Add(mypath);
            }
            else
            {
                ltlmsg.Text = "X 图片格式错误。";
            }
        }
        else
        {
            mypath = "";//没有选择图片

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


    private void Add(string url)
    {
        string pron = proname.Value;
        string prox = DropDownList1.SelectedValue;
        string proj = projia.Value;
        string prourl = url;
        int proIsRecommend = 0;
        if (ckbIsRecommend.Checked)
        {
            proIsRecommend = 1;

        }

        int res = pro.productAdd(pron, prox, proj, prourl, proIsRecommend);
        if (res == -1)
        {
            Response.Write("<script>alert('fail!')</script>");
        }
        else
        {
            Response.Redirect("productmore.aspx");
        }
    }
}