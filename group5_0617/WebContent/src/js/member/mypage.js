

$(document).ready(function() {
	document.getElementById('memberQuitBtn').addEventListener('click', function() {
		var result = confirm('정말 탈퇴하시겠습니까? 정말 탈퇴하시겠습니까? 정말 탈퇴하시겠습니까? 정말 탈퇴하시겠습니까? 정말 탈퇴하시겠습니까? 정말 탈퇴하시겠습니까? 정말 탈퇴하시겠습니까? 정말 탈퇴하시겠습니까? 정말 탈퇴하시겠습니까? 정말 탈퇴하시겠습니까? 정말 탈퇴하시겠습니까? 정말 탈퇴하시겠습니까? 정말 탈퇴하시겠습니까? ');
		
		if(!result) return; // 취소 버튼 눌렀을 때 ~ 여기서 끝 ~
		
		// 탈퇴 확인시 ~~ 탈퇴 처리 여기서부터 ~~
		
		$.ajax({
			url : './mc',
			type : 'post',
			data : {
				nextSt : "quit"
			}
		}).then(function(){
			window.location.href = "logoutAction.jsp"
		})
	});
});