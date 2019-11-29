<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cate = request.getParameter("cate");
%>

<section class="sub cate4">
    <div>
        <img src="/farmstory/img/sub_top_tit4.png" alt="EVENT">
    </div>
    <div>
        <aside class="lnb">
            <img src="/farmstory/img/sub_aside_cate4_tit.png" alt="이벤트">
            <ul>
                <li class="on""><a href="/farmstory/board/list.jsp?cate=event&group=event">이벤트</a></li>
            </ul>
        </aside>
        <article class="content">
            <nav>
                <img src="/farmstory/img/sub_nav_tit_cate4_tit_<%=cate %>.png" alt="이벤트">
                <p>
                    HOME > 농작물이야기 >
                    <% if(cate.equals("event")) { %> 
                    	<span>이벤트</span>
                    <% } %>
                </p>
            </nav>

            <!-- 컨텐츠 내용 시작 -->


