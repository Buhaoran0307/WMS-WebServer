<!doctype html>
<html lang="en-US">
<head>
    <meta charset="utf-8">
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>ChartQuery</title>
    <script src="assets/js/echarts.js"></script>
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
            <p class="light">Changes in goods at different positions</p>
        </div>
        <div>
            <form action="/WMS-Web/Analysis?charts=3" method="post" id="form">
                <p>
                    <label for="1">Start Time :</label><input type="date" name="startTime" id="1"/>
                    <label for="2">End Time :</label><input type="date" name="endTime" id="2"/>
                </p>
                <p>
                    <label for="3">Position 1:</label><input type="text" id="3" name="position"/>
                    <label for="4">Position 2:</label><input type="text" id="4" name="position"/>
                    <label for="5">Position 3:</label><input type="text" id="5" name="position"/>
                    <button type="button" onclick="dataTest()" class="btn btn-info">SAVE</button>
                </p>
            </form>
        </div>
        <div id="main" style="width: 600px;height:400px;"></div>
        <script type="text/javascript">
            var myChart = echarts.init(document.getElementById('main'));
            var totalPositionList = ${totalPos};
            var positionList = ${positionArr}
            var positionNum = positionList.length;
            var Y = ${Y};
            var series0 = {
                name: 'Position 1',
                type: 'line',
                lineStyle: {
                    color: "blue",
                    width: "2"
                },
                showSymbol: false,
                // 设置拐点颜色以及边框
                itemStyle: {
                    color: "#0184d5",
                    borderColor: "rgba(221, 220, 107, .1)",
                    borderWidth: 12
                },
                data: []
            };
            var series1 = {
                name: 'Position 2',
                type: 'line',
                lineStyle: {
                    color: "red",
                    width: "2"
                },
                showSymbol: false,
                // 设置拐点颜色以及边框
                itemStyle: {
                    color: "#0184d5",
                    borderColor: "rgba(221, 220, 107, .1)",
                    borderWidth: 12
                },
                data: []
            };
            var series2 = {
                name: 'Position 3',
                type: 'line',
                lineStyle: {
                    color: "yellow",
                    width: "2"
                },
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
            seriesList.push(series0);
            seriesList.push(series1);
            seriesList.push(series2);

            var option = {
                title: {
                    text: ''
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ${positionArr}
                },
                grid: {
                    left: '3%',
                    right: '4%',
                    bottom: '3%',
                    containLabel: true
                },
                toolbox: {
                    feature: {
                        saveAsImage: {}
                    }
                },
                xAxis: {
                    type: 'category',
                    boundaryGap: false,
                    data: ${dateList}
                },
                yAxis: {
                    type: 'value'
                },
                series: []
            };
            for (var k = 0; k<positionNum; k++){
                option.series.push(seriesList[k]);
            }
            k = 0;
            for (k; k < positionNum; k++){
                option.series[k].data = Y[k];
                option.series[k].name = positionList[k];
            }
            myChart.setOption(option);
            function dataTest(){
                if (document.getElementById("1").value === "" || document.getElementById("2").value === ""){
                    alert("Please enter time !");
                    return;
                }
                var startTime = new Date(document.getElementById("1").value);
                var endTime = new Date(document.getElementById("2").value);
                var position;
                if (startTime.getTime() > endTime.getTime()){
                    alert("end time is earlier than start time !");
                    return
                }
                for (var i=3; i<6; i++){
                    position = document.getElementById(""+i).value;
                    if (position !== null && position !== "" ){
                        if(totalPositionList.indexOf(position) === -1){
                            alert("Error in Position INFO !");
                            return;
                        }
                    }
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
