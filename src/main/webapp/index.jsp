<!DOCTYPE html>
<head>
    <head>
        <%
            String path = request.getContextPath();
            String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
        %>
        <base href="<%=basePath%>">
        <!-- Required meta tags -->
        <meta charset="utf-8" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <title>Warehouse Management System</title>
        <!--favicon-->
        <link rel="icon" href="${pageContext.request.contextPath}/assets/images/favicon-32x32.png" type="image/png" />
        <!-- loader-->
        <link href="${pageContext.request.contextPath}/assets/css/pace.min.css" rel="stylesheet" />
        <script src="${pageContext.request.contextPath}/assets/js/pace.min.js"></script>
        <!-- Bootstrap CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
        <!-- Icons CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/icons.css" />
        <!-- App CSS -->
        <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/app.css" />
        <script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/jquery-3.6.0.js"></script>
    </head>

<body class="bg-theme bg-theme1">
<!-- wrapper -->
<div class="wrapper">
    <div class="section-authentication-login d-flex align-items-center justify-content-center">
        <div class="row">
            <div class="col-12 col-lg-10 mx-auto">
                <div class="card radius-15">
                    <div class="row no-gutters">
                        <div class="col-lg-6">
                            <div class="card-body p-md-5">
                                <div class="text-center">
                                    <img src="${pageContext.request.contextPath}/assets/images/logo-icon.png" width="80" alt="">
                                    <h3 class="mt-4 font-weight-bold">Welcome To Login</h3>
                                </div>

                                <form  action="/WMS-Web/login"  method="post" >
                                    <div style="text-align: center;"><span style="font-size: 15px;color: red">${requestScope.errorMsg}</span></div>
                                    <div class="form-group mt-4">
                                        <label>Account Name</label>
                                        <label style="white-space:pre; font-size: 16px;color: orangered" >   ${login_msg}</label>
                                        <label style="white-space:pre; font-size: 16px;color: greenyellow">${register_msg}${changeINF_msg}</label>
                                        <input type="text" name="username" id="userId" class="form-control" placeholder="Enter your User ID" />
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <input type="password" name="password" id="passWord" class="form-control" placeholder="Enter your password" />
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col">
                                            <div class="custom-control custom-switch">
                                                <input type="checkbox" class="custom-control-input" id="customSwitch1" checked>
                                                <label class="custom-control-label" for="customSwitch1">Remember Me</label>
                                            </div>
                                        </div>
                                        <div class="form-group col text-right"> <a href="forgot-password.jsp"><i class='bx bxs-key mr-2'></i>Forget Password?</a>
                                        </div>
                                    </div>
                                    <span id="valid" style=" font-size: 15px;color: #f55959" class="text-center mt-4 font-weight-bold "></span>
                                    <div class="btn-group mt-3 w-100">
                                        <button type="submit" class="btn btn-light btn-block" id="loginBtn">Log In</button>
                                    </div>
                                    <hr>
                                    <div class="text-center">
                                        <p class="mb-0">Don't have an account? <a href="/WMS-Web/Register?type=init">Sign up</a>
                                        </p>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <img src="assets/images/login-images/login-frent-img.jpg" class="card-img login-img h-100" alt="...">
                        </div>
                    </div>
                    <!--end row-->
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end wrapper -->
</body>

<script type="text/javascript" src="assets/js/jquery-3.6.0.js"></script>
<script type="text/javascript" src="assets/js/loginvalid.js"></script>
