$("#loginBtn").click(function (){
    var userId = $("#userId").val();
    var password =$("#passWord").val();
    if(!userId){
        $("#valid").html("User ID can't be null!");
        return false;
    }else {
        if (!password) {
            $("#valid").html("Password can't be null!");
            return false;
        } else {
            $("#loginForm").submit();
        }
    }
});