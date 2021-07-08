<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="src/js/member/mypage.js"></script>

<!-- 마이페이지 내용 -->
<div id="mypageView">
	<div class="section primary-section">		
		<h1 class="title">MYPAGE</h1>
	<!-- 예매내역 -->
		<div class="mypageTitle">
			<h3 class="title" style="border: none;">나의 예매내역</h3>
			<h4 class="title" style="border: none;">${rsvList.size() } 건</h4>
		</div>
		<br>
		<div class="mypageBackground">
			<table>
				<thead>
					<tr>
						<th>스케쥴번호</th>				
						<th>예매번호</th>
						<th>좌석번호</th>
						<th>영화명</th>
						<th>상영일자</th>
						<th>상영시간</th>
						<th>예매취소</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${rsvList}" var="rsvList">
						<tr>
							<td>${rsvList.scheduleNum}</td>					
							<td>${rsvList.cfmNum}</td>
							<td>${rsvList.seatNum}</td>
							<td>${rsvList.moviName}</td>
							<td>${rsvList.viewDate}</td>
							<td>${rsvList.viewTime}</td>
							<td><a href="./rc?nextSt=cancel&scheduleNum=${rsvList.scheduleNum}"
							onclick="return confirm('정말 예매를 취소하시겠습니까?')" class="btn btn-inverse">취소하기</a></td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</div>
	<div class="mypageTitle">
			<h3 class="title">나의 문의내역</h3>
			<h4 class="title">${qnaList.size() } 건</h4>
	</div>
	<br>
	<div class="mypageBackground">
		<table>
			<thead>
				<tr>
					<th>문의유형</th>
					<th>제목</th>
					<th>작성자</th>
					<th>작성일</th>
					<th>답변상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${qnaList }" var="qnaList">
					<tr>
						<td>${qnaList.askType }</td>
						<td><c:choose>
								<c:when test="${qnaList.askStatus == 0 }">
									<a href="./qc?nextSt=qDetail&qnaNum=${qnaList.qnaNum }"
										onclick="javascript:alert('아직 답변이 등록되지 않은 문의입니다!');"
										 style="color: #181a1c !important" >
										${qnaList.title }</a>
								</c:when>
								<c:when test="${qnaList.askStatus == 1 }">
									<a href="./qc?nextSt=qDetail&qnaNum=${qnaList.qnaNum }"
										onclick="javascript:alert('답변등록이 완료된 문의입니다. 답변 리스트 보기를 클릭해주세요!');"
										 style="color: #181a1c !important" >
										${qnaList.title }</a>
								</c:when>
							</c:choose></td>
						<td>${Ses_email }</td>
						<td>${qnaList.date }</td>
						<td><c:choose>
								<c:when test="${qnaList.askStatus == 0 }">미답변</c:when>
								<c:when test="${qnaList.askStatus == 1 }">답변완료</c:when>
							</c:choose></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>
	<div class="section secondary-section" style="text-align: center;">
		<button class="btn btn-warning" id="memberQuitBtn" type="submit"
			style="width: 300px; height: 40px; margin: 20px">회원 탈퇴하기</button>
	</div>

