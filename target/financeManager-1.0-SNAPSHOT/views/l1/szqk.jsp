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
%><!DOCTYPE >
<html lang="en">
<head>
    <base href="<%=basePath%>" />
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link  rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/szqk.css"/>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap/3.3.7/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/4.7.0/font-awesome.css">
    <script type="text/javascript" src="${pageContext.request.contextPath}/jq/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/bootstrap/3.3.7/bootstrap.min.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath }/My97DatePicker/WdatePicker.js"></script>
    <script type="text/javascript" defer>
        $(document).ready(function () {
            $("body").delegate('.edit','click',function () {
                //判断权限
                var qx='${user.type}';
                if (qx!=1){  //1是管理员
                    alert("对不起，您的权限不足")
                    return;
                }
                //获得当前行内的数据
                var currentRow = $(this).closest("tr");
                var user = currentRow.find("td:eq(0)").text(); 
                var event = currentRow.find("td:eq(1)").text(); 
                var time = currentRow.find("td:eq(2)").text(); 
                var money = currentRow.find("td:eq(3)").text(); 
                var type = currentRow.find("td:eq(4)").text(); 
                var paytime = currentRow.find("td:eq(7)").text(); 
                var tid = currentRow.find("td:eq(9)").text();
                var data = user + "\n" + event + "\n" + time + "\n" + money + "\n" + type + "\n" +
                    paytime+"\n"+tid;

                //对当前行单元格进行修改
                currentRow.find("td:eq(0)").html(
                    '<select class="form-select" style="width:100px;" >' +
                        '<option value="33">团队</option>' +
                        '<option value="34">团队2</option>' +
                        '<option value="35">团队3</option>' +
                    '</select>'
                )
                currentRow.find("td:eq(1)").html(
                    '<input style="width:80px" type="text" value="' +
                    event + '">'
                )
                currentRow.find("td:eq(2)").html(
                    '<input style="width:100px" type="text" value="' +
                    time + '">'
                )
                currentRow.find("td:eq(3)").html(
                    '<input style="width:50px" type="text" value="' +
                    money + '">'
                )
                currentRow.find("td:eq(4)").html(
                    '<select class="form-select" style="width:100px;">' +
                        '<option value="1">支出</option>' +
                        '<option value="2">收入</option>' +
                    '</select>'
                )
                currentRow.find("td:eq(7)").html(
                    '<input style="width:100px" type="text" value="' +
                    paytime + '">'
                )
                currentRow.find("td:eq(8)").html(
                    '<button id="editQd" type="button" style="height:32px" class="btn btn-primary">确定</button>' +
                    ' <button id="cancel" type="button" class="btn btn-default" data-dismiss="modal">取消</button> '
                )
                //获取修改后当前行的数据
                //点击确定按钮后事件
                $("#editQd").click(function () {
                    var currentRow1 = $(this).closest("tr");
                    var user1 = currentRow1.find("td:eq(0)").find("select").val();
                    var event1 = currentRow1.find("td:eq(1)").find(":text").val();
                    var time1 = currentRow1.find("td:eq(2)").find(":text").val();
                    var money1 = currentRow1.find("td:eq(3)").find(":text").val();
                    var type1 = currentRow1.find("td:eq(4)").find("select").val();
                    var paytime1 = currentRow1.find("td:eq(7)").find(":text").val();
                    var tid1 = currentRow.find("td:eq(9)").text();
                    //往后端传数据
                    $.ajax({
                        url:"${pageContext.request.contextPath}/financeInfo/editFinanceInfo",
                        data:{
                            "claimerUserId" : user1,
                            "reason" : event1,
                            "reasonTime" : time1,
                            "sum":money1,
                            "type":type1,
                            "updateTime" : paytime1,
                            "id":tid1
                        },
                        dataType:"json",
                        type:"post",
                        success:function (data){
                            if("success"===data.data.flag){
                                alert("数据修改成功")
                                //调用第一页数据
                                getClasstList(1);//传过去一个页数
                            }else {
                                alert("数据添加失败")
                            }
                        }
                    })
                })
                //点击取消按钮事件
                $("#cancel").click(function () {
                    currentRow.find("td:eq(0)").html(user);
                    currentRow.find("td:eq(1)").html(event);
                    currentRow.find("td:eq(2)").html(time);
                    currentRow.find("td:eq(3)").text(money); 
                    currentRow.find("td:eq(4)").text(type); 
                    currentRow.find("td:eq(7)").text(paytime);
                    var tid2 = currentRow.find("td:eq(9)").text();
                    currentRow.find("td:eq(8)").html(
                        '<a href="javascript:void(0)" class="edit">编辑</a>' +
                        ' <a href="javascript:void(0);" onclick="deleteRemark('+tid2+')" >删除</a>')
                })
            })
        })
    </script>

    <script type="text/javascript">
        $(function (){
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
            //当点击查询按钮
            $("#selectBtn").click(function (){
                getClasstList(1);
            })
            //当下拉框的值改变时
            $("#pageOfNums").change(function () {
                getClasstList(1);
            })
            //当点击某页时
            $(".lii").click(function () {
                var livalue=$(this).text();
               // alert(livalue)
                getClasstList(livalue);
            })
            //打开模态窗口
            $("#addMt").click(function (){
                var qx='${user.type}';
                if (qx!=1){  //1是管理员
                    alert("对不起，您的权限不足")
                }else {
                    $("#mymodal").modal('show');
                }
            })

            //点击确认增加数据
            $("#addDataBtn").click(function (){
                var addBxr=$("#addBxr").val();
                var addSy=$("#addSy").val();
                var addZcsj=$("#addZcsj").val();
                var addSzje=$("#addSzje").val();
                var addBxlx=$("#addBxlx").val();
                var addBxrq=$("#addBxrq").val();
                $.ajax({
                    url:"${pageContext.request.contextPath}/financeInfo/addFinanceInfo",
                    data:{
                        "claimerUserId" :addBxr,
                        "reason" : addSy,
                        "reasonTime" : addZcsj,
                        "sum":addSzje,
                        "type":addBxlx,
                        "createTime" : addBxrq, //当前页数 ，每页的数量固定为3
                    },
                    dataType:"json",
                    type:"post",
                    success:function (data){
                        var flag=data.data.flag
                        if("success"===flag){
                            //清空添加操作模态窗口的数据
                            var ss=$("#addForm")[0];
                            ss.reset();
                            //关闭模态窗口
                            $("#mymodal").modal('hide');
                            //调用第一页数据
                            getClasstList(1);//传过去一个页数
                        }else {
                            alert("数据添加失败")
                        }
                    }
                })
            })
        })

        //分页函数
        function getClasstList(pageNo){
            var xsid=$("#bxr").val();
            var startTime=$("#kssj").val();
            var endTime=$("#jssj").val();
            var pages=$("#pageOfNums").val();
            var jt1=(pageNo-1)*pages;
            var zjt1=Number(jt1)+Number(pages);
            $.ajax({
                url:"${pageContext.request.contextPath}/financeInfo/selectFinanceInfoByConditon",
                data:{
                    "claimerUserId" : xsid,
                    "startTime":startTime,
                    "endTime":endTime,
                    "current" : pageNo,         //当前页数 ，
                    "limit":   pages            //每页的数量
                },
                dataType:"json",
                type:"post",
                success:function (data){
                    //alert(2)
                    var html="";
                    $.each(data.data.rows,function (i,n){//每一个n就是一个对象
                        html +='<tr>';
                        html +='<td align="center">'+n.claimerUserId+'</td>';
                        html +='<td align="center">'+n.reason+'</td>';
                        html +='<td align="center">'+n.reasonTime+'</td>';
                        html +='<td align="center">'+n.sum+'</td>';
                        html +='<td align="center">'+n.type+'</td>';
                        html +='<td align="center">'+n.balance+'</td>';
                        html +='<td align="center">'+n.recorderUserId+'</td>';
                        html +='<td align="center">'+n.updateTime+'</td>';


                        html += "<td><a href='javascript:void(0);'  class='edit'>编辑</a>";
                        html += "  <a href='javascript:void(0);' onclick='deleteRemark(\""+n.id+"\")'>删除</a></td>";
                        html +='<td hidden="hidden">'+n.id+'</td>';
                        html +='</tr>';

                    })//注意上面删除的n.id前后要加""?
                    $("#tbody").html(html);
                     $("#zjls").val(data.data.count);                           //总记录数
                     $("#jt").val(jt1+1);                                         //几条
                     $("#zjt").val(zjt1>data.data.count?data.data.count:zjt1);  //至几条
                     $("#gjy").val(data.data.total);                             //共几页
                     $("#dqy").val(pageNo);                                     //第几页

                },
                //注意这个错误回调小心小心再小心
               error:function(){
                    //alert(1)
                   if('${user.userName}'===''){
                       parent.location="${pageContext.request.contextPath}/login.jsp";
                   }
                   // parent.location="${pageContext.request.contextPath}/login.jsp";
                }
            })
        }
        //删除函数
        function deleteRemark(id) {
         var qx='${user.type}';
            if (qx!=1){  //1是管理员
                alert("对不起，您的权限不足")
                return;
            }
            var c = confirm("确定删除吗");
            //判断
            if(!c) {//取消删除
                return;
            }
            $.ajax({
                url:"${pageContext.request.contextPath}/financeInfo/deleteFinanceInfo",
                data:{
                    "id" : id,
                },
                dataType:"json",
                type:"post",
                success:function (data){
                    var flag=data.data.flag
                    if("success"===flag){
                        alert("删除数据成功")
                        //调用第一页数据
                        getClasstList(1);//传过去一个页数
                    }else {
                        alert("删除添加失败")
                    }
                }
            })
        }
    </script>

