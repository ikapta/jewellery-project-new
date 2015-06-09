using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


public partial class MasterPage : System.Web.UI.MasterPage
{
    //public Label masterPageLable {
    //    get { return login_form;}
    //    set { login_form = value; }
    //} 
    protected void Page_Load(object sender, EventArgs e)
    {
        proManageShowButton();

    }
    private void proManageShowButton()
    {
        int adminFlag = Convert.ToInt32(Session["isAdmin"]);
        if (Session["name"] == null)
        {
            youke.Visible = true;
            productManage.Visible = false;
            exit.Visible = false;
            login.Visible = false;
        }
        else if (Session["name"] != null && adminFlag!=1)
        {
            login.Visible = true;
            exit.Visible = true;
            youke.Visible = false;
            productManage.Visible = false;
        }
        else if (adminFlag == 1)
        {

            productManage.Visible = true;
            exit.Visible = true;
            youke.Visible = false;
           
        }
        //if (Session["isAdmin"] == null)
        //{
        //    ProWeihu.HRef = "####";
        //    ProWeihu.InnerText = "欢迎购物";
        //}
        //else
        //{
        //    isAdmin = Convert.ToInt32(Session["isAdmin"].ToString());
        //}
        //if (isAdmin == 1)
        //{
        //    ProWeihu.HRef = "productmore.aspx";
        //    ProWeihu.InnerText = "产品维护";
        //    ProWeihu.Style.Add("Color", "red");

        //}
        //else
        //{

        //    ProWeihu.HRef = "####";
        //    ProWeihu.InnerText = "欢迎购物";
        //}
    }

    protected void exitBtn_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("login.aspx");
    }
}
