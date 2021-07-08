<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>
<title>QnA</title>
</head>
<body>
	<div class="section primary-section" id="qnaRegisterPage">
		<h3 class="title">1:1 문의</h3>
			<div class="qnaBackground">
				<div class="col-md-12">
					<div class="row">
			<!-- form -->
						<form id="registForm" action="./qc?nextSt=qregist" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="memberNum" value="${Ses_memberNum }">
				
							<!-- askType -->
								<div class="col-sm-4">
									<div class="form-group" style="text-align: left;">
										<label for="askType">문의유형</label>
										<select id="askType"
											name="askType">
											<option value="">--문의유형선택--</option>
											<option value="문의">문의</option>
											<option value="불만">불만</option>
											<option value="칭찬">칭찬</option>
											<option value="제안">제안</option>
											<option value="기타">기타</option>
										</select>
									</div>
								</div>
				
							<!-- email -->
								<div class="col-sm-8">
									<div class="form-group">
										<label for="email">작성자</label> <input type="text" name="email"
											id="email" readonly value="${Ses_email }">
									</div>
								</div>
				
							<!-- title -->
								<div class="col-sm-12">
									<div class="form-group">
											<label for="title">제목</label> <input type="text" id="title"
												name="title">
									</div>
								</div>
				
							<!-- content -->
								<div class="col-sm-12">
									<div class="form-group">
											<label for="content" style="margin-left: 8px;">내용</label>
											<br>
											<textarea name="content" id="content"></textarea>
									</div>
								</div>
				
							<!-- file -->
								<div class="col-sm-12">
									<div class="form-group">
											<label for="file">첨부파일</label> <input type="file" id="file"
												name="imgfile"
												onclick="javascript:alert('주민번호 등 개인정보가 포함된 파일이 첨부되지 않도록 유의하시기 바랍니다.');">
									</div>
								</div>
						</form>
						<!-- /form -->
								<div class="col-sm-12">
									<div class="form-group">
										<button type="button" id="registFormBtn" class="btn btn-inverse">등록하기</button>
									</div>
								</div>
								<div class="col-sm-12">
									<div class="form-group">
										<a href="./qc?nextSt=qList">
											<button type="button" class="btn btn-inverse">Q&A 목록으로</button>
										</a>
										<a href="./rc?nextSt=mypage">
											<button type="button" class="btn btn-inverse">MYPAGE로</button>
										</a>
									</div>
								</div>
				</div>
			</div>
		</div>
	</div>
	<script src="src/js/qna.js"></script>
</body>
</html>