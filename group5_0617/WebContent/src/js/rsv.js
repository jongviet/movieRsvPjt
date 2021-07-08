/* 최초 세팅 예약번호 생성 + 좌석테이블 hide */
$(function() {
	$("#seatTable").hide();
	$.ajax({
		url : './rc',
		type : 'post',
		data : {
			nextSt : "cfmNumCre"
		},
	}).done(function(result) {
		$("#cfmNum").text(result);
	});
	/* 다시조회 : 페이지 리로드 */
	$("#reloadBtn").on("click", function() {
/*		sessionStorage.clear(); */
		window.location.reload();
	});

	/* 날짜설정 */
	var result_a = new Date().toISOString().split("T");
	var today = result_a[0];
	document.getElementById("viewDate").value = today;
	document.getElementById("viewDate").setAttribute("min", today);
	document.getElementById("viewDate").setAttribute("max", "2021-07-06");
	
/*	function load() {
		if(sessionStorage.getItem('viewDate') != null) {
			
			var viewD = sessionStorage.getItem('viewDate');
			var viewT = sessionStorage.getItem('viewTime');
			
			$("#viewDate").val(viewD);
			$("#viewTime").val(viewT);
			
			sessionStorage.clear();
		};
	};
	load();*/
	
	
});

/* 좌석정보 조회 ajax */
$("#seatBtn").on("click", function(e) {
	e.preventDefault();
	$("#seatBtn").attr("disabled", true);
	$("#seatTable").show();
	var moviNum = $("input[name=moviNum]").val();
	var viewDate = $("input[name=viewDate]").val();
	var viewTime = $("select[name=viewTime]").val();

	$.ajax({
		url : './rc',
		type : 'post',
		data : {
			nextSt : "seatStatus",
			viewDate : viewDate,
			viewTime : viewTime,
			moviNum : moviNum
		},
	}).done(function(result) {
		/* result는 String 형태로 값이 가져와짐.... 1,3,22,23 */
		var a = result.split(',');

		var numbers = "";
		for (let i = 0; i < a.length; i++) {
			if (i == (a.length - 1)) {
				numbers += a[i].replace(/[^0-9]/g, '');
			} else {
				numbers += a[i].replace(/[^0-9]/g, '') + ",";
			}
			;
		}
		;
		/* b 배열에 넘버로만 구분된 숫자값을 담아보자 */
		var b = numbers.split(',');
		/* 점유된 좌석에 대해 음영처리 */
		takenSeat(b);
	});
});
/* 추출된 seatNum 점유 표시용 + 좌석 선택 링크 비활성화 로직 */
function takenSeat(b) {
	for (let i = 0; i < b.length; i++) {
		$("#t" + b[i]).css("background-color", "rgba(255,255,255,0.3)");
		$("#a" + b[i]).css('pointer-events', 'none');
	}
	;
};

/* 6월 16일 다중 예약 구현 */
//선택한 자리 시각 효과
function bgcolor(param) {
   if ($("#t" + param).css("background-color") ==  "rgb(255, 153, 0)") {
       $("#t" + param).css("background-color",  "rgba(0,0,0,0)");
   } else {
       $("#t" + param).css("background-color",  "rgb(255, 153, 0)");
   }
}
//배경색 선택된 자리만 seats에 추가
$("#cfmBtn").on("click", function() {
   var cfmSeats = "";
   for (let i = 1; i < 51; i++) {
       if($("#t" + i).css("background-color") ==  "rgb(255, 153, 0)") {
            cfmSeats += i + ",";
       };
   };
   
   //선택 좌석 배열화
   var cfmNumbers =cfmSeats.split(",");
   
   //공백 필터링
   cfmNumbers = cfmNumbers.filter(function (el) {
       return el != "";
   });
   
   //done 이벤트 param 전달용
   var length = cfmNumbers.length;
   
   //예약 작업
   for (let i = 0; i < cfmNumbers.length; i++) {
       tkCfm(cfmNumbers[i], length);
       // 스케쥴번호(동일 6자리 + 식별용 끝자리) + 예약번호 조정
       $("#scheduleNum").text(Number($("#scheduleNum").text())  + 1);
       $("#cfmNum").text(Number($("#cfmNum").text())  + 1);
       length = length - 1;
   }
});



function tkCfm(param1, param2) {

	var seatNum = param1;
	var toMypage = param2;
	var moviNum = $("input[name=moviNum]").val();
	var moviName = $("input[name=moviName]").val();
	var cfmNum = $("#cfmNum").text();
	var scheduleNum = $("#scheduleNum").text();
	var viewDate = $("input[name=viewDate]").val();
	var viewTime = $("select[name=viewTime]").val();
	var email = $("input[name=email]").val();

	var answer = confirm("[예약 정보 확인]\n1)영화명 : " + moviName + " \n2)상영날짜 : " + viewDate
			+ " \n3)상영시간 : " + viewTime + " \n4)좌석번호 : " + seatNum);
	if (answer) {

		$
				.ajax({
					url : './rc',
					type : 'post',
					data : {
						nextSt : "tkCfm",
						moviNum : moviNum,
						moviName : moviName,
						cfmNum : cfmNum,
						scheduleNum : scheduleNum,
						seatNum : seatNum,
						viewDate : viewDate,
						viewTime : viewTime,
						email : email
					},
				})
				.done(function() {
							
							if(toMypage == 1) {
								window.location.href = "./rc?nextSt=mypage";
							}
						});
	}
};

