<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.3/dist/js/bootstrap.bundle.min.js"></script>

	<div class="section primary-section" id="qnaListPage">
		<h1 class="title">Q&A</h1>
		<div class="qnaBackground">
			<table>
				<thead>
					<tr>
						<th>번호</th>
						<th>문의유형</th>
						<th>제목</th>
						<th>등록일</th>
						<th>상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${qList }" var="qvo">
						<tr>
							<th>${qvo.qnaNum }</th>
							<td>${qvo.askType }</td>
							<td><c:choose>
									<c:when test="${qvo.askStatus == 0 }">
										<a href="./qc?nextSt=qDetail&qnaNum=${qvo.qnaNum }"
											onclick="javascript:alert('아직 답변이 등록되지 않은 문의입니다!');"
											style="color: #181a1c !important">${qvo.title }</a>
									</c:when>
									<c:when test="${qvo.askStatus == 1 }">
										<a href="./qc?nextSt=qDetail&qnaNum=${qvo.qnaNum }"
											onclick="javascript:alert('답변등록이 완료된 문의입니다. 답변 리스트 보기를 클릭해주세요!');"
											style="color: #181a1c !important">${qvo.title }</a>
									</c:when>
								</c:choose></td>
							<td>${qvo.date }</td>
							<td><c:choose>
									<c:when test="${qvo.askStatus == 0 }">미답변</c:when>
									<c:when test="${qvo.askStatus == 1 }">답변완료</c:when>
								</c:choose></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		<a href="main.jsp?view=qnaRegist">
			<button type="button" class="btn btn-inverse pull-right">글쓰기</button>
		</a>
		</div>
	</div>
