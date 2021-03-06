<%--
    -Author(s): Wj
    -Date: 2022/4/11 18:55
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
    <script type="text/javascript" src="${pageContext.request.contextPath}/jq/jquery-1.11.3.min.js"></script>
    <script src="${pageContext.request.contextPath }/js/echarts.js"></script>
    <link rel="stylesheet" type="text/css" href="css/szbd.css" />
</head>
<body>
    <div id="div1"></div>
    <div id="main" style="width: 400px;height:400px;"> </div>
    <div id="div3" ></div>
    <script type="text/javascript">
        $.ajax({
            url:"${pageContext.request.contextPath}/financeInfo/selectChartsFinanceInfoCompare",
            dataType:"json",
            type:"post",
            success:function (data){
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));
                // 指定图表的配置项和数据
                var option = {
                    title: {
                        text: '收支对比情况',

                        left: 'center'
                    },
                    tooltip: {
                        trigger: 'item'
                    },
                    toolbox: {
                        feature: {
                            dataView: { readOnly: false },
                            restore: {},
                            saveAsImage: {}
                        }
                    },
                    legend: {
                        orient: 'vertical',
                        left: 'left',
                        data: ['支出金额','收入金额']
                    },
                    series: [
                        {
                            name: '对比',
                            type: 'pie',
                            radius: '50%',
                            data: data
                        }
                    ]
                };
                // 使用刚指定的配置项和数据显示图表。
                myChart.setOption(option);
            }
        })


    </script>
</body>
</html>