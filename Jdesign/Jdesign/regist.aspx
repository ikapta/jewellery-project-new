<%@ Page Language="C#" AutoEventWireup="true" CodeFile="regist.aspx.cs" Inherits="Jd_core_regist" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link href="css/validation_style.css" rel="stylesheet" />
    <link href="css/regist.css" rel="stylesheet" />
    <link href="css/jquery-ui-1.10.3.custom.css" rel="stylesheet" />
    <script src="js/jquery-1.6.2.min.js"></script>
    <script src="js/Validform_v5.3.2.js"></script>
    <script src="js/jquery-ui-1.10.3.custom.js"></script>
    
    <style>
        .noshow {
            display:none;
           color:red;
           font-size:12px;
           position:absolute;
           top: 300px;
           left: 490px;
        }
        .font_color {
            color:#888
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
                <form class="registerform" method="post">
                    <p class ="noshow" id="error">账号已存在!</p>
            <table  style="border-collapse:collapse;width:800px;margin:0 auto;height:230px">
                <tr>
                    <td colspan="3"><h3 style="color: #616161;">超爽欢迎您...</h3></td>
                </tr>
                <tr>
                    <td class="font_color" style="text-align:right ;font-size:14px;width:200px;">账号：</td>
                    <td style="width:205px;"><input id="username" type="text" value="" name="name" class="user_input" datatype="/[a-zA-Z][a-zA-Z0-9]{3,15}/" errormsg="昵称必须是字母开头且至少4个字符,最多16个字符！" /></td>
                    <td><div class="Validform_checktip"></div></td>
                    
                </tr>
                <tr>
                    <td class="font_color" style="text-align:right;font-size:14px">密码：</td>
                    <td style="width:205px;">
                        <input id="password" type="password" value="" name="userpassword" class="user_input" datatype="*6-16" nullmsg="请设置密码！" errormsg="密码范围在6~16位之间！" />
                    </td>
                    <td><div class="Validform_checktip"></div></td>
                </tr>
                 <tr>
                    <td class="font_color" style="text-align:right;font-size:14px">确认密码：</td>
                    <td><input id="surepassword" type="password" value="test" name="userpassword2" tip="test" class="user_input" datatype="*" recheck="userpassword" nullmsg="请再输入一次密码！" errormsg="您两次输入的账号密码不一致！" /></td>
                    <td><div class="Validform_checktip"></div></td>
                </tr>
                <tr>
                    <td class="font_color" style="text-align:right;font-size:14px">性别：</td>
                    <td>
                        <input type="radio" value="1" name="gender" id="male" class="user_input" datatype="*" errormsg="请选择性别！" /><label for="male">男</label>
                        <input type="radio" value="2" name="gender" id="female" class="user_input" /><label for="female">女</label>
                    </td>
                    <td><div class="Validform_checktip"></div></td>
                </tr>
                <tr>
                    <td class="font_color" style="text-align:right;font-size:14px">出生日期：</td>
                    <td><input id="user_birth" type="text" readonly class="user_input date" datatype="*" nullmsg="请输入日期" /></td>
                    <td><div class="Validform_checktip"></div></td>
                </tr>
              <%--  <tr>
                    <td style="text-align:right;font-size:14px;">验证码：</td>
                    <td>
                        <input class="user_input" style="width:80px;" type="text" />
                        <img  src="mm.jpg"/>
                    </td>
                    <td></td>
                </tr>--%>
                <tr>
                    <td colspan="3" style="text-align:center">
                        <input type="submit" style="width: 160px;height: 30px;background-color: azure;margin-right: 229px;margin-top: 20px;"  id="submit" name="submit" value="submit"/>
                        <p style="margin-right: 250px;"><a style="font-size:12px;text-decoration:none" href="login.aspx"><span class="aspan1">已有账号?</span><span class="aspan2">go here...</span></a></p>
                    </td>
                </tr>
            </table>
           </form>
                </div>
        </div>
    </div>
   <script type="text/javascript">
       $(function () {
           //$(".registerform").Validform();  //就这一行代码！;
           $(".registerform").Validform({
               tiptype: function (msg, o, cssctl) {
                   if (!o.obj.is("form")) {
                       var objtip = o.obj.parents("td").next().find(".Validform_checktip");
                       cssctl(objtip, o.type);
                       objtip.text(msg);
                   }
               }, ajaxPost: true,
               beforeSubmit: function () {
                   var username = $("#username").val();
                   var password = $("#password").val();
                   var sexarray = $("input[name='gender']");
                   var usersex = sexarray[0].checked ? "男" : "女";
                   var userbirth = $("#user_birth").val();
                   $.ajax(
                     {
                         type: "POST",
                         url: "ajax/regist.ashx",
                         data: "username=" + escape(username) + "&password=" + escape(password) + "&usersex=" + escape(usersex) + "&userbirth=" + escape(userbirth),
                         success: function (msg) {
                             if (msg == "fail") {
                                 $("#error").show();
                             }
                             else {
                                 window.location.href = "content.aspx";
                             }
                         },
                         error: function (XMLHttpRequest, textStatus, thrownError) {
                         }
                     })
               }

           });
           $("#user_birth").change(function () { this.focus() }).datepicker({
               changeMonth: true,
               changeYear: true,
           }); $("#ui-datepicker-div").css('font-size', '0.8em');
        

       })
     
</script>

</body>
</html>
