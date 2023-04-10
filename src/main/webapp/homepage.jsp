<!doctype html>
<html lang="en-US">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Warehouse Management System</title>
    <link href="assets/css/singlePageTemplate.css" rel="stylesheet" type="text/css">
    <link href="assets/css/bootstrap-4.3.1.css" rel="stylesheet" type="text/css">
    <!--The following script tag downloads a font from the Adobe Edge Web Fonts server for use within the web page. We recommend that you do not modify it.-->
    <script>var __adobewebfontsappname__="dreamweaver"</script>
    <script src="assets/js/jquery-3.6.0.min.js"></script>
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

        a{text-decoration: none;}
        table {border-collapse:collapse;width: 100%;font-size: 14px;}
        th{background-color: #ddd;}
        table, td, th {border:1px solid #e7e8ec;}
        th,tr{height: 40px;}
        td {text-align: center;}
        tr:hover{background-color: #f9f4f3;}
        .barcon {width: 1000px;margin: 0 auto;text-align: center;}
        .barcon2 {float: right;}
        .barcon2 ul {margin: 20px 0;padding-left: 0;list-style: none;text-align: center;}
        .barcon2 li {display: inline;}
        .barcon2 a {font-size: 16px;font-weight: normal;display: inline-block;padding: 5px;padding-top: 0;color: black;border: 1px solid #ddd;background-color: #fff;}
        .barcon2 a:hover{background-color: #eee;}
        .ban {opacity: .4;}
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
    <section class="about" id="about">
        <h2 class="hidden">About</h2>
        <form name="form" id="form" action="/WMS-Web/Search" method="post">
            <p>
                <label for="startTime">Start Time:</label> <input type="date" name="startTime" id="startTime">
                <label for="endTime">End Time:</label><input type="date" name="endTime" id="endTime">
            </p>
            <p>
                <label for="colour">Colour:</label><input type="text" name="colour" id="colour">
                <label for="position">Position:</label><input type="text" name="position" id="position">
                <label for="wID">WarehouseID:</label><input type="text" value="" name="wID" id="wID">
                <input type="submit" value="Search">
            </p>
        </form>
        <table width="950" cellpadding="0" cellspacing="0" class="table2" align="center">
            <thead>
            <tr align="center">
                <th width="150" height="33" class="td2">GoodsID</th>
                <th width="250" class="td2">name</th>
                <th width="250" class="td2">type</th>
                <th width="250" class="td2">Position</th>
                <th width="250" class="td2">WarehouseID</th>
                <th width="250" class="td2">EntryTime</th>
                <th width="250" class="td2">DeliveryTime</th>
            </tr>
            </thead>
            <tbody id="myTable">
            </tbody>
        </table>
        <div id="barcon" class="barcon" >
            <div id="barcon2" class="barcon2">
                <ul>
                    <li><a href="###" id="prePage">Lastpage</a></li>
                    <li id="barcon1"></li>
                    <li><a href="###" id="nextPage">Nextpage</a></li>
                    <li><input type="text" id="num" size="2" oninput="value=value.replace(/[^\d]/g,'')"></li>
                    <li><a href="###" id="jumpPage" onclick="jumpPage()">jump</a></li>
                </ul>
            </div>
        </div>
        <script>
            function dynamicAddUser(){
                var goodsList = ${goodsList};
                for(var i=0;i<goodsList.length;i++)
                {
                    var trNode=document.createElement("tr");
                    $(trNode).attr("align","center");
                    //货物序号
                    var tdNodeNum=document.createElement("td");
                    $(tdNodeNum).html(goodsList[i].goodsID);
                    tdNodeNum.style.width = "150px";
                    tdNodeNum.style.height = "33px";
                    tdNodeNum.className = "td2";
                    //货物名称
                    var tdNodeName=document.createElement("td");
                    $(tdNodeName).html(goodsList[i].name);
                    tdNodeName.style.width = "250px";
                    tdNodeName.style.height = "33px";
                    tdNodeName.className = "td2";
                    //货物颜色
                    var tdNodeColor=document.createElement("td");
                    $(tdNodeColor).html(goodsList[i].colour);
                    tdNodeColor.style.width = "250px";
                    tdNodeColor.className = "td2";
                    //货物位置
                    var tdNodePos=document.createElement("td");
                    $(tdNodePos).html(goodsList[i].location);
                    tdNodePos.style.width = "250px";
                    tdNodePos.className = "td2";
                    //仓库ID
                    var tdNodeWID=document.createElement("td");
                    $(tdNodeWID).html(goodsList[i].warehouseID);
                    tdNodeWID.style.width = "250px";
                    tdNodeWID.className = "td2";
                    //入库时间
                    var tdNodeTime1 = document.createElement("td");
                    $(tdNodeTime1).html(goodsList[i].dateIn);
                    tdNodeTime1.style.width = "250px";
                    tdNodeTime1.className = "td2";
                    //出库时间
                    var tdNodeTime2 = document.createElement("td");
                    console.log(goodsList[i].dateOut);
                    $(tdNodeTime2).html(goodsList[i].dateOut);
                    tdNodeTime2.style.width = "250px";
                    tdNodeTime2.className = "td2";

                    trNode.appendChild(tdNodeNum);
                    trNode.appendChild(tdNodeName);
                    trNode.appendChild(tdNodeColor);
                    trNode.appendChild(tdNodePos);
                    trNode.appendChild(tdNodeWID);
                    trNode.appendChild(tdNodeTime1);
                    trNode.appendChild(tdNodeTime2);
                    $("#myTable")[0].appendChild(trNode);
                }
            }
            $(function(){
                dynamicAddUser();
                goPage(1,10);
            })
            /**
             * 分页函数
             * pno--页数
             * psize--每页显示记录数
             * 分页部分是从真实数据行开始，因而存在加减某个常数，以确定真正的记录数
             * 纯js分页实质是数据行全部加载，通过是否显示属性完成分页功能
             **/
            var pageSize=5;//每页显示行数
            var currentPage_=1;//当前页全局变量，用于跳转时判断是否在相同页，在就不跳，否则跳转。
            var totalPage;//总页数
            function goPage(pno,psize){
                var itable = document.getElementById("myTable");
                var num = itable.rows.length;//表格所有行数(所有记录数)

                pageSize = psize;//每页显示行数
                //总共分几页
                if(num/pageSize > parseInt(num/pageSize)){
                    totalPage=parseInt(num/pageSize)+1;
                }else{
                    totalPage=parseInt(num/pageSize);
                }
                var currentPage = pno;//当前页数
                currentPage_=currentPage;
                var startRow = (currentPage - 1) * pageSize+1;
                var endRow = currentPage * pageSize;
                endRow = (endRow > num)? num : endRow;

                $("#myTable tr").hide();
                for(var i=startRow-1;i<endRow;i++) {
                    $("#myTable tr").eq(i).show();
                }

                var tempStr = currentPage+"/"+totalPage;
                document.getElementById("barcon1").innerHTML = tempStr;

                if(currentPage>1){
                    $("#firstPage").on("click",function(){
                        goPage(1,psize);
                    }).removeClass("ban");
                    $("#prePage").on("click",function(){
                        goPage(currentPage-1,psize);
                    }).removeClass("ban");
                }else{
                    $("#firstPage").off("click").addClass("ban");
                    $("#prePage").off("click").addClass("ban");
                }

                if(currentPage<totalPage){
                    $("#nextPage").on("click",function(){
                        goPage(currentPage+1,psize);
                    }).removeClass("ban")
                    $("#lastPage").on("click",function(){
                        goPage(totalPage,psize);
                    }).removeClass("ban")
                }else{
                    $("#nextPage").off("click").addClass("ban");
                    $("#lastPage").off("click").addClass("ban");
                }
            }

            function jumpPage() {
                var num=parseInt($("#num").val());
                if(num != currentPage_ && !isNaN(num) && num <= totalPage && num > 0) {
                    goPage(num,pageSize);
                }
            }
        </script>
    </section>
    <br>
    <br/>

    <!-- Stats Gallery Section -->
    <p>&nbsp;</p>
    <p>&nbsp;</p>
    <p class="light">Chart Query</p>
    <div class="gallery">
        <div class="thumbnail">
            <p class="col-xl-11">Daily variation of total quantity of goods in warehouse / certain type of goods&nbsp; &nbsp;</p>
            <button type="button" class="btn btn-info"><a href="/WMS-Web/Analysis?charts=1">query</a></button>
        </div>
        <div class="thumbnail">
            <p class="col-xl-11">Proportion / quantity situation</p>
            <p class="col-xl-11"> of</p>
            <p class="col-xl-11">different categories of goods</p>
            <button type="button" class="btn btn-info"><a href="/WMS-Web/Analysis?charts=2">query</a></button>
        </div>
        <div class="thumbnail">
            <p class="col-xl-11">Changes in goods</p>
            <p class="col-xl-11">at</p>
            <p class="col-xl-11">different locations</p>
            <button type="button" class="btn btn-info"><a href="/WMS-Web/Analysis?charts=3">query</a></button>
        </div>
    </div>
    <!-- More Info Section -->
    <footer>
        <article class="footer_column">
            <h3>LOCATION</h3>
            <img src="images/pattern.png" alt="" width="400" height="200" class="cards"/>
            <p></p>
        </article>
        <article class="footer_column">
            <h3>LOCATION</h3>
            <img src="images/2.png" alt="" width="400" height="200" class="cards"/>
            <p></p>
        </article>
    </footer>
    <!-- Footer Section -->
    <section class="footer_banner" id="contact">
        <h2 class="hidden">Footer Banner Section </h2>
        <p class="hero_header">&nbsp; &nbsp;&nbsp; &nbsp;</p>
        <div class="button">subscribe</div>
    </section>
    <!-- Copyrights Section -->
    <div class="copyright">&copy;2022- <strong>GROUP25&nbsp;</strong></div>
</div>
<!-- Main Container Ends -->
</body>
</html>
