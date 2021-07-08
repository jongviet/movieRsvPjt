<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.Map"%>
<%@ page import="java.util.HashMap"%>
<%@ page import="java.util.List"%>
<%@ page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script src="src/js/member/memberList.js"></script>

<div class="section primary-section" id="adminPage">
	<h1 class="title">회원 관리</h1>
	<div class="adminBackground">
		<button type="button" id="delBtnMemberListPage" class="btn btn-warning">회원 삭제하기</button>
		<table>
			<thead>
				<tr>
					<th>선택</th>
					<th>회원번호</th>
					<th>Email</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach items="${memberList}" var="mvo">
					<tr>
						<th><input type="checkbox" name="delChecked" /><input type="hidden" value=${mvo.memberNum } /></th>
						<th># ${mvo.memberNum }</th>
						<th># ${mvo.email }</th>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>
</div>