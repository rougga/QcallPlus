$(document).ready(function () {
    $("#err").hide();
    $("#window").val($("#selectWindowSelect").val());
    $("#windowText").val($("#selectWindowSelect option:selected").text());
    $("#errClose").on('click', function () {
        $("#err").hide();
    });


    $("#selectWindowSelect").on("change", function () {
        $("#window").val($(this).val());
        $("#windowText").val($("#selectWindowSelect option:selected").text());
    });



    $("#submit2").on('click', function () {
        if (getPath()) {
            var url = getPath().base + "client/login";
            var par = {};
            par.username = $("#username").val();
            par.password = $("#password").val();
            par.branchId = $("#branchId").val();
            par.windowText = $("#windowText").val();
            par.rand = Math.random();
            par.window = $("#window").val();
            par.host = localStorage.getItem("ipSS");
            par.port = localStorage.getItem("portSS");
            console.log(par);
            $.post(url, par, function (data) {
                if (data.indexOf("login_center") >= 0) {
                    $("#err").show();
                    $("#errText").html("L'identifiant ou le mot de passe est incorrect");
                    console.log("Connection to pdjh BACKEND IS FAILED!!");
                } else {
                    console.log("Connected to pdjh BACKEND, redirecting to home page...");
                    par.status = 1;
                    $.post("./ChangeStatus", par, function (data) {
                        window.location = "./home.jsp";
                    });
                }
            });
        } else {
            $('#settingsModal').modal('toggle');
        }

    });
});