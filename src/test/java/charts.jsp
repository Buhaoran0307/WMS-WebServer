<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2022/7/26
  Time: 9:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <script src="js/param.js"></script>
    <script src="js/jquery-3.3.1.js" type="application/javascript"></script>
    <script src="js/echarts.min.js"></script>
    <title>数据统计</title>
    <style>
        .box {
            width: 400px;
            height: 400px;
            background-color: bisque;
        }

        a {
            color: red;
        }
    </style>
</head>
<body style="background:url('./images/bck2.jpg') no-repeat 0px 0px;background-size:cover ;color: yellow">
<div style="width: 95%;text-align: center;margin: 0px auto;">
    <div><h1>Data Analysis</h1><h5><a href="/WarehouseWebServer/GoodsServlet" style="margin-left: 25%;">货物信息</a><a
            href="personDetail.html" style="margin-left: 5%;">个人信息</a></h5></div>
    <div style="text-align: left;display: inline-block;vertical-align: top;">
        <form action="/WarehouseWebServer/Analysis" method="post" ID="1">
            <p>
                查询时间：
                <input type="date" value="" name="g1time"/>
                <button type="submit">查询</button>
            </p>
        </form>
    </div>
    <div class="box" id="main" style="width: 600px;height:400px;display: inline-block"></div>
    <div style="text-align: right;display: inline-block;vertical-align: top;">
        <form action="/WarehouseWebServer/Analysis" method="post" id="1">
            <p>
                起始时间：<input type="date" value="" name="g2StartTime"/>
                结束时间：<input type="date" value="" name="g2EndTime"/>
                position 1:
                <input type="text" value="" name="g2Position"/>
                position 2:
                <input type="text" value="" name="g2Position"/>
                position 3:
                <input type="text" value="" name="g2Position"/>
                <button type="button" onclick="g2Select()">查询</button>
            </p>
        </form>
    </div>
    <div class="box" id="main2" style="width: 600px;height:400px;display: inline-block"></div>
    <div>
        <form action="/WarehouseWebServer/Analysis" method="post" id="2">
            <p>
                起始时间：
                <input type="date" value="" name="g3StartTime"/>
                结束时间：
                <input type="date" value="" name="g3EndTime"/>
                <button type="button" onclick="g3Select()">查询</button>
            </p>
        </form>
    </div>
    <div class="box" id="main3" style="width: 600px;height:400px;margin: 0 auto"></div>
