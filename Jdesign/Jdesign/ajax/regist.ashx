<%@ WebHandler Language="C#" Class="regist" %>

using System;
using System.Web;
using System.Web.SessionState;
using System.Data;
using System.Data.SqlClient;
using BLL;
using Model;

public class regist : IHttpHandler,IRequiresSessionState {
    
    public void ProcessRequest (HttpContext context) {
        Model.userInfo_Model userInfo = new Model.userInfo_Model();
        BLL.userRegist_Bll userRegist = new userRegist_Bll();
      
       
           userInfo.UserName = context.Request.Form["username"];
           userInfo.PassWord = context.Request.Form["password"];
           userInfo.Sex = context.Request.Form["usersex"];
           userInfo.Date = context.Request.Form["userbirth"];
        
        context.Response.ContentType = "text/plain";

        int re = userRegist.userRegist(userInfo.UserName,userInfo.PassWord,userInfo.Sex,userInfo.Date);
        if (re == -1)
        {
            context.Response.Write("fail");
        }
        else {
            context.Session["isAdmin"] = 0;
            context.Session["name"] = userInfo.UserName;
            context.Response.Write(userInfo.UserName);
        }
        
    }
 
    public bool IsReusable {
        get {
            return false;
        }
    }

}