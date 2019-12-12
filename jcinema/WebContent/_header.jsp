<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>제이시네마</title>
    <link rel="shortcut icon" href="${path}/img/favicon.ico"/>    
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="${path}/css/style.css"/>
    <link rel="stylesheet" href="${path}/css/style_member.css"/>
    <link rel="stylesheet" href="${path}/css/sub.css"/>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>    
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="${path}/js/topBannerBg.js"></script>
    
</head>
<body>
    <div id="wrapper">
        <div id="top-banner">
            <canvas id="canvas"></canvas>
            <div>
                <a href="#" class="image"><img id="topBannerImg" src="${path}/img/top_banner_poster2.jpg" alt=""></a>
                <a href="#" class="close"><img src="${path}/img/banner-close.png" alt=""></a>
            </div>
        </div>

        <header>
            <div class="service">
                <article>
                    <p>
                        <a href="#">모바일 APP</a>
                        <a href="#">좋아요</a>
                        <a href="#">구독하기</a>
                    </p>
                    <p>
                        <a href="${path}/member/login">로그인</a>
                        <a href="${path}/member/register">회원가입</a>
                        <a href="${path}/member/my-cinema">멤버십</a>
                        <a href="#">고객센터</a>
                    </p>
                </article>
            </div>
            <div class="logo">
                <article>
                    <a href="${path}"><img src="${path}/img/logo.gif" alt=""></a>
                </article>                
            </div>
            <div class="gnb">
                <article>
                    <ul>
                        <li><a href="${path}/ticketing/choice-movie">예매</a></li>
                        <li><a href="#">영화</a></li>
                        <li><a href="#">영화관</a></li>
                        <li><a href="#">이벤트</a></li>
                        <li><a href="#">제이몰</a></li>
                        <li><a href="#">VOD</a></li>
                    </ul>

                </article>
            </div>
        </header>
