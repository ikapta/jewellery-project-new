<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="productEdit.aspx.cs" Inherits="productEdit" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
    <link href="css/validation_style.css" rel="stylesheet" />
    <link href="css/regist.css" rel="stylesheet" />
    <script src="js/jquery-1.6.2.min.js"></script>
    <script src="js/Validform_v5.3.2.js"></script>
    
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
          .product_data {
            float: right;
            margin-top: -40px;
            
            height: 250px;
           
            font-size: 12px;
            padding-right: 40px;
            white-space: nowrap;
        }
        </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
   
    <div id="zhandian_menu" >
        <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
        <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1"></asp:TreeView>

    </div>
  
      
    <div id="product_data" class="product_data registerform" runat="server">
        <div id="bott_table">
              
                    
            <table  style="border-collapse:collapse;width:800px;margin:0 auto;height:230px">
                <tr>
                    <td colspan="3"><h3 style="color: #616161;">请输入珠宝各信息...</h3></td>
                </tr>
                <tr>
                    <td class="font_color" style="text-align:right ;font-size:14px;width:200px;">产品编号：</td>
                    <td><input runat ="server" id="productid" readonly="true" type="text" value="" name="name" class="user_input" datatype="*" errormsg="不能为空！" /></td>
                    <td><div class="Validform_checktip"></div></td>
                    
                </tr>
                 <tr>
                    <td class="font_color" style="text-align:right ;font-size:14px;width:200px;">产品名称：</td>
                    <td><input runat ="server" id="proname" type="text" value="" name="name" class="user_input" datatype="*" errormsg="不能为空！" /></td>
                    <td><div class="Validform_checktip"></div></td>
                    
                </tr>
                <tr>
                    <td class="font_color" style="text-align:right ;font-size:14px;width:200px;">产品类型：</td>
                    <td> <asp:DropDownList ID="DropDownList1" runat="server"></asp:DropDownList></td>
                    <td><div class="Validform_checktip"></div></td>
                    
                </tr>
                 <tr>
                    <td class="font_color" style="text-align:right ;font-size:14px;width:200px;">产品价格：</td>
                    <td><input runat="server" id="projia" type="text" value="" name="name" class="user_input" datatype="*" errormsg="不能为空！" /></td>
                    <td><div class="Validform_checktip"></div></td>
                    
                </tr>
                  <tr>
                    <td class="font_color" style="text-align:right ;font-size:14px;width:200px;">是否推荐：</td>
                    <td style="width:205px;">
                        <asp:CheckBox ID="ckbIsRecommend" runat="server" /></td>
                    <td><div class="Validform_checktip"></div></td>
                    
                </tr>
                  <tr>
                    <td class="font_color" style="text-align:right ;font-size:14px;width:200px;">上传图片：</td>
                    <td style="width:205px;">      <asp:FileUpload ID="FileUpload1" runat="server" class="user_input"  datatype="*" errormsg="不能为空！" /> <asp:Literal ID="ltlmsg" runat="server"></asp:Literal></td>
                    <td><div class="Validform_checktip"></div></td>
                    
                </tr>
                  <tr>
                    <td class="font_color" style="text-align:right ;font-size:14px;width:200px;">原图：</td>
                    <td style="width:205px;">     <asp:Image ID="myimg" runat="server"  BorderWidth="1" Width="150px" Height="80px" /><br /></td>
                    <td><div class="Validform_checktip"></div></td>
                    
                </tr>
                <tr>
                    <td colspan="3" style="text-align:center">
                        <asp:Button ID="Button1"  style="width: 180px;height: 30px;background-color: azure;margin-right: 209px;margin-top: 20px;" runat="server" Text="确认修改" OnClick="Button1_Click" />
                  
                    </td>
                </tr>
            </table>
         
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
               }

           })
       })

</script>

   
  
</asp:Content>