</head>

<body>
<div id=div1></div>
<div id=div2>
    <div class="main-input">
        <input type="text"  style="height: 38px;width: 386px;" placeholder="请输入报销人,报销时间" class="bk" id="bxr"/>
        <input type="text" placeholder="起始时间"  style="height: 38px;width: 180px;" onclick="WdatePicker()" class="bk" id="kssj"/> -
        <input type="text" placeholder="结束时间"  style="height: 38px;width: 180px;" onclick="WdatePicker()" class="bk" id="jssj"/>
        <button class="addData" id="selectBtn">查询</button>
        <button class="addData" type="button" id="addMt" style=" position: absolute; right: 80px;">添加数据</button><!--data-toggle="modal" data-target="#mymodal"-->
        <!-- 模态弹出窗 -->
        <div class="modal fade" id="mymodal">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"><span
                                aria-hidden="true">&times;</span><span class="sr-only">Close</span></button>
                        <h4 class="modal-title">添加新数据</h4>
                    </div>
                    <div class="modal-body" style="height: 400px;">

                        <form id="addForm">
                            <table class="add">
                                <tr>
                                    <td style="width: 200px;"><label for="">报销人:</label></td>
                                    <td>
                                        <select class="form-select" style="width: 282px;height: 32px; border-radius: 3px;
                                    border: #216df5 solid 1px; " id="addBxr">
                                            <option value="33">团队</option>
                                            <option value="34">团队2</option>
                                            <option value="35">团队3</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 200px;"><label for="">报销事由:</label></td>
                                    <td>
                                        <input type="text" placeholder="请输入事由" class="bk" id="addSy" />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 200px;"><label for="">收入/支出时间:</label></td>
                                    <td>
                                        <input type="text" placeholder="收入支出时间"   onclick="WdatePicker()" class="bk" id="addZcsj"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 200px;"><label for="">收支金额:</label></td>
                                    <td>
                                        <input type="text" placeholder="请输入收支金额" class="bk" id="addSzje"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 200px;"><label for="">报销类型:</label></td>
                                    <td>
                                        <select class="form-select"
                                                style="width: 282px;float: right; margin-right: 20px; height: 32px;  border-radius: 3px;
                                        border: #216df5 solid 1px;" id="addBxlx">
                                            <option value="1">支 出</option>
                                            <option value="2">收 入</option>
                                        </select>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="width: 200px;">
                                        <label for="">报销日期:</label>

                                    </td>
                                    <td>
                                        <input type="text" placeholder="报销日期"   onclick="WdatePicker()" class="bk" id="addBxrq"/>
                                    </td>
                                </tr>
                            </table>
                        </form>>
                    </div>
                    <div class="modal-footer" style="text-align: center;">
                        <button type="button" class="btn btn-default " data-dismiss="modal" style=" background-color: #2986f7;
                        border-radius: 3px; border: gray solid 1px; width: 78px; height: 30px;color: #f0f2f5;">取消</button>
                        <button type="button" class="btn btn-primary " style=" background-color: #2986f7;
                        border-radius: 3px;border: gray solid 1px; width: 78px;height: 30px; color: #f0f2f5;" id="addDataBtn">确定</button>
                    </div>
                </div>
            </div>
        </div>


    </div>
    <div class="tab">
        <table class="mtb" >
            <tr >
                <th style="width: 120px; text-align: center;">报销人</th>
                <th style="text-align: center;">事由</th>
                <th style="text-align: center;">收入/支出时间</th>
                <th style="text-align: center;">收支金额</th>
                <th style="text-align: center;">类型</th>
                <th style="text-align: center;">剩余金额</th>
                <th style="text-align: center;">记录人</th>
                <th style="text-align: center;">报销时间</th>
                <th style="text-align: center;" colspan="2">操作</th>
            </tr>
            <tbody id="tbody">
            </tbody>
        </table>
        <span class="tbt">共&nbsp;
            <input type="text" id="zjls" style="border: 0px ;width: 20px;font-size: 15px">
            条记录，当前显示第
             <input type="text" id="jt" style="border: 0px ;width: 20px;font-size: 15px">
            -
             <input type="text" id="zjt" style="border: 0px ;width: 20px;font-size: 15px">
            条
            <select class="form-select" id="pageOfNums">
                <option>3</option><!--条/页-->
                <option>8</option>
                <option>5</option>
                <option>4</option>
                <option>2</option>
            </select>
        </span>

        <ul class="pagination">
            <li><a href="javascript:void(0)" id="previousPage"><<</a></li>
            <li class="lii"><a href="javascript:void(0)">1</a></li>
            <li class="lii"><a href="javascript:void(0)">2</a></li>
            <li class="lii"><a href="javascript:void(0)">3</a></li>
            <li class="lii"><a href="javascript:void(0)">4</a></li>
            <li class="lii"><a href="javascript:void(0)">5</a></li>
            <li class="lii"><a href="javascript:void(0)">6</a></li><!--class="active"-->
            <li class="disabled">
                <a href="javascript:void(0)">
                    <input type="text" id="dqy" style="border: 0px ;width: 20px;font-size: 15px">/
                    <input type="text" id="gjy" style="border: 0px ;width: 20px;font-size: 15px">页
                </a>
            </li>
            <li><a href="javascript:void(0)" id="nextPage">>></a></li>
        </ul>
    </div>

    <HR style="width: 95%; color: #000;">
    </HR>
</div>
<div id=div3></div>

</body>

</html>