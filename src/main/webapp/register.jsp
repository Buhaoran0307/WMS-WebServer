<%--
  Created by IntelliJ IDEA.
  User: 86180
  Date: 2021/7/6
  Time: 18:34
  To change this template use File | Settings | File Templates.
--%>
<!DOCTYPE html>
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
    <title>Warehouse Management System</title>
    <!--favicon-->
    <link rel="icon" href="assets/images/favicon-32x32.png" type="image/png" />
    <!-- loader-->
    <link href="assets/css/pace.min.css" rel="stylesheet" />
    <script src="assets/js/pace.min.js"></script>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="assets/css/bootstrap.min.css" />
    <!-- Icons CSS -->
    <link rel="stylesheet" href="assets/css/icons.css" />
    <!-- App CSS -->
    <link rel="stylesheet" href="assets/css/app.css" />
</head>

<body class="bg-theme bg-theme1">
<!-- wrapper -->
<div class="wrapper">
    <div class="section-authentication-register d-flex align-items-center justify-content-center">
        <div class="row">
            <div class="col-12 col-lg-10 mx-auto">
                <div class="card radius-15">
                    <div class="row no-gutters">
                        <div class="col-lg-6">
                            <div class="card-body p-md-5">
                                <form action="/WMS-Web/Register?type=INF" method="POST" id="form" >
                                    <div class="text-center">
                                        <img src="assets/images/logo-icon.png" width="80" alt="">
                                        <h3 class="mt-4 font-weight-bold">Create an Account</h3>
                                    </div>
                                    <div class="form-group mt-4">
                                        <label>Account Name</label>
                                        <label style="white-space:pre; font-size: 16px;color: orangered">   ${register_msg}</label>
                                        <input type="text" name="user_account" id="user_account" class="form-control" placeholder="Must enter !" />
                                    </div>
                                    <div class="form-row">
                                        <div class="form-group col-md-6 col-xl-12">
                                            <label>User Name</label>
                                            <input type="text" name="user_name" class="form-control"/>
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Password</label>
                                        <div class="input-group" id="show_hide_password">
                                            <input class="form-control border-right-0" type="password" name="user_password" id="user_password" placeholder="Must enter !" value="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>Confirm Password</label>
                                        <div class="input-group" id="show_hide_password_1">
                                            <input class="form-control border-right-0" type="password" name="user_password_1" id="user_password_1" placeholder="Must enter !" value="">
                                        </div>
                                    </div>
                                    <div class="form-group">
                                        <label>E-mail</label>
                                        <input type="email" class="form-control" name="user_email" id="user_email" placeholder="Must enter !"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Gender</label>
                                        <input type="text" name="user_gender" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <label>TEL</label>
                                        <input type="text" name="user_tel" class="form-control"/>
                                    </div>
                                    <div class="form-group">
                                        <label>Working Place (ID)</label>
                                        <input type="text" name="user_wID" id="user_wID" class="form-control" placeholder="Must enter !"/>
                                    </div>

                                    <!--check in db-->
                                    <div class="btn-group mt-3 w-100">
                                        <button type="button" class="btn btn-light btn-block" onclick="checkData()">Register</button>
                                    </div>
                                    <hr/>
                                    <div class="text-center mt-4">
                                        <p class="mb-0">Already have an account? <a href="index.jsp">Login</a>
                                        </p>
                                    </div>
                                </form>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <img src="assets/images/login-images/register-frent-img.jpg" class="card-img login-img h-100" alt="...">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- end wrapper -->
<!-- JavaScript -->
<script src="assets/js/jquery.min.js"></script>
<script>
    var wIDs = ${wIDs}
    $(document).ready(function () {
        $("#show_hide_password a").on('click', function (event) {
            event.preventDefault();
            if ($('#show_hide_password input').attr("type") == "text") {
                $('#show_hide_password input').attr('type', 'password');
                $('#show_hide_password i').addClass("bx-hide");
                $('#show_hide_password i').removeClass("bx-show");
            } else if ($('#show_hide_password input').attr("type") == "password") {
                $('#show_hide_password input').attr('type', 'text');
                $('#show_hide_password i').removeClass("bx-hide");
                $('#show_hide_password i').addClass("bx-show");
            }
        });
    });
    function checkData() {
        if (document.getElementById("user_account") === null || document.getElementById("user_account").value === "") {
            alert("Please enter your account name !");
            return;
        }

        if (document.getElementById("user_password") === null || document.getElementById("user_password").value === "") {
            alert("Please enter your password !");
            return;
        }
        if (document.getElementById("user_password_1") === null || document.getElementById("user_password_1").value === "") {
            alert("Please confirm your password !");
            return;
        }
        if (document.getElementById("user_password").value !== document.getElementById("user_password_1").value) {
            alert("Two password are not the same!");
            return;
        }
        if (document.getElementById("user_email") === null || document.getElementById("user_email").value === "") {
            alert("Please enter your Email !");
            return;
        }else {
            var res = /^\w+([-+.]\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*$/
            if(!res.test(document.getElementById("user_email").value)){
                alert("Please check your Email format !");
                return;
            }
        }
        if (document.getElementById("user_wID") === null || document.getElementById("user_wID").value === "") {
            alert("Please enter your working place !");
            return;
        }else {
            if(wIDs.indexOf(document.getElementById("user_wID").value) === -1){
                alert("Please check your working place(ID) !");
                return;
            }
        }
        document.getElementById("form").submit();
    }
</script>
</body>
</html>