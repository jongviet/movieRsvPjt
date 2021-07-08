<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<!-- bootstrap 4.5 JS & CSS -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
	<link rel="stylesheet" type="text/css" href="src/css/bootstrap.css" />
	<link rel="stylesheet" type="text/css" href="src/css/bootstrap-responsive.css" />
	<link rel="stylesheet" type="text/css" href="src/css/style.css" />
	<link rel="stylesheet" type="text/css" href="src/css/pluton.css" />
	<link rel="stylesheet" type="text/css" href="src/css/jquery.cslider.css" />
	<link rel="stylesheet" type="text/css" href="src/css/jquery.bxslider.css" />
	<link rel="stylesheet" type="text/css" href="src/css/animate.css" />
	<link rel="apple-touch-icon-precomposed" sizes="144x144" href="src/images/ico/apple-touch-icon-144.png">
	<link rel="apple-touch-icon-precomposed" sizes="114x114" href="src/images/ico/apple-touch-icon-114.png">
	<link rel="apple-touch-icon-precomposed" sizes="72x72" href="src/images/apple-touch-icon-72.png">
	<link rel="apple-touch-icon-precomposed" href="src/images/ico/apple-touch-icon-57.png">
	<link rel="shortcut icon" href="src/images/ico/favicon.ico">
<title>group5</title>
<style>
body{
    background: url("src/images/bg.jpg");
    background-size: cover;
    background-repeat: no-repeat;
    height: 100vh;
}
div.container {
	background-color: rgba(0,0,0,0.8);
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 330px;
	text-align: center;
	padding: 10px;
	border-radius: 10px;
}
</style>
</head>
<body>
	<c:if test="${Ses_email ne null }">
		<script>
			location.href = "./rc?nextSt=moviResRate";
		</script>
	</c:if>
	<div class="container">
		<form method="post" action="./mc" id="form">
			<input type="hidden" name="nextSt" value="login">
			<img src="src/images/logo.png" alt="" style="margin: 10px"/>
			<div class="form-group">
				<input class="form-control chk" type="email" name="email" id="email"
					placeholder="이메일">
			</div>
			<div class="form-group">
				<input class="form-control chk" type="password" name="pwd"
					placeholder="비밀번호">
			</div>
			<div class="form-group">
				<input class="form-control chk" type="hidden" name="pwdCfm"
					placeholder="비밀번호확인">
			</div>
			<button class="btn btn-warning" id="loginBtn" type="submit"
				style="width: 300px; height: 40px; margin: 14px; font-weight: bolder;">로그인</button>
			<div class="form-group">
				<a href="#" id="join" style="color: #fff;">아직 회원이 아니신가요?</a>
			</div>
		</form>
	</div>
<script src="src/js/custom.js"></script>
<script src="src/js/jquery.js"></script>
<script type="text/javascript" src="src/js/jquery.mixitup.js"></script>
<script type="text/javascript" src="src/js/bootstrap.js"></script>
<script type="text/javascript" src="src/js/modernizr.custom.js"></script>
<script type="text/javascript" src="src/js/jquery.bxslider.js"></script>
<script type="text/javascript" src="src/js/jquery.cslider.js"></script>
<script type="text/javascript" src="src/js/jquery.placeholder.js"></script>
<script type="text/javascript" src="src/js/jquery.inview.js"></script>
<script src="src/js/respond.min.js"></script>
<script type="text/javascript" src="src/js/app.js"></script>
</body>
</html>