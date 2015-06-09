using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class productFind : System.Web.UI.Page
{
    BLL.productManage_Bll pro = new BLL.productManage_Bll();
    protected void Page_Load(object sender, EventArgs e)
    {
      
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        string pron = proname.Value;
        BindData(pron);

    }
    private void BindData( string pron)
    {
        DataSet newset = pro.findProduct(pron);
        if (newset.Tables[0].Rows.Count == 0)
        {
            noDataerror.Style.Add("display", "block");
        }
        else {
            GridView1.DataSource = newset.Tables["newTable"];
            GridView1.DataBind();
            Session["pron"] = pron;
            Response.Redirect("productmore.aspx");
        }
        

    }
}