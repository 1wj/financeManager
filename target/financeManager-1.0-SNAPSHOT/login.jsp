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
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Document</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/index.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/jq/jquery-1.11.3.min.js" ></script>
</head>
<script type="text/javascript">
    $(function (){
        //点击注册按钮
        $(".zc").click(function (){
            document.location.href = "user/addUser.jsp";
        })
        //点击登录按钮
        $(".dl").click(function (){
            var usename=$("#usename").val();
            var password=$("#password").val();
            $.ajax({
                url:"${pageContext.request.contextPath}/security/do/login.do",
                data:{
                    "loginAcct":usename,
                    "userPswd":password
                },
                dataType:"json",
                type:"post",
                success:function (data) {
                    if("success"===data.data.flag){
                        //alert("成功");
                        document.location.href = "index.jsp";
                    }else {
                        alert("失败,请重新输入密码");
                        return false;
                    }
                }
            })
        })
    })
</script>
<body bgcolor="#272121">

    <div id="total">
        <form  action="#" method="post">
            <p>${SPRING_SECURITY_LAST_EXCEPTION.message}</p>
            <table  id="bg">
                <tr >
                    <td id="yhdl" align="center" >用户登录</td>
                </tr>
                <tr>
                     <td>
                         <input type='text' class="srk" placeholder="用户名：" name="loginAcct" id="usename">
                     </td>       
                </tr>
                <tr>
                    <td><input type="password"  class="srk" name="userPswd"  id="password"  placeholder="密码："  /></td>
                </tr>
                <tr>
                    <td align="right">
                        <input type="button"  value="注册" class="zc" />
                        <input type="button" id="submit" value="登录" class="dl" />
                    </td>               
                </tr>
            </table>
        </form>
    </div>

   
   
       
   
   
</body>

</html>