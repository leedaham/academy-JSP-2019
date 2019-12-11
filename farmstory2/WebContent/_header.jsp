<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html lang="en">
	<head>
		<meta charset="utf-8">
		<title>::팜스토리</title>
		<link rel="stylesheet" href="${path}/css/style.css" />
		<link rel="stylesheet" href="${path}/css/board.css" />
	</head>

	<body>
		<div id="wrapper">

			<!-- 오른쪽 고정배너 -->	
			<div id="banner">
				<img src="${path}/img/float_banner_tit.png" alt="10% 적립혜택" />
				<a href="${path}/board/list.do?group=market&cate=market"><img src="${path}/img/float_banner_txt.png" alt="장보기" /></a>
			</div>

			<header>
				<!-- logo -->
				<a href="${path}/index.do" class="logo"><img src="${path}/img/logo.png" alt="팜스토리 로고" /></a>
				<img src="${path}/img/head_txt_img.png" class="txt" alt="3만원 이상 무료배송" />
				<!-- badge -->
				<img src="${path}/img/head_menu_badge.png" class="badge" alt="30%" />

				<nav>
					<a href="${path}/index.do">HOME |</a>
					<c:choose>
						<c:when test="${sessionScope.user eq null}">
					<a href="${path}/user/terms.do">회원가입 |</a>
					<a href="${path}/user/login.do">로그인 |</a>
						</c:when>
						<c:otherwise>
					<a href="${path}/user/logout.do">로그아웃 |</a>
						</c:otherwise>
					</c:choose>
					<a href="${path}/board/list.do?group=community&cate=qna">고객센터</a>
				</nav>

				<!-- GNB(Global Navigation Bar) -->
				<ul class="gnb">
					<li><a href="${path}/introduction/hello.do?group=introduction&cate=hello"><strong>팜스토리소개</strong></a></li>
					<li><a href="${path}/board/list.do?group=market&cate=market"><strong>장보기</strong></a></li>
					<li><a href="${path}/board/list.do?group=croptalk&cate=story"><strong>농작물이야기</strong></a></li>
					<li><a href="${path}/board/list.do?group=event&cate=event"><strong>이벤트</strong></a></li>
					<li><a href="${path}/board/list.do?group=community&cate=notice"><strong>커뮤니티</strong></a></li>
				</ul>
			</header>