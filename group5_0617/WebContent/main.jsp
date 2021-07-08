<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:catch>
    <c:choose>
        <c:when test="${param.view==null || param.view=='' }">
            <c:set var="loaded" value="welcome.jsp" />
        </c:when>
        <c:when test="${param.view.equals('rsv') }">
            <c:set var="loaded" value="rsv.jsp" />
        </c:when>
        <c:when test="${param.view.equals('qnaList') }">
            <c:set var="loaded" value="qnaList.jsp" />
        </c:when>
        <c:when test="${param.view.equals('qnaRegist') }">
            <c:set var="loaded" value="qnaRegister.jsp" />
        </c:when>
        <c:when test="${param.view.equals('qnaDetail') }">
            <c:set var="loaded" value="qnaDetail.jsp" />
        </c:when>
        <c:when test="${param.view.equals('mypage') }">
            <c:set var="loaded" value="mypage.jsp" />
        </c:when>
        <c:when test="${param.view.equals('memberList') }">
            <c:set var="loaded" value="member/memberList.jsp" />
        </c:when>
    </c:choose>
</c:catch>

<jsp:include page="header.jsp"></jsp:include>
<jsp:include page="topnav.jsp"></jsp:include>
<jsp:include page="${loaded }"></jsp:include>
<jsp:include page="footer.jsp"></jsp:include>