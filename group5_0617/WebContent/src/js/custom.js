var ajaxOn = false;
$("#join").on("click", function() {
    $("input[name=nextSt]").val("join");
    $("#loginBtn").text("회원가입");
    $("#join").hide();
    $("input[name=pwdCfm]").prop("type", "password");
    $("#loginBtn").attr("id", "joinBtn");
    $("#joinBtn").attr("disabled", true);
    $("#joinBtn").attr("class", "btn btn-inverse");
    $("input[name=email]").val("");
    $("input[name=pwd]").val("");
    ajaxOn = true;
    make_input();

});

function make_input() {
    let last_li = document.getElementById("form").lastElementChild;
    last_li.innerHTML = "<a href='index.jsp' style='color: #fff;'>로그인 화면으로 가기</a>";
  }



$(".chk").on("input", function() {
    let pwd = $("input[name=pwd]").val();
    let pwdCfm = $("input[name=pwdCfm]").val();
    let email = $("input[name=email]").val();

    if (pwd == pwdCfm && email != null && email != "" && pwd != null && pwd != ""
        && pwdCfm != null && pwdCfm != "") {
        $("#joinBtn").attr("disabled", false);
        $("#joinBtn").attr("class", "btn btn-warning");
    }
    if (pwd != pwdCfm || email == null || email == "") {
        $("#joinBtn").attr("disabled", true);
        $("#joinBtn").attr("class", "btn btn-inverse");
    }
});

$(function() {
    $("#email").on("focusout", function() {
        var email = $("#email").val();
        $("#joinBtn").attr("disabled", true);
        $("#joinBtn").attr("class", "btn btn-inverse");

        if (ajaxOn) {
            $.ajax({
                url : './mc',
                type : 'post',
                data : {
                    email : email,
                    nextSt : "dupChk"
                },
                success : function(result) {
                    if (result > 0) {
                        alert('중복 이메일입니다.');
                        $("#email").val("");
                        $("#email").focus();
                    }
                }
            })
        }
    });
});