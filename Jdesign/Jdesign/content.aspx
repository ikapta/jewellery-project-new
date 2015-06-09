<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="content.aspx.cs" Inherits="content" %>

<%@ MasterType VirtualPath="~/MasterPage.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <script>
        $(function () {
            //中部图片区域
            var $div_li = $("ul.contheadul li");
            var $div_img = $("div.surround img");

            $div_li.hover(function () {
                $(this).addClass("selected").siblings().removeClass("selected");
                var index = $div_li.index(this);
                $div_img.eq(index).fadeIn(2000)
                .siblings().hide();
            })

            //右部导航
            $(function () {
                var $muli = $(".menuNext ul li");
                $muli.hover(function () {
                    $(this).addClass("now").siblings().removeClass("now");
                })
            })

            //产品加入购物车
            $(function () {
                var $imgxin = $("img.chuxian");
                $(".teshu").hide();
                $(".ch_left1", this).hover(function () {
                    $(".teshu", this).slideToggle(0);
                })
                $(".pro_ulli li").bind("mouseover", function () {
                    $(".hidde", this).stop(false, true).show();
                }).bind("mouseout", function () {
                    $(".hidde", this).stop(false, true).hide();
                })


            })
        })
    </script>
    <div id="conthead">
        <div class="surround">
            <img src="img/s.jpg" width="1271px" height="400px;" />
            <img src="img/s2.jpg" width="1271px" height="400px" class="hide" />
        </div>
        <ul class="contheadul">
            <li>1</li>
            <li>2</li>
        </ul>
    </div>

    <div class="navleft">
        <ul id="menu" class="nav">
            <li><a href="####">产品宝库        <span>></span> </a>
                <ul class="innerul">
                    <li><a href="####">海水系列</a></li>
                    <li><a href="####">钻石系列</a></li>
                </ul>
            </li>
            <li><a href="####">活动一览        <span>></span></a>
                <ul class="innerul">
                    <li><a href="####">恋爱类</a></li>
                    <li><a href="####">婚庆类</a></li>
                    <li><a href="####">寿星类</a></li>
                    <li><a href="####">状元类</a></li>
                    <li><a href="####">周年纪念</a></li>
                </ul>
            </li>
            <li><a href="####">公司文化      <span>></span></a>
                <ul class="innerul">
                    <li>审核中...</li>
                    <li>审核中...</li>
                    <li>审核中...</li>
                </ul>
            </li>
            <li><a href="####">人才引荐       <span>></span></a>
                <ul class="innerul">
                    <li>审核中...</li>
                    <li>审核中...</li>
                    <li>审核中...</li>
                </ul>
            </li>
            <li><a href="####">售后服务       <span>></span></a>
                <ul class="innerul">
                    <li>审核中...</li>
                    <li>审核中...</li>
                    <li>审核中...</li>
                </ul>
            </li>
        </ul>

        <div class="menuNext">
            <ul>
                <li class=" now">本周</li>
                <li>上周</li>
                <li>以往</li>
            </ul>
            <p>精品推荐 <span>推荐度：87%</span></p>
            <img src="img/menugood1.jpg" />
            <p><span class="grey">点击量：</span><span class="red fontBold">2000</span></p>
        </div>
    </div>


    <div class="content">
        <div class="contHead">
            <h3>璀璨的钻石在等你</h3>
            <div class="ch_left1">
                <%--<img value="<%=IsRecommendId %>" src="img/zuanshi/aiying.jpg" class="ch_left chuxian" runat="server" id="imgSrc"  width="331" height="506"/>
                <p class="teshu hiddle"><span class="p_span1"><a href='ShoppingCart.aspx?ID=<%=IsRecommendId%>&ProductName=<%=strProductName%>'>加入购物车</a></span><span class="p_span2"><a href="ProductDetail.aspx?id=<%=IsRecommendId %>">查看详情</a></span></p>--%>
                <img src="img/zuanshi/aiying.jpg" class="ch_left chuxian" runat="server" id="imgSrc"  width="331" height="506"/>
               <%-- <p class="teshu hiddle"><span class="p_span1"><a href='ShoppingCart.aspx?ID=<%# Eval("ID")%>&ProductName=<%# Eval("ProductName")%>'>加入购物车</a></span><span class="p_span2"><a href="ProductDetail.aspx?id=<%#Eval("Id") %>">查看详情</a></span></p>--%>
            </div>

            <div id="products">
                <ul class="pro_ulli">


                    <asp:Repeater ID="Rep_Product" runat="server">
                        <ItemTemplate>
                            <li>
                                </a><a href="ProductDetail.aspx?id=<%#Eval("Id") %>"><img value="<%#Eval("Id") %>" src="<%#Eval("Url") %>" class="chuxian" /></a>
                                <p class=" pro_xiangxi hidde"><a href='ShoppingCart.aspx?ID=<%# Eval("ID")%>&ProductName=<%# Eval("ProductName")%>'><span class="p_span1">加入购物车</span></a><a href="ProductDetail.aspx?id=<%#Eval("Id") %>"><span class="p_span2">查看详情</span></a></p>
                                <p class="pro_font">
                                    <span class="p_headspan"><%#Eval("ProductName") %></span><br />
                                    <span class="Col999 size12">价格：</span><span class="yello pro_pspan"><%#Eval("Price") %>$</span><span class="Col999 size12">销量：</span><span class="hui">100</span>
                                </p>
                            </li>

                        </ItemTemplate>
                    </asp:Repeater>


              <%--     <li>
                        <img value="7" src="img/zuanshi/zuan7.jpg" class="chuxian" />
                        <p class=" pro_xiangxi hidde"><span class="p_span1">加入购物车</span><span class="p_span2">查看详情</span></p>
                        <p class="pro_font">
                            <span class="p_headspan">顶级紫钻</span><br />
                            <span class="Col999 size12">价格：</span><span class="yello pro_pspan">200,000$</span><span class="Col999 size12">销量：</span><span class="hui">100</span>
                        </p>
                    </li>
                    <li>
                        <img value="2" src="img/zuanshi/zuan2.jpg" class="chuxian" />
                        <p class=" pro_xiangxi hidde"><span class="p_span1">加入购物车</span><span class="p_span2">查看详情</span></p>
                        <p class="pro_font">
                            <span class="p_headspan">顶级水钻</span><br />
                            <span class="Col999 size12">价格：</span><span class="yello pro_pspan">200,000$</span><span class="Col999 size12">销量：</span><span class="hui">100</span>
                        </p>
                    </li>
                    <li>
                        <img value="8" src="img/zuanshi/zuan8.jpg" class="chuxian" />
                        <p class=" pro_xiangxi hidde"><span class="p_span1">加入购物车</span><span class="p_span2">查看详情</span></p>
                        <p class="pro_font">
                            <span class="p_headspan">顶级黄钻</span><br />
                            <span class="Col999 size12">价格：</span><span class="yello pro_pspan">200,000$</span><span class="Col999 size12">销量：</span><span class="hui">100</span>
                        </p>
                    </li>
                    <li>
                        <img value="9" src="img/zuanshi/zuan9.jpg" class="chuxian" />
                        <p class=" pro_xiangxi hidde"><span class="p_span1">加入购物车</span><span class="p_span2">查看详情</span></p>
                        <p class="pro_font">
                            <span class="p_headspan">顶级水钻</span><br />
                            <span class="Col999 size12">价格：</span><span class="yello pro_pspan">200,000$</span><span class="Col999 size12">销量：</span><span class="hui">100</span>
                        </p>
                    </li>
                    <li>
                        <li>
                            <img value="10" src="img/zuanshi/zuan10.jpg" class="chuxian" />
                            <p class=" pro_xiangxi hidde"><span class="p_span1">加入购物车</span><span class="p_span2">查看详情</span></p>
                            <p class="pro_font">
                                <span class="p_headspan">顶级蓝钻</span><br />
                                <span class="Col999 size12">价格：</span><span class="yello pro_pspan">200,000$</span><span class="Col999 size12">销量：</span><span class="hui">100</span>
                            </p>
                        </li>
                        <li>
                            <img value="11" src="img/zuanshi/zuan11.jpg" class="chuxian" />
                            <p class=" pro_xiangxi hidde"><span class="p_span1">加入购物车</span><span class="p_span2">查看详情</span></p>
                            <p class="pro_font">
                                <span class="p_headspan">顶级晶钻</span><br />
                                <span class="Col999 size12">价格：</span><span class="yello pro_pspan">200,000$</span><span class="Col999 size12">销量：</span><span class="hui">100</span>
                            </p>
                        </li>--%>
                </ul>
            </div>

        </div>

    </div>
    <div id="bottom_plezent">
        <div class="plezen_bg">
            <img src="img/plesant_bg.gif" />
        </div>
        <h3>精美礼品  随机送<%--<span class="more">more<span class="small">>></span></span>--%> </h3>

        <ul>
            <li>
                <img src="img/pleasent/1314763493.jpg" /></li>
            <li>
                <img src="img/pleasent/1314762769.jpg" /></li>
            <li>
                <img src="img/pleasent/1314763227.jpg" /></li>
            <li>
                <img src="img/pleasent/1314762852.jpg" /></li>
            <li>
                <img src="img/pleasent/1314763581.jpg" /></li>
        </ul>

    </div>
    <script type="text/javascript">
        //$(function () {
        //    $(".content img").click(function () {
        //        imgSrc = $(this).attr("src");
        //        imgValue = $(this).attr("value");
        //        //  window.location.href = "ProductDetail.aspx?value=" + imgValue + "&imgSrc=" + imgSrc;
        //        window.location.href = "ProductDetail.aspx?value=" + imgValue;
        //    })
        //})
    </script>
</asp:Content>

