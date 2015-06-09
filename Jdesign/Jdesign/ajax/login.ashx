<%@ WebHandler Language="C#" Class="login" %>
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.SessionState;
using System.Data;
using System.Data.SqlClient;

public class login : IHttpHandler,IRequiresSessionState {
    
    public void ProcessRequest (HttpContext context) {
        try
        {
            BLL.userInfo_Bll userbll = new BLL.userInfo_Bll();
            Model.userInfo_Model user = new Model.userInfo_Model();
            user.UserName=context.Request.Form["userName"];
            user.PassWord=context.Request.Form["passWord"];

            context.Response.ContentType = "text/plain";
            
            int res=userbll.userLogin(user.UserName,user.PassWord);
            if (res == 1)
            {
                context.Session["isAdmin"] = 1;
                context.Session["name"] = user.UserName;
                context.Response.Write(user.UserName);
              
            }
            else if(res==2)
            {
                context.Session["isAdmin"] = 0;
                context.Session["name"] = user.UserName;
                context.Response.Write(user.UserName);
            }
            else {
                context.Response.Write("fail");
            }
            
        }
        catch (Exception e)
        {
            context.Response.Write(e.Message);
        }
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}