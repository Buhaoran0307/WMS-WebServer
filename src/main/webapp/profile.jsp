<%--
  Created by IntelliJ IDEA.
  User: 13096
  Date: 2022/7/29
  Time: 4:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Warehouse Management System</title>
    <!-- loader-->
    <link href="assets/css/pace.min.css" rel="stylesheet" />
    <script src="assets/js/pace.min.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <!-- App CSS -->
    <link rel="stylesheet" href="assets/css/app.css" />
</head>
<body class="bg-theme bg-theme1">
<div class="card-body p-md-5">
    <form action="/WMS-Web/ChangeINF" method="POST" id="form" >
        <div class="text-center">
            <h3 class="mt-4 font-weight-bold">Personal Information</h3>
        </div>
        <div class="form-group mt-4">
            <label>Account Name</label>
            <input type="text" id="user_account" readonly="readonly" name="user_account" class="form-control"/>
        </div>
        <div class="form-group" >
            <label>Password</label>
            <label style="white-space:pre; color: orangered">    ${changeINF_msg}</label>
            <div class="input-group" id="show_hide_password">
                <input class="form-control border-right-0" type="password" id="user_password" placeholder="Enter your password to change information !" name="user_password" value="">
            </div>
        </div>
        <div class="form-row">
            <div class="form-group col-md-6 col-xl-12">
                <label>User Name</label>
                <input type="text" id="user_name" name="user_name" class="form-control"/>
            </div>
        </div>
        <div class="form-group">
            <label>E-mail</label>
            <input type="text" class="form-control" id="user_email" name="user_email" placeholder="example@xx.com"/>
        </div>
        <div class="form-group">
            <label>Gender</label>
            <input type="text" id="user_gender" name="user_gender" class="form-control"/>
        </div>
        <div class="form-group">
            <label>TEL</label>
            <input type="text" id="user_tel" name="user_tel" class="form-control"/>
        </div>
        <div class="form-group">
            <label>Salary(￥)</label>
            <input type="text" id="user_salary" readonly="readonly" name="user_salary" class="form-control"/>
        </div>
        <div class="form-group">
            <label>Working Place</label>
            <input type="text" id="user_wID" readonly="readonly" name="user_wID" class="form-control"/>
        </div>

        <!--check in db-->
        <div class="btn-group mt-3 w-100">
            <button type="button" class="btn btn-light btn-block" onclick="dataTest2()" >Change Information</button>
            <br></br>
            <button type="button" class="btn btn-light btn-block" ><a href="/WMS-Web//HomePage">Back</a></button>
        </div>
        <hr/>
    </form>
</div>
</body>
<script>

    init();
    function init(){
        document.getElementById("user_account").value= ${accountName};
        if(${workerName} !== 'null'){
            document.getElementById("user_name").value=${workerName};
        }
        if(${gender} !== 'null'){
            document.getElementById("user_gender").value=${gender};
        }
        if(${tel} !== 'null'){
            document.getElementById("user_tel").value=${tel};
        }
        if(${email} !== 'null'){
            document.getElementById("user_email").value=${email};
        }
        document.getElementById("user_salary").value=${salary};
        document.getElementById("user_wID").value=${workingPlace};
    }
    function dataTest2(){
        if(document.getElementById("user_password").value === null || document.getElementById("user_password").value === ""){
            alert("Please enter your password !")
            return;
        }
        document.getElementById("form").submit();
    }
</script>
</html>
