<%--
  Created by IntelliJ IDEA.
  User: Lenovo
  Date: 2022/7/19
  Time: 11:36
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>Login Page</title>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <script src="js/param.js"></script>
    <script src="js/jquery-3.3.1.js" type="application/javascript"></script>
    <style type="text/css">
        .bordered{
            width:600px;
            height:300px;
        }
        #bg{
            width:600px;
            height:355px;
        }
        input{
            width: 190px;
            height: 29px;
            font-size: 19px;

        }
        p{
            color: yellow;
        }
    </style>
</head>

<body align="center" style="background-color: #6988f9" >
<br/><br/><br/><br/> &nbsp;&nbsp;&nbsp;&nbsp;
<div id="bg" style="margin:0px auto;text-align: center;background:url('./images/pic3.jpg') no-repeat 0px 0px;background-size:cover;">
    <div class="bordered">
        <form action="/WarehouseWebServer/Login" method="post" id="form">
            <legend><h1 align="center" style="color: red">LOGIN</h1></legend>
            <br/><br/>
            <p><strong>Username：</strong>&nbsp;<input style="background: url('./images/logo.png') no-repeat 97% center #fff" type="text" name="name" id="username"/></p>
            <br/>
            <p><strong>Password：</strong>&nbsp;<input style="background: url('./images/key.png') no-repeat 97% center #fff" type="password" name ="password" id="password"/></p>
            <br/>
            <p><input type="button"   onclick="login()" value="Login" style="width:110px;height:30px;background-color: green;"/>&nbsp;&nbsp;
                <input type ="submit" value="Register" style="width:100px;height:30px;background-color: yellow;" onclick="location.href='Register.html'"/>
                <input type ="submit" value="Forget Password" style="width:170px;height:30px;background-color: red;" onclick="location.href='ForgetPassword.html'"/>
            </p>
        </form>
    </div>
</div>
</body>
<script>
    function login(){
        var name= $("input[name='name']").val();
        var password= $("input[name='password']").val();
        if(name === null || name ===""){
            alert("The username or password is empty!");
            return;
        }
        if(password === null || password ==="" ) {
            alert("The username or password is empty!");
            return;
        }
        document.getElementById("form").submit();
    }
</script>
</html>
