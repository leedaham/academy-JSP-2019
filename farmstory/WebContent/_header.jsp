<%@page import="kr.co.farmstory.bean.BoardMemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	BoardMemberBean bmb = (BoardMemberBean)session.getAttribute("member");

	String code = request.getParameter("code");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>farmStory</title> 
    <!-- http://wppremium02.hubweb.net/ -->
    
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link rel="stylesheet" href="/farmstory/css/style.css">
	<link rel="stylesheet" href="/farmstory/css/board.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
    <script src="/farmstory/js/validation.js"></script>
	<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script src="/farmstory/js/zipcode.js"></script>
    <script src="/farmstory/js/termsCheck.js"></script>
    <script src="/farmstory/js/slider.js"></script>
    <script>
		var code = "<%= code%>";
		
		if(code =='101'){
			alert('회원정보가 잘못 되었습니다. \n다시 확인하시기 바랍니다.')
		}
	</script>
</head>
<body>
    <div id="banner">
        <div>
            <a href="/farmstory/event/event.jsp"><img src="/farmstory/img/float_banner_tit.png" alt="팝카드신청시10%적립혜택"></a>
        </div>
        <div>
            <a href="/farmstory/market/market.jsp"><img src="/farmstory/img/float_banner_txt.png" alt="장보기"></a>
        </div>
    </div>
    <div id="wrapper">
        <header>
            <a href="/farmstory" class="logo"><img src="/farmstory/img/logo.png" alt="로고"></a>
            <p>
                <a href="/farmstory">Home</a>|
                <% if(bmb == null) { %>
                <a href="/farmstory/user/login.jsp">Login</a>|
                <a href="/farmstory/user/terms.jsp">Join</a>|
                <% }else{ %>
                <a href="/farmstory/user/logout.jsp">Logout</a>|
                <%} %>
                <a href="#">Contact us</a>|
            </p>
            <img src="/farmstory/img/head_txt_img.png" alt="3만원 이상 무료패송, 팜카드 10% 적립">
            <ul class="gnb">
                <li><a href="/farmstory/introduction/hello.jsp">팜스토리소개</a></li>
                <li><a href="/farmstory/market/market.jsp"><img src="/farmstory/img/head_menu_badge.png" alt="30%"> 장보기</a></li>
                <li><a href="/farmstory/board/list.jsp?cate=story">농작물이야기</a></li>
                <li><a href="/farmstory/event/event.jsp">이벤트</a></li>
                <li><a href="/farmstory/comunity/notice.jsp">커뮤니티</a></li>
            </ul>
        </header>