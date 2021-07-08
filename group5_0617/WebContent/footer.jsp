<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<div class="footer">
	<aside class="footer-logo">
		<a href="main.jsp"><img src="src/images/logo.png" alt="" /></a>
	</aside>
	<aside class="footer-tools">
		<a><img src="src/images/logo/eclipse.png" alt="" /></a> <a
			><img src="src/images/logo/MySQL.png" alt="" /></a> <a
			><img src="src/images/logo/dbeaver.png" alt="" /></a> <a
			><img src="src/images/logo/TomCat.png" alt="" /></a> <a
			><img src="src/images/logo/Bootstrap.png" alt="" /></a> <a
			><img src="src/images/logo/VScode.png" alt="" /></a> <a
			><img src="src/images/logo/Ps.png" alt="" /></a>
	</aside>
	<section class="footer-top">
		<ul class="footer-link">
			<li><a>약관 보기</a></li>
			<li>|</li>
			<li><a>개인정보처리방침</a></li>
			<li>|</li>
			<li><a>고객의 소리</a></li>
			<li>|</li>
			<li><a>광고 및 제휴 문의</a></li>
			<li>|</li>
			<li><a data-toggle="modal" data-target="#exampleModal"
				id="teamIntro" href="#">팀원 소개</a></li>
		</ul>
	</section>
	<section class="footer-bottom">
		<ul class="team-info">
			<li>서울특별시 서초구 서초대로77길 54, 서초W타워 1406호</li>
			<li>대표자명 : 김종기 곽단 손관식 이지남</li>
			<li>COPYRIGHT© group5 ALL RIGHTS RESERVED</li>
		</ul>
	</section>
</div>
<!-- 여기에 copyright 넣으면 됨. 모든 내용페이지 div로 묶기 -->
<script>
	$("#teamIntro").on("click", function() {
		$("#exampleModal").css("z-index", "2000");
	});
</script>

<div class="modal fade" id="exampleModal" tabindex="-1"
	aria-labelledby="exampleModalLabel" aria-hidden="true"
	data-backdrop="static" style="z-index: -1;">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">팀원소개</h5>
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<img src="src/images/profile-blue.png"
					style="width: 25px; height: 25px;"> 김종기 / 31 / JSP&Servlet을
				베이스로 작업한 첫 프로젝트!<br> <br> MVC 구조, DB, 네이밍 등을 통일 후 작업했지만,
				병합하는 과정에서 100% 매끄럽지는 못했다. 직면하는 오류들을 다양한 시각으로 함께 풀어가는게 좋았고, Git은 선택이
				아닌 필수라는 걸 깨달았다. JavaScript와의 씨름 끝에 완성한 예매 기능이 가장 기억에 남는다.
			</div>
			<div class="modal-body">
				<img src="src/images/profile-pink.png"
					style="width: 25px; height: 25px;"> 곽단 / 27 / 우리팀 최고^ㅇ^b<br>
				<br> 머리로 구상한걸 코드로 구현이 안되서 별것도 아닌 기능에 한참을 애먹었는데 JSP 팀 프로젝트를 통해
				혼자 공부하면서 벅차다고 느꼈던 부분들을 많이 보충할 수 있었습니다. 팀원분들 덕분에 조금 더 성장한 것 같습니다.
			</div>
			<div class="modal-body">
				<img src="src/images/profile-yellow.png"
					style="width: 25px; height: 25px;"> 이지남 / 22 / 팀원분들과 함께라서 좋았던
				프로젝트!<br> <br> 첫 팀프로젝트를 진행하면서 JSP CRUD에 익숙해질 수 있었고, 기능들을
				구현할 때 다양한 오류가 발생했지만, 팀원분들과 함께 그 오류들을 해결하면서 많은 공부가 되었습니다.
			</div>
			<div class="modal-body">
				<img src="src/images/profile-purple.png"
					style="width: 25px; height: 25px;"> 손관식 / 25 / 괜찮은 결과물을 만들어낸건
				훌륭한 팀웍 덕분!<br> <br> 처음 DB설계부터 시작해서 어려움이 많았지만 같이 상의하고 해결해
				나가는게 좋았다. CRUD부터 따라가기 조금 벅찼지만, 팀원분들의 도움을 받으면서 같이 성장해나갔다. 다음 프로젝트부터는
				더욱 노력해서 많은 도움을 줄 수 있도록 하겠다!
			</div>
			<div class="modal-footer">
				<button type="button" class="btn btn-warning" data-dismiss="modal">Close</button>
			</div>
		</div>
	</div>
</div>
<!-- 세션 만료 -->
<script>
var timeLeft =  <%= session.getMaxInactiveInterval() %>
var interVal;

function decrement() {
     interVal =  setInterval(function() {
         timeLeft--;
          
         if(timeLeft == 0) {
              stopTimer();
         }                          
     }, 1000);
}
function stopTimer() {
     clearInterval(interVal);
     alert("세션이 만료되었습니다. 다시 로그인해주세요");
     window.location.href =  "logoutAction.jsp";
}
decrement();
</script>
<!-- script area -->
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