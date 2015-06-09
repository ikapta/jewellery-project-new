<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="productFind.aspx.cs" Inherits="productFind" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContentPlaceHolder" Runat="Server">
    <link href="css/validation_style.css" rel="stylesheet" />
    <link href="css/regist.css" rel="stylesheet" />
    <script src="js/jquery-1.6.2.min.js"></script>
    <script src="js/Validform_v5.3.2.js"></script>
    
    <style>
       .product_data {
            float: right;
            margin-top: -40px;
            
            height: 250px;
           
            font-size: 12px;
            padding-right: 40px;
            white-space: nowrap;
        }

        #noDataerror {
            display:none;
            font-size:12px;
            color:red;
        }
        .noshow {
            display:none;
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
                    <td colspan="3"><h3 style="color: #616161;">请输入珠宝名称查询...</h3></td>
                </tr>
                <tr>
                    <td class="font_color" style="text-align:right ;font-size:14px;width:200px;">产品名称：</td>
                    <td style="width:205px;"><input runat ="server" id="proname" type="text" value="" name="name" class="user_input" datatype="*" errormsg="不能为空！" /></td>
                    <td><div class="Validform_checktip"></div></td>
                    
                </tr>
               
                <tr>
                    <td colspan="3" style="text-align:center">
                       
                        <asp:Button ID="Button1" runat="server" Text="查找" OnClick="Button1_Click" style="width: 160px;height: 30px;background-color: azure;margin-right: 230px;"  />
                       
                    <asp:GridView ID="GridView1" runat="server" style="margin-left:500px" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="White" />
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                        </asp:GridView>

                    </td>
                </tr>
                        <tr>
                        <td colspan="3" style="text-align:center">
                             <p class="noshow" runat="server" id="noDataerror">no data!</p>
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

