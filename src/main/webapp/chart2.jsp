<!doctype html>
<html lang="en-US">
<head>
    <meta charset="utf-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ChartQuery</title>
    <script src="assets/js/echarts.min.js"></script>
    <link href="assets/css/singlePageTemplate.css" rel="stylesheet" type="text/css">
    <link href="assets/css/bootstrap-4.3.1.css" rel="stylesheet" type="text/css">
    <!--The following script tag downloads a font from the Adobe Edge Web Fonts server for use within the web page. We recommend that you do not modify it.-->
    <script>var __adobewebfontsappname__="dreamweaver"</script>
    <script src="http://use.edgefonts.net/source-sans-pro:n2:default.js" type="text/javascript"></script>
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
    <style type="text/css">
        body {background-color:lightcyan}
        p {margin-left: 1px}
    </style>
</head>
<body>
<!-- Main Container -->
<div class="container">
    <!-- Navigation -->
    <header>
        <nav>
            <ul>
                <p></p>
                <li><a href="/WMS-Web/HomePage">HOME</a></li>
                <li><a href="/WMS-Web/Profile">PROFILE</a></li>
            </ul>
        </nav>
    </header>
    <!-- Hero Section -->
    <section class="hero" id="hero">
        <h2 class="hero_header">WAREHOUSE MONITORING SYSTEM</h2>
    </section>
    <!-- About Section -->
    <section class="about" id="about" align="center">
        <div>
            <p class="light">Proportion / quantity situation of different categories of goods</p>
        </div>
        <div>
            <form action="/WMS-Web/Analysis?charts=2" method="post" id="form">
                <p>
                    <label for="1">Start Time:</label>
                    <input type="date" name="startTime" value="" id="1"/>
                    <label for="2">End Time:</label>
                    <input type="date" name="endTime" value="" id="2"/>

                </p>
                <p align="center">
                    <label for="3">WarehouseID:</label><input type="text" id="3" name="warehouseID"/>
                    <br>
                <p></p>
                    <button type="button" onclick="dataTest()" class="btn btn-info">SAVE</button>
                </p>
            </form>
        </div>
    </section>
    <p></p>
    <section>
        <div id="main" style="width: 600px;height:420px;"></div>
        <script type="text/javascript">
            // based on prepared DOM, initialize echarts instance
            var myChart = echarts.init(document.getElementById('main'));
            var Time = [];
            var blue = [];
            var green = [];
            var yellow = [];
            var red =  [];
            var i = 0;
            Time.push("product");
            for (i;i<${dateList}.length;i++){
                Time.push(${dateList}[i])
            }
            blue.push("Blue");
            i = 0;
            for (i;i<${blue}.length;i++){
                blue.push(${blue}[i])
            }
            green.push("Green");
            i = 0;
            for (i;i<${green}.length;i++){
                green.push(${green}[i])
            }
            yellow.push("Yellow");
            i = 0;
            for (i;i<${yellow}.length;i++){
                yellow.push(${yellow}[i])
            }
            red.push("Red");
            i = 0;
            for (i;i<${red}.length;i++){
                red.push(${red}[i])
            }
            // specify chart configuration item and data
            setTimeout(function () {
                option = {
                    legend: {},
                    tooltip: {
                        trigger: 'axis',
                        showContent: false
                    },
                    dataset: {
                        source: []
                    },
                    xAxis: { type: 'category' },
                    yAxis: { gridIndex: 0 },
                    grid: { top: '55%' },
                    series: [
                        {
                            type: 'line',
                            smooth: true,
                            seriesLayoutBy: 'row',
                            emphasis: { focus: 'series' }
                        },
                        {
                            type: 'line',
                            smooth: true,
                            seriesLayoutBy: 'row',
                            emphasis: { focus: 'series' }
                        },
                        {
                            type: 'line',
                            smooth: true,
                            seriesLayoutBy: 'row',
                            emphasis: { focus: 'series' }
                        },
                        {
                            type: 'line',
                            smooth: true,
                            seriesLayoutBy: 'row',
                            emphasis: { focus: 'series' }
                        },
                        {
                            type: 'pie',
                            id: 'pie',
                            radius: '30%',
                            center: ['50%', '25%'],
                            emphasis: {
                                focus: 'self'
                            },
                            label: {
                                formatter: '{b}: {@2012} ({d}%)'
                            },
                            encode: {
                                itemName: 'product',
                                value: '2012',
                                tooltip: '2012'
                            }
                        }
                    ]
                };
                option.dataset.source.push(Time);
                option.dataset.source.push(blue);
                option.dataset.source.push(green);
                option.dataset.source.push(yellow);
                option.dataset.source.push(red);
                myChart.on('updateAxisPointer', function (event) {
                    const xAxisInfo = event.axesInfo[0];
                    if (xAxisInfo) {
                        const dimension = xAxisInfo.value + 1;
                        myChart.setOption({
                            series: {
                                id: 'pie',
                                label: {
                                    formatter: '{b}: {@[' + dimension + ']} ({d}%)'
                                },
                                encode: {
                                    value: dimension,
                                    tooltip: dimension
                                }
                            }
                        });
                    }
                });
                myChart.setOption(option);
            });
            var wIDs=${wIDs}
            //function part
            function dataTest(){
                if (document.getElementById("1").value === "" || document.getElementById("2").value === ""){
                    alert("Please enter time!");
                    return;
                }
                if (wIDs.indexOf(document.getElementById("3").value) === -1){
                    alert("Error in warehouseID INFO!")
                    return;
                }
                document.getElementById("form").submit();
            }
        </script>
    </section>
    <!-- More Info Section -->
    <footer>
    </footer>
    <!-- Footer Section -->
    <section class="footer_banner" id="contact">
        <h2 class="hidden">Footer Banner Section </h2>
        <p class="hero_header"></p>
    </section>
    <!-- Copyrights Section -->
    <div class="copyright">&copy;2022- <strong>GROUP 25</strong></div>
</div>
<!-- Main Container Ends -->
</body>
</html>
