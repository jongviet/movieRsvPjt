<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

	<div class="section primary-section" id="qnaRegisterPage">
		<c:set var="img_url" value="http://ljinam.dothome.co.kr/qnaimg/" />
		<h3 class="title">1:1 문의</h3>
		<div class="qnaBackground">
		<div class="col-md-12">
			<div class="row">
					<div class="col-sm-6">
						<div class="form-group">
							<label for="qnaNum">번호</label> <input name="qnaNum" id="qnaNum"
								value="${qvo.qnaNum }" readonly>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="askType">문의유형</label> <input name="askType" id="askType"
							value="${qvo.askType }" readonly>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="email">작성자</label> <input name="email" id="email"
								value="${qvo.email }" readonly>
						</div>
					</div>
					<div class="col-sm-6">
						<div class="form-group">
							<label for="askStatus">문의상태</label>
							<c:choose>
								<c:when test="${qvo.askStatus == 0 }">
									<input name="askStatus" id="askStatus" value="미답변" readonly>
								</c:when>
								<c:when test="${qvo.askStatus == 1 }">
									<input name="askStatus" id="askStatus" value="답변완료" readonly>
								</c:when>
							</c:choose>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="form-group">
							<label for="title">제목</label> <input name="title" id="title"
								value="${qvo.title }" readonly>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="form-group">
							<label for="content">내용</label>
							<br>
							<textarea id="content" name="content" readonly>${qvo.content }</textarea>
						</div>
					</div>
					<div class="col-sm-12">
						<div class="form-group">
							<label for="file">첨부파일</label>
							<c:choose>
								<c:when test="${qvo.imgfile ne '' }">
									<a href="http://ljinam.dothome.co.kr/qnaimg/${qvo.imgfile }"
									style="color: #181a1c !important">${qvo.imgfile }</a>
								</c:when>
								<c:when test="${qvo.imgfile eq '' }">
									없음
								</c:when>
							</c:choose>
						</div>
					</div>
					<br>
					<div style="margin-bottom:20px;">
						<button type="button" id="removeBtn" class="btn btn-warning"
							onclick="javascript:alert('문의가 삭제되었습니다.');">삭제</button>
					</div>
				</div>
				<div>
					<a href="./qc?nextSt=qList">
						<button type="button" class="btn btn-warning">Q&A 목록으로</button>
					</a> <a href="./rc?nextSt=mypage">
						<button type="button" class="btn btn-warning">MYPAGE로</button>
					</a>
				</div>
				<!-- qna remove form -->
				<form action="./qc" method="post" id="removeForm">
					<input type="hidden" name="nextSt" value="qDelete"> <input
						type="hidden" name="qnaNum" value="${qvo.qnaNum }">
				</form>
				</div>
			</div>		
		</div>
		


	<!-- 답변 등록 -->
	<!-- admin@admin.com => 임시 관리자 => 답변 작성은 관리자만 가능!! -->
	<div class="section secondary-section" id="aRegisterPage">
	<div class="qnaBackground">
	<c:choose>
		<c:when test="${Ses_email eq 'admin@admin.com' }">
			<h3 class="title" style="color:#181a1c; border-color: rgba(0, 0, 0, 0.1)">답변 등록</h3>
			<input type="hidden" name="qnaNum" value="${qvo.qnaNum }">
			<div>
				<input type="text" name="answer" style="width: 800px; height: 200px; padding: 20px;">
				<br>
				<button id="submitAnsBtn" type="button" class="btn btn-inverse">작성</button>
			</div>
		</c:when>
	</c:choose>
	<br>
			<!-- 답변 리스트 -->
		<button type="button" id="showAnswerBtn" class="btn btn-inverse">답변 리스트 보기</button>
		<!-- askStatus가 0이면 미답변 상태 1이면 답변 상태 -->
		<c:choose>
			<c:when
				test="${Ses_email eq 'admin@admin.com' && qvo.askStatus == 0}">
				<button type="button" id="ansUpdateBtn" class="btn btn-inverse">답변 상태 답변완료로 업데이트</button>
			</c:when>
			<c:when
				test="${Ses_email eq 'admin@admin.com' && qvo.askStatus == 1}">
				<button type="button" id="unansUpdateBtn" class="btn btn-inverse">답변 상태 미답변으로 업데이트
				</button>
				<button type="button" id="removeAllBtn" class="btn btn-inverse">답변 전체 삭제</button>
			</c:when>
		</c:choose>

		<!-- ansUpdateForm => 답변완료 , unansUpdateForm => 미답변 -->
		<form action="./qc" method="post" id="ansUpdateForm">
			<input type="hidden" name="nextSt" value="qAnsUpdate"> <input
				type="hidden" name="qnaNum" value="${qvo.qnaNum }">
		</form>
		<form action="./qc" method="post" id="unansUpdateForm">
			<input type="hidden" name="nextSt" value="qUnansUpdate"> <input
				type="hidden" name="qnaNum" value="${qvo.qnaNum }">
		</form>

		<!-- 답변 전체 삭제 -->
		<form action="./ac" method="post" id="ansRemoveForm">
			<input type="hidden" name="nextSt" value="deleteAnsAll"> <input
				type="hidden" name="qnaNum" value="${qvo.qnaNum }">
		</form>

		<!-- 답변 리스트 출력 -->

		<table id="answerTable" style="visibility: normal;">
			<thead>
				<tr>
					<th>답변 번호</th>
					<th>답변 내용</th>
					<th>등록일</th>
					<th>답변 삭제</th>
				</tr>
			</thead>
			<tbody id="answerArea">

			</tbody>
		</table>
	</div>	
	</div>
	<script src="src/js/qna.js"></script>
