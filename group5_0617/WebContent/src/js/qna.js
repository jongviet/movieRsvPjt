// qnaRegister 문의 등록

$("#registFormBtn").on("click", function() {
	var askType = $("#askType").val();
	var title = $("#title").val();
	var content = $("textarea[name=content]").val();

	if (askType == "" || askType == null) {
		alert("문의유형을 선택해주세요.");
		$("#askType").focus();
	} else if (title == "" || title == null) {
		alert("문의제목을 입력해주세요.");
		$("#title").focus();
	} else if (content == "" || content == null) {
		alert("문의내용을 입력해주세요.");
		$("#content").focus();
	} else {
		document.getElementById("registForm").submit();
		alert("문의가 정상적으로 등록되었습니다.");
	}
});

// qnaDetail 댓글 작성 버튼
$("#submitAnsBtn").on("click", function() {
	$.ajax({
		url: "./ac",
		type: "post",
		data: {
			nextSt: "addAns",
			qnaNum: $("input[name=qnaNum]").val(),
			answer: $("input[name=answer]").val()
		}
	}).done(function(result) {
		answer: $("input[name=answer]").val("");
		alert("답변 등록 성공!");
		$("#answerTable").css('visibility', 'normal');
		getAnswer();
	});
}); // submintAnsBtn

function getAnswer() {
	let qnaNum = $("input[name=qnaNum]").val();
	$
		.ajax({
			url: './ac',
			type: 'get',
			data: {
				nextSt: "showAns",
				qnaNum: qnaNum
			}
		})
		.done(
			function(list) {
				let json_obj = JSON.parse(list); // list => json_obj
				let inTbody = ''; // tbody 안쪽에 들어감
				$
					.each(
						json_obj.anslist, // controller에서 anslist라는 이름으로 data_list 넘어옴
						function(idx, avo) {
							inTbody += '<tr>';
							inTbody += '<th>'
								+ avo.ansNum
								+ '</th>';
							inTbody += '<td>'
								+ avo.answer
								+ '</td>';
							inTbody += '<td>'
								+ avo.date
								+ '</td>';
							inTbody += '<td><input type="hidden" name="ansNum" value="' + avo.ansNum + '">';
							inTbody += '<button type="button" onclick="answerRemove(this)">삭제</button></form></td>';
							inTbody += '</tr>';
							$("#answerArea").html(inTbody);
						});
			});
} // getAnswer

// 답변 리스트 버튼
$("#showAnswerBtn").on("click", function() {
	getAnswer(); // 댓글 리스트 호출
}); // showAnswerBtn

// 답변 개별 삭제 버튼
function answerRemove(obj) { // 삭제 버튼 detail 179번째 줄 
	let ansNum = $(obj).closest("tr").find("input[name=ansNum]").val();
	let qnaNum = $("input[name=qnaNum]").val();
	$.ajax({
		url: "./ac",
		type: "post",
		data: {
			ansNum: ansNum,
			nextSt: "deleteAns"
		}
	}).done(function() {
		alert(ansNum + "번 답변이 삭제되었습니다!");
		window.location.href = "./qc?nextSt=qDetail&qnaNum=" + qnaNum;
	});
} // answerRemove

// 답변 상태 업데이트 버튼(답변완료)
$("#ansUpdateBtn").on("click", function() {
	$("#ansUpdateForm").submit();
	alert("답변 상태 답변완료로 업데이트 완료!");
}); // ansUpdateBtn

// 답변 상태 업데이트 버튼(미답변)
$("#unansUpdateBtn").on("click", function() {
	$("#unansUpdateForm").submit();
	alert("답변 상태 미답변으로 업데이트 완료!");
}); // unAnsUpdateBtn

// 답변 전체 삭제 버튼
$("#removeAllBtn").on("click", function() {
	$("#ansRemoveForm").submit();
});

// 문의 삭제 버튼
$("#removeBtn").on("click", function() {
	$("#removeForm").submit();
});
