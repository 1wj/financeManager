<%--
    -Author(s): Wj
    -Date: 2022/4/11 15:59
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
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/user.css" />
    <script type="text/javascript" src="${pageContext.request.contextPath}/jq/jquery-1.11.3.min.js"></script>
</head>
<body>
<script type="text/javascript">
    $(function () {
        getClasstList(1);//传过去一个页数
        //当点击上一页时
        $("#previousPage").click(function (){
            var pageNo=$("#dqy").val();
            if(pageNo!=1){
                getClasstList(pageNo-1);
            }
        });
        //当点击下一页时
        $("#nextPage").click(function (){
            var pageNo=$("#dqy").val();
            if(pageNo<$("#gjy").val()){
                getClasstList(parseInt(pageNo)+1);
            }
        });
        //当点击某页时
        $(".lii").click(function () {
            var livalue=$(this).val();
            //alert(livalue)
            getClasstList(livalue);
        })
        //点击导出按钮
        $("#dcinfo").click(function () {
            $.ajax({
                url:"${pageContext.request.contextPath}/user/printExcel",
                data:{},
                dataType:"json",
                type:"get",
                success:function (data){
                    var flag=data.data.flag
                    if("success"===flag){
                        alert("导出用户成功")
                    }else {
                        alert("导出用户失败")
                    }
                }
            })
        })
    })

    //分页函数
    function getClasstList(pageNo){
         var jt1=(pageNo-1)*4;
         var zjt1=Number(jt1)+Number(4);
        $.ajax({
            url:"${pageContext.request.contextPath}/user/selectUserList",
            data:{
                "current" : pageNo,
            },
            dataType:"json",
            type:"post",
            success:function (data){
                var html="";
                $.each(data.data.lists,function (i,n){//每一个n就是一个对象
                    if(i % 2!=0){
                        html +='<tr bgcolor="#ecf1f9">';
                        html +='<td align="center" class="yy">'+n.userName+'</td>';
                        html +='<td align="center">'+n.loginName+'</td>';
                        html +='<td align="center">'+n.idNo+'</td>';
                        html +='<td align="center">'+n.phoneNo+'</td>';
                        html +='<td><a href="${pageContext.request.contextPath}/user/selectUserByid?id='+n.id+'">编辑</a>&nbsp;|&nbsp;';
                        html +='<a href="javascript:void(0);" onclick="deleteRemark(\''+n.id+'\')">删除</a></td>';
                        html +='<td hidden="hidden">'+n.id+'</td>';
                        html +='</tr>';
                    }else {
                        html +='<tr >';
                        html +='<td align="center" class="yy">'+n.userName+'</td>';
                        html +='<td align="center">'+n.loginName+'</td>';
                        html +='<td align="center">'+n.idNo+'</td>';
                        html +='<td align="center">'+n.phoneNo+'</td>';
                        html +='<td><a href="${pageContext.request.contextPath}/user/selectUserByid?id='+n.id+'">编辑</a>&nbsp;|&nbsp;';
                        html +='<a href="javascript:void(0);" onclick="deleteRemark(\''+n.id+'\')">删除</a></td>';
                        html +='<td hidden="hidden">'+n.id+'</td>';
                        html +='</tr>';
                    }
                })//注意上面删除的n.id前后要加""?
                $("#tbody").html(html);
                $("#zjls").val(data.data.counts);  //总记录数
                $("#jt").val(jt1+1);                 //几条
                $("#zjt").val(zjt1>data.data.counts?data.data.counts:zjt1);//至几条
                $("#gjy").val(data.data.total);                             //共几页
                $("#dqy").val(pageNo);                                     //第几页
            }
        })
    }
    //删除函数
    function deleteRemark(id) {
        var c = confirm("确定删除吗");
        //判断
        if(!c) {//取消删除
            return;
        }
        $.ajax({
            url:"${pageContext.request.contextPath}/user/deleteUserById",
            data:{
                "id" : id,
            },
            dataType:"json",
            type:"post",
            success:function (data){
                var flag=data.data.flag
                if("success"===flag){
                    alert("删除用户成功")
                    //调用第一页数据
                    getClasstList(1);//传过去一个页数
                }else {
                    alert("删除用户失败")
                }
            }
        })
    }
</script>
    <div id="div1" >
        <button id="dcinfo">导出用户信息</button>
    </div>
    <div id="div2">
        <table  id="tab"  >
            <tr class="bgc1">
                <th class="yy">姓名</th>
                <th>用户名</th>
                <th>身份证号</th>
                <th>手机号</th>
                <th colspan="2" align="center">操作</th>
            </tr>
            <tbody id="tbody">
            </tbody>
        </table>
        <div>
            <div id="xsjl">
                <input type="text" id="zjls" style="border: 0px ;width: 20px;font-size: 15px">
                条记录，当前显示第
                <input type="text" id="jt" style="border: 0px ;width: 20px;font-size: 15px">
                -
                <input type="text" id="zjt" style="border: 0px ;width: 20px;font-size: 15px">
                条
            </div>
            
            <div  id="fycx">
                    <input type="button" value="<" id="previousPage">
                    <input type="button" value="1" class="lii" >
                    <input type="button" value="2" class="lii" >
                    <input type="button" value="3" class="lii">
                    <a style="font-size: 15px">
                        <input type="text" id="dqy" style="border: 0px ;width: 20px;font-size: 15px">/
                        <input type="text" id="gjy" style="border: 0px ;width: 20px;font-size: 15px">页
                    </a>
                    <input type="button" value=">" style="background-color: #e9f3fe;" id="nextPage">
            </div>
        </div>

      
        
        
        
    </div>
    
    
</body>
</html>