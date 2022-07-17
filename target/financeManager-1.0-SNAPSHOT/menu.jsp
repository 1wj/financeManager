<%--
-Author(s): Wj
-Date: 2022/4/11 18:45
-Copyright:
-Description:  TODO
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String basePath = request.getScheme() + "://" +
            request.getServerName() + ":" + request.getServerPort() +
            request.getContextPath() + "/";
%>
<!DOCTYPE >
<html lang="en">
<head>
    <base href="<%=basePath%>" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap/3.3.7/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap/bs/bootstrap.css">
    <link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/menu.css"/>
    <script type="text/javascript" src="${pageContext.request.contextPath }/js/bootstrap/bs/bootstap.js"></script>
   <script type="text/javascript" src="${pageContext.request.contextPath}/jq/jquery-1.11.3.min.js">  </script>
    <script>
        $(document).ready(function () {
            $(".pan a").click(function () {
                $(".pan a").each(function () {
                    $(this).removeClass("active");
                })
                $("#" + $(this).attr("id")).addClass("active")
            })
        })
    </script>
    <script type="text/javascript">
        $(function () {
            $("#yhgl").click(function () {
                var qx='${user.type}';
                if (qx==1){  //1是管理员
                    var url= "${pageContext.request.contextPath }/user/user.jsp";
                    $(this).attr('href',url)
                }else {
                    alert("对不起，您的权限不足")
                }
            })
            $("#lyout").click(function () {
                /** parent.location表示上一层页面跳转,从主界面进行退出,避免局部刷新*/
                parent.location = "${pageContext.request.contextPath }/security/unLogin.do";
            })
        })
    </script>
</head>

<body>
    <div class="pan">
        <p style="padding-top: 10px; width:180px;font-size: 20px; ">经费管理系统</p>
        <a id="1" href="${pageContext.request.contextPath }/views/l1/szqk.jsp" target="show" class="active" style="width:150px; ">收支情况</a>
        <a id="2" href="${pageContext.request.contextPath }/views/l2/szls.jsp" target="show" style="width:150px; ">收支历史</a>
        <a id="3" href="${pageContext.request.contextPath }/views/l3/szbd.jsp" target="show" style="width:100px; ">收支对比</a>
        <p style="margin-left: 670px;"><a href="javascript:void(0)" target="show" type="button"
                style="margin-top: -16px; background: #252D47; border: none; color: #fff;" id="yhgl">用户管理&nbsp; |</a>
        </p>
        <div class="dropdown" style="float: left; margin-left: -30px; margin-right: 50px ;">
            <p><i class="glyphicon glyphicon-user"></i> &nbsp;${user.userName}</p>
            <div class="dropdown-content">
                <a href="javascript:void(0)" id="lyout">退出/注销</a>
            </div>
        </div>
    </div>

</body>
</html>