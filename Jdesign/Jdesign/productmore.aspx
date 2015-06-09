<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="productmore.aspx.cs" Inherits="Jd_core_Default" %>
<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="cont" ContentPlaceHolderID="HeadContentPlaceHolder" runat="server">
    <style>
        #zhandian_menu {
            width: 200px;
            height: 400px;
            border: 1px solid #888;
            margin-top: 20px;
            padding-left: 40px;
            padding-top: 10px;
            background-color: #777;
            color: #fff;
            font-size: 14px;
            float:left;
        }
        .product_data {
            float: right;
            margin-top: 20px;
            width: 800px;
            height: 250px;
            text-align: center;
            font-size: 12px;
            line-height: 30px;
            white-space: nowrap;
        }
    </style>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <script>

    </script>
   
    <div id="zhandian_menu" >
        <asp:SiteMapDataSource ID="SiteMapDataSource1" runat="server" />
        <asp:TreeView ID="TreeView1" runat="server" DataSourceID="SiteMapDataSource1"></asp:TreeView>

    </div>
    <div id="product_data" class="product_data" runat="server">
     
     <div>
       产品类型：  <asp:DropDownList ID="DropDownList1" runat="server" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="True"></asp:DropDownList>

     </div>

        <asp:GridView ID="GridView1" style="width: 700px;margin-left: -60px;" runat="server" AllowPaging="True" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" PageSize="5" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCommand="GridView1_RowCommand" OnRowEditing="GridView1_RowEditing" >
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                <asp:BoundField DataField="id" HeaderText="产品编号" SortExpression="id" />
                <asp:BoundField DataField="ProductName" HeaderText="产品名称" SortExpression="ProductName" />
               <%-- <asp:BoundField DataField="产品类型" HeaderText="产品类型" SortExpression="产品类型" />--%>
                <asp:BoundField DataField="Price" HeaderText="产品价格" SortExpression="Price" />
                <asp:TemplateField HeaderText="操 作">
                  <ItemTemplate>
                      <asp:LinkButton ID="del" runat="server" CommandName="del" CommandArgument='<%# Eval("id")%>'>删除</asp:LinkButton>
                      <asp:LinkButton ID="upd" runat="server" CommandName="upd" CommandArgument='<%# Eval("id")%>'>修改</asp:LinkButton>
                  </ItemTemplate>
               </asp:TemplateField>

                    <asp:CommandField />

            </Columns>
                <FooterStyle BackColor="Silver" />
                <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                <PagerSettings FirstPageText="首页" LastPageText="末页" NextPageText="next" PageButtonCount="5" PreviousPageText="pre" />
                <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Right" />
                <RowStyle BackColor="#F7F7DE" />
                <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                <SortedAscendingCellStyle BackColor="#FBFBF2" />
                <SortedAscendingHeaderStyle BackColor="#848384" />
                <SortedDescendingCellStyle BackColor="#EAEAD3" />
                <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    
    
    
     


    </div>

    
</asp:Content>

