<%@ Page Language="C#" AutoEventWireup="true" CodeFile="test.aspx.cs" Inherits="test" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="js/jquery-1.9.min.js"></script>
    <script>
        $(function () {
           
            //$.getJSON("json/test.json", function (data) {
            //    $("#test").html("");//清空info内容
            //    $.each(data.comments, function (i, item) {
            //        $("#test").append(
            //                "<div>" + item.id + "</div>" +
            //                "<div>" + item.nickname + "</div>" +
            //                "<div>" + item.content + "</div><hr/>");
            //    });
            //});


            $.ajax(
          {
              type: "get",
              url: "../json/test.txt",
              dataType:"json",
              success: function (data) {
                  $("#test").html("");//清空info内容
                  $.each(data.comments, function (i, item) {
                      $("#test").append(
                              "<div>" + item.id + "</div>" +
                              "<div>" + item.nickname + "</div>" +
                              "<div>" + item.content + "</div><hr/>");
                  });
              }
          })


        })
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div id="test">
        2
    </div>
    </form>
</body>
</html>
