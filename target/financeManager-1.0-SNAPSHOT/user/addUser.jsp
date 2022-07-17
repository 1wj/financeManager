<%--
    -Author(s): Wj
    -Date: 2022/4/11 18:59
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/addUser.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/jq/jquery-1.11.3.min.js" ></script>
</head>
<script type="text/javascript">
    $(function(){

        //手机号校验
        $("#phone").blur(function(){
            var a= $(this).val()
            var b=/^1(3[0-9]|5[0-3,5-9]|7[1-3,5-8]|8[0-9])\d{8}$/
            var ok=b.test(a);
            if(!ok){
                alert("手机号不合法");
            }
        })
        //身份证号校验
        $("#sfid").blur(function(){
            var a= $(this).val()
            var b= /^([1-6][1-9]|50)\d{4}(18|19|20)\d{2}((0[1-9])|10|11|12)(([0-2][1-9])|10|20|30|31)\d{3}[0-9Xx]$/
            var ok=b.test(a);
            if(!ok){
                alert("身份证不合法");
            }
        })



        var isAdd=$("#ycl").val();
        var flag=1;   //默认 1是修改  2是注册
        if(isAdd===null || isAdd==="") {
            flag = 2  //说明是注册
        }else{
            $("#span1").text("用户修改");  //说明是用户修改 就改变标题
        }

        //点击确认按钮
       $("#btn2").click(function () {
           if(flag==2){
               login()
           }
           else {
               edit()
           }
       })
        //点击取消按钮
        $("#btn1").click(function () {
            if(flag==2) {
               // alert(2)
                document.location.href = "login.jsp";
            }else {
                //alert(1)
                document.location.href = "${pageContext.request.contextPath}/user/user.jsp";
            }
        })


    })

    //修改函数
    function edit() {
        var id=$("#ycl").val();
        var loginName=$("#loginName").val();
        var userName=$("#userName").val();
        var passwd1=$("#passwd1").val();
        var passwd2=$("#passwd2").val();
        var phone=$("#phone").val();
        var sfid=$("#sfid").val();
        if($.trim(loginName)==null || $.trim(loginName)==""){
            alert("用户名不能为空");
            return false;
        }
        if($.trim(userName)==null || $.trim(userName)==""){
            alert("姓名不能为空");
            return false;
        }
        if( passwd1==null|| passwd1==""){
            alert("密码不能为空");
            return false;
        }
        if( passwd1!==passwd2){
            alert("密码不一致");
            return false;
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/user/editUser",
            data:{
                "id":id,
                "loginName":loginName,
                "userName":userName,
                "password":passwd1,
                "idNo":sfid,
                "phoneNo":phone
            },
            dataType:"json",
            type:"post",
            success:function (data) {
                if("success"===data.data.flag){
                    //alert("成功");
                    document.location.href = "${pageContext.request.contextPath}/user/user.jsp";
                }else {
                    alert("失败,请重新修改");
                    return false;
                }
            }
        })
    }

    //注册函数
    function login(){
        var loginName=$("#loginName").val();
        var userName=$("#userName").val();
        var passwd1=$("#passwd1").val();
        var passwd2=$("#passwd2").val();
        var phone=$("#phone").val();
        var sfid=$("#sfid").val();
        //注意trim()用法
        if($.trim(loginName)==null || $.trim(loginName)==""){
            alert("用户名不能为空");
            return false;
        }
        if($.trim(userName)==null || $.trim(userName)==""){
            alert("姓名不能为空");
            return false;
        }
        if( passwd1==null|| passwd1==""){
            alert("密码不能为空");
            return false;
        }
        if( passwd1!==passwd2){
            alert("密码不一致");
            return false;
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/user/addUser",
            data:{
                "loginName":loginName,
                "userName":userName,
                "password":passwd1,
                "idNo":sfid,
                "phoneNo":phone
            },
            dataType:"json",
            type:"post",
            success:function (data) {
                if("success"===data.data.flag){
                    //alert("成功");
                    document.location.href = "login.jsp";
                }else {
                    alert("失败,请重新输入密码");
                    return false;
                }
            }
        })
    }
</script>
<body>
    <div id=div1><span id="span1">用户注册</span></div>
        <form action="#">
            <div id=div2>
                <table border="0">
                    <tr>
                        <td colspan="5" style=" font-weight: 550;
                        font-size: 20px;">基本信息  <span id="span2">默认密码 ( 000000 ) </span></td>
                    </tr>
                    <tr>
                        <td class="rgbc">
                            <span class="sp2" style="color: #ff0000;" >*</span>
                            用户名
                        </td>
                        <td><input type="text" placeholder="  请输入用户名" class="inp" id="loginName" value="${user11.loginName}"/></td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td class="rgbc">
                            <span class="sp2" style="color: #ff0000;" >*</span>
                            姓名
                        </td>
                        <td><input type="text" placeholder="  请输入姓名" class="inp" id="userName" value="${user11.userName}"/></td>
                    </tr>
                    <tr>
                        <td class="rgbc">
                            <span class="sp2" style="color: #ff0000;" >*</span>
                            密码
                        </td>
                        <td><input type="password" placeholder="  请输入密码" class="inp" id="passwd1" value="${user11.password}"/></td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td class="rgbc">
                            <span class="sp2" style="color: #ff0000;" >*</span>
                            密码核对
                        </td>
                        <td><input type="password" placeholder="  请核对密码" class="inp" id="passwd2" value="${user11.password}"/></td>
                    </tr>
                    <tr>
                        <td class="rgbc">
                            <span class="sp2" style="color: #ff0000;" >*</span>
                            手机号
                        </td>
                        <td><input type="text" placeholder="  请输入手机号" class="inp" id="phone" value="${user11.phoneNo}"/></td>
                        <td>&nbsp;&nbsp;&nbsp;&nbsp;
                        </td>
                        <td class="rgbc">身份证号</td>
                        <td><input type="text" placeholder="  请输入身份证号" class="inp" id="sfid" value="${user11.idNo}"/></td>
                    </tr>
                    <tr>
                        <td colspan="5"  hidden="hidden">
                            <input type="text"  class="inp" id="ycl" value="${user11.id}"/>
                        </td>
                    </tr>
                </table>
             </div>
            <div id="div3">
                <input type="button" value="取消" id="btn1"/>
                <input type="button" value="确认" id="btn2"/>
            </div>
        </form>
</body>
</html>