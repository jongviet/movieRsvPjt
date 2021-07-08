<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!-- 공통 상단바 영역 -->
<div class="navbar">
            <div class="navbar-inner">
                <div class="container">
                    <a href="./rc?nextSt=moviResRate" class="brand">
                        <img src="src/images/logo.png" width="240" height="80" alt="" />
                        <!-- This is website logo -->
                    </a>
                    <!-- Navigation button, visible on small resolution -->
                    <button type="button" class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
                        <i class="icon-menu"></i>
                    </button>
                    <!-- Main navigation -->
                    <c:if test="${Ses_email ne null }">
					<form method="post" action="./mc">
	                    <div class="nav-collapse collapse pull-right">
	                        <ul class="nav" id="top-navigation">
								<li><a href="./rc?nextSt=moviResRate">영화 / 예매하기</a></li>
								<li><a href="./qc?nextSt=qList">문의하기</a></li>
								<li><a href="./rc?nextSt=mypage">MyPage</a></li>
								<!-- 관리자 권한 부여 -->
								<c:if test="${Ses_memberNum eq 1 }">
									<li><a href="./mc?nextSt=list">회원관리</a></li>		
								</c:if>						
								<li><a href="logoutAction.jsp">로그아웃</a></li>
	                        </ul>
	                    </div>
                    </form>
                    ${Ses_email } 님 환영합니다.
                    </c:if>
                    <!-- End main navigation -->                
                </div>
            </div>
        </div>
	<!-- 여기까지 상단바 -->