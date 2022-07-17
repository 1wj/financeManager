<%--
    -Author(s): Wj
    -Date: 2022/4/11 18:50
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
    <script src="${pageContext.request.contextPath }/js/echarts.js"></script>
    <script type="text/javascript" src="${pageContext.request.contextPath}/jq/jquery-1.11.3.min.js"></script>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/szls.css" />
</head>
<body>
    <div id="div1"></div>
    <div id="main" style="width: 600px;height:500px;"> </div>
    <div id="div3" ></div>
    <script type="text/javascript">
        $.ajax({
            url:"${pageContext.request.contextPath}/financeInfo/selectChartsFinanceInfoHistory",
            dataType:"json",
            type:"post",
            success:function (data){
                // 基于准备好的dom，初始化echarts实例
                var myChart = echarts.init(document.getElementById('main'));
                // 指定图表的配置项和数据
                var option = {
                    title: {
                        text: '收支历史情况',
                        left:'center'
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
                    xAxis: {
                        splitLine:{
                            show:false
                        },
                        name:'报纳日期',
                        type: 'category',
                        data: data.dataList
                    },
                    yAxis: {
                        type: 'value',
                        min:-2000,
                        max:5000,
                        name:'剩余总额'
                    },
                    grid: {
                        top: '15%',  // 组件离容器上侧的距离,百分比字符串或整型数字
                        left: '5%',    // 组件离容器左侧的距离,百分比字符串或整型数字
                        right: '15%',
                        bottom: '20%',
                        containLabel: true ,//grid 区域是否包含坐标轴的刻度标签，
                    },
                    dataZoom: [{  show: true,
                        // 是否显示滚动图，依然可以滚动缩放
                        realtime: true,
                        start: 0,
                        // 默认起始位置  end: 55 // 默认终点位置
                    },
                        {  type: 'inside',
                            realtime: true,
                            start: 45,
                            end: 85
                        }],
                    series: [
                        {
                            data: data.balaceList,
                            type: 'line',
                            itemStyle : {undefined,
                                normal : {undefined,
                                    color:'#e19c9a'
                                }
                            }
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