</div>
</body>
<script>
    var position = ["2,1","1,0"];
    // 基于准备好的dom，初始化echarts实例
    var myChart = echarts.init(document.getElementById('main'));
    var myChart2 = echarts.init(document.getElementById('main2'));
    var myChart3 = echarts.init(document.getElementById('main3'));
    //5.定义数据存放数组(动态变)
    var kinds = ['red', 'green', 'blue', 'yellow'];
    //option1
    var names = []; //建立一个类别数组（实际用来盛放X轴坐标值）
    var nums = []; //建立一个销量数组（实际用来盛放Y坐标值）
    for (var k = 0; k < kinds.length; k++) {
        var count = 0;
        names.push(kinds[k]);
        for (var l = 0; l<${goods}.length; l++){
            if (${goods}[l].colour === kinds[k]) {
                count++;
            }
        }
        nums.push(count);
    }
    //没有下句话不显示数据
    $.ajaxSettings.async = false;
    var option = {
        title: {
            text: ${g1Title}
        },
        tooltip: {},
        legend: {
            data: ['分类统计']
        },
        xAxis: {
            data: names
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            name: '种类',
            type: 'bar',
            markPoint: { //标记点:标记出最大值和最小值
                data: [
                    {
                        type: 'max',
                        name: '最大值'
                    },
                    {
                        type: 'min',
                        name: '最小值'
                    }
                ]
            },
            data: nums,
            label: {
                show: true, //每条柱子的数值显示
                rotate: 60,//数值旋转60度显示
                position: 'inside', //数值显示在柱子的哪个位置，top为柱子的顶部，inside为柱子内部
            },
            barWidth: '40%', //调节柱子的宽度
        }]
    };
    var seriesP0 = {
        name: "P1",
        type: 'line',
        smooth: true,
        // 单独修改当前线条的样式
        lineStyle: {
            color: "red",
            width: "2"
        },
        // 填充颜色设置
        areaStyle: {
            color: new echarts.graphic.LinearGradient(
                0,
                0,
                0,
                1,
                [
                    {
                        offset: 0,
                        color: "rgba(1, 132, 213, 0.4)" // 渐变色的起始颜色
                    },
                    {
                        offset: 0.8,
                        color: "rgba(1, 132, 213, 0.1)" // 渐变线的结束颜色
                    }
                ],
                false
            ),
            shadowColor: "rgba(0, 0, 0, 0.1)"
        },
        // 设置拐点
        symbol: "circle",
        // 拐点大小
        symbolSize: 8,
        // 开始不显示拐点， 鼠标经过显示
        showSymbol: false,
        // 设置拐点颜色以及边框
        itemStyle: {
            color: "#0184d5",
            borderColor: "rgba(221, 220, 107, .1)",
            borderWidth: 12
        },
        data: [],
    };
    var seriesP1 = {
        name: 'P2',
        type: 'line',
        smooth: true,
        // 单独修改当前线条的样式
        lineStyle: {
            color: "yellow",
            width: "2"
        },
        // 填充颜色设置
        areaStyle: {
            color: new echarts.graphic.LinearGradient(
                0,
                0,
                0,
                1,
                [
                    {
                        offset: 0,
                        color: "rgba(1, 132, 213, 0.4)" // 渐变色的起始颜色
                    },
                    {
                        offset: 0.8,
                        color: "rgba(1, 132, 213, 0.1)" // 渐变线的结束颜色
                    }
                ],
                false
            ),
            shadowColor: "rgba(0, 0, 0, 0.1)"
        },
        // 设置拐点
        symbol: "circle",
        // 拐点大小
        symbolSize: 8,
        // 开始不显示拐点， 鼠标经过显示
        showSymbol: false,
        // 设置拐点颜色以及边框
        itemStyle: {
            color: "#0184d5",
            borderColor: "rgba(221, 220, 107, .1)",
            borderWidth: 12
        },
        data: []
    };
    var seriesP2 = {
        name: 'P3',
        type: 'line',
        smooth: true,
        // 单独修改当前线条的样式
        lineStyle: {
            color: "blue",
            width: "2"
        },
        // 填充颜色设置
        areaStyle: {
            color: new echarts.graphic.LinearGradient(
                0,
                0,
                0,
                1,
                [
                    {
                        offset: 0,
                        color: "rgba(1, 132, 213, 0.4)" // 渐变色的起始颜色
                    },
                    {
                        offset: 0.8,
                        color: "rgba(1, 132, 213, 0.1)" // 渐变线的结束颜色
                    }
                ],
                false
            ),
            shadowColor: "rgba(0, 0, 0, 0.1)"
        },
        // 设置拐点
        symbol: "circle",
        // 拐点大小
        symbolSize: 8,
        // 开始不显示拐点， 鼠标经过显示
        showSymbol: false,
        // 设置拐点颜色以及边框
        itemStyle: {
            color: "#0184d5",
            borderColor: "rgba(221, 220, 107, .1)",
            borderWidth: 12
        },
        data: []
    };
    var seriesList = [];
    seriesList.push(seriesP0);
    seriesList.push(seriesP1);
    seriesList.push(seriesP2);
    var option2 = {
        title: {
            text: ${g2Title}
        },
        tooltip: {
            trigger: "axis"
        },
        grid: {
            left: "10",
            top: "30",
            right: "10",
            bottom: "10",
            containLabel: true
        },
        xAxis: {
            type: "category",
            boundaryGap: false,
            // 文本颜色为rgba(255,255,255,.6)  文字大小为 12
            axisLabel: {
                textStyle: {
                    color: "black",
                    fontSize: 12
                }
            },
            // x轴线的颜色为   rgba(255,255,255,.2)
            axisLine: {
                lineStyle: {
                    color: "black"
                }
            },
            data:${g2X}
        },
        yAxis: {
            type: "value",
            axisTick: {show: false},
            axisLine: {
                lineStyle: {
                    color: "black"
                }
            },
            axisLabel: {
                textStyle: {
                    color: "black",
                    fontSize: 12
                }
            },
            // 修改分割线的颜色
            splitLine: {
                lineStyle: {
                    color: "rgba(255,255,255,.1)"
                }
            }
        },
        series: []
    };
    var g2Y = ${g2Y};
    var g2Label = ${g2Label};
    var positionNum = ${positionNum};
    for (var i=0 ;i<positionNum ;i++){
        option2.series.push(seriesList[i]);
    }
    for (var j=0 ;j<positionNum ;j++){
        option2.series[j].data = g2Y[j];
        option2.series[j].name = g2Label[j];
    }
    var option3 = {
        title: {
            text: ${g2Title}
        },
        tooltip: {},
        legend: {
            data: ['分类统计']
        },
        xAxis: {
            data: ${g3X}
        },
        yAxis: {
            type: 'value'
        },
        series: [{
            name: "红",
            smooth: true,
            type: 'line',
            markPoint: { //标记点:标记出最大值和最小值
                data: [
                    {
                        type: 'max',
                        name: '最大值'
                    },
                    {
                        type: 'min',
                        name: '最小值'
                    }
                ]
            },
            data: ${g3Yr},
            barWidth: '40%', //调节柱子的宽度
        }, {
            name: '蓝',
            type: 'line',
            smooth: true,
            markPoint: { //标记点:标记出最大值和最小值
                data: [
                    {
                        type: 'max',
                        name: '最大值'
                    },
                    {
                        type: 'min',
                        name: '最小值'
                    }
                ]
            },
            data: ${g3Yb},
            barWidth: '40%', //调节柱子的宽度
        },{
            name: '黄',
            type: 'line',
            smooth: true,
            markPoint: { //标记点:标记出最大值和最小值
                data: [
                    {
                        type: 'max',
                        name: '最大值'
                    },
                    {
                        type: 'min',
                        name: '最小值'
                    }
                ]
            },
            data: ${g3Yy},
            barWidth: '40%', //调节柱子的宽度
        },{
            name: '绿',
            type: 'line',
            smooth: true,
            markPoint: { //标记点:标记出最大值和最小值
                data: [
                    {
                        type: 'max',
                        name: '最大值'
                    },
                    {
                        type: 'min',
                        name: '最小值'
                    }
                ]
            },
            data: ${g3Yg},
            barWidth: '40%', //调节柱子的宽度
        },{
            name: '总',
            type: 'line',
            smooth: true,
            markPoint: { //标记点:标记出最大值和最小值
                data: [
                    {
                        type: 'max',
                        name: '最大值'
                    },
                    {
                        type: 'min',
                        name: '最小值'
                    }
                ]
            },
            data: ${g3Y0},
            barWidth: '40%', //调节柱子的宽度
        }]
    };
    myChart.setOption(option);
    myChart2.setOption(option2);
    myChart3.setOption(option3);
    function g3Select(){
        var startTime=new Date($("input[name='g3StartTime']").val());
        var endTime=new Date($("input[name='g3EndTime']").val());
        if(startTime.getTime()>endTime.getTime()){
            alert("出库时间不能小于入库时间！");
            return;
        }
        document.getElementById("2").submit();
    }
    function g2Select(){
        var startTime=new Date($("input[name='g2StartTime']").val());
        var endTime=new Date($("input[name='g2EndTime']").val());
        var position1=$("input[name='g1Position']").val();
        var position2=$("input[name='g2Position']").val();
        var position3=$("input[name='g3Position']").val();
        if(startTime.getTime()>endTime.getTime()){
            alert("出库时间不能小于入库时间！");
            return;
        }
        for (let i = 0; i < position.length; i++) {
            if(position[i].indexOf(position1)==-1||position[i].indexOf(position2)==-1||position[i].indexOf(position3)==-1){
                alert("请输入正确的位置！");
                return;
            }
        }
        document.getElementById("1").submit();
    }
</script>
</html>
