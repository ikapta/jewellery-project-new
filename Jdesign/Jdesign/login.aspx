<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="Jd_core_login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="css/login.css" rel="stylesheet" />
    <script src="js/jquery.js.js"></script>

    <script>
        $(function () {
            $("#login").click(function () {
                var username = $("#username").val();
                var password = $("#password").val();
                if (username.length == 0 || password.length == 0) {
                    $("#empty").show();
                }
              
                else {

                    $.ajax(
                  {
                      type: "POST",
                      url: "Ajax/login.ashx",
                      data: "userName=" + escape(username) + "&passWord=" + escape(password),
                      success: function (msg) {
                          if (msg == "fail") {
                              $("#error").show();
                          }
                          else {
                              //window.location.href = "content.aspx?name="+msg;
                              window.location.href = "content.aspx";
                          }
                        

                      },
                      error: function (XMLHttpRequest, textStatus, thrownError) {
                         
                      }
                  })
                }
                
            })
        })

    </script>
    <style>
        .noshow {
            position:absolute;
            top: 40px;
            left: 140px;
        }
        .aspan1 {
            color:#808080; 
        }
        .aspan2 {
            color:#0072bb;
        }
        .aspan2:hover {
                text-decoration:underline;
            }
    </style>
</head>
<body>
   
    <div id="main">
        <div id="top">
            <img src="img/mainlogo.gif" />
            <div id="mid_element"></div>
        </div>
        <div id="bottom">
            <div id="bott_table">
                <p class="noshow" id="empty">账号密码不能为空</p>
                <p class ="noshow" id="error">账号密码错误</p>
            <table  style="border-collapse:collapse;width:300px;margin:0 auto;height:230px">
                <tr>
                    <td colspan="2"><h3 style="color: #616161;">超爽欢迎您...</h3></td>
                </tr>
                <tr style="height: 70px;">
                    <td style="text-align:right ;font-size:14px;color:#888">账号：</td>
                    <td>
                        <input type="text" class="user_input" id="username" name="username" />
                     </td>
                </tr>
                <tr>
                    <td style="text-align:right;font-size:14px;color:#888">密码：</td>
                    <td><input type="password" class="user_input" id="password" /></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="button" style="width: 206px;height: 30px;background-color: azure;margin-left: 20px;margin-top: 20px;"  id="login" name="submit" value="submit"/>
                        <p style="margin-left:20px"><a style="font-size:12px;text-decoration:none" href="regist.aspx"><span class="aspan1">没有账号?</span><span class="aspan2">go here...</span></a></p>
                    </td>
                 
                         
                    
                </tr>
            </table>
                </div>
        </div>
    </div>
    
</body>
</html>
