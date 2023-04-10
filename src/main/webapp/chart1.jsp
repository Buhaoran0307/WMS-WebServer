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
            <form action="/WMS-Web/Analysis?charts=1" method="post" id="form">
                <p>
                    <label for="1">Start Time :</label><input type="date" name="startTime" id="1"/>
                    <label for="2">End Time :</label><input type="date" name="endTime" id="2"/>
                </p>
                <p align="center">
                    <button type="button" onclick="dataTest()" class="btn btn-info">SAVE</button>
                </p>
            </form>
        </div>
        <p></p>
        <div id="main" style="width: 600px;height:390px;"></div>
        <script type="text/javascript">
            var myChart = echarts.init(document.getElementById('main'));
            var option = {
                title: {
                    text: ''
                },
                tooltip: {
                    trigger: 'axis'
                },
                legend: {
                    data: ['Blue', 'Green', 'Yellow', 'Red', 'Total']
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
                series: [
                    {
                        name: 'Blue',
                        type: 'line',
                        stack: 'Total',
                        data: ${datablue}
                    },
                    {
                        name: 'Green',
                        type: 'line',
                        stack: 'Total',
                        data: ${datagreen}
                    },
                    {
                        name: 'Yellow',
                        type: 'line',
                        stack: 'Total',
                        data: ${datayellow}
                    },
                    {
                        name: 'Red',
                        type: 'line',
                        stack: 'Total',
                        data: ${datared}
                    },
                    {
                        name: 'Total',
                        type: 'line',
                        stack: 'Total',
                        data: ${data}
                    }
                ]
            };
            myChart.setOption(option);
            //Error Test
            function dataTest(){
                if (document.getElementById("1").value === "" || document.getElementById("2").value === ""){
                    alert("Please enter time!");
                    return;
                }
                var startTime = new Date(document.getElementById("1").value);
                var endTime = new Date(document.getElementById("2").value);
                if (startTime.getTime() > endTime.getTime()){
                    alert("end time is earlier than start time!");
                    return
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
