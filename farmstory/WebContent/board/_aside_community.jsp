<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cate = request.getParameter("cate");
%>

<section class="sub cate5">
    <div>
        <img src="/farmstory/img/sub_top_tit5.png" alt="COMMUNITY">
    </div>
    <div>
        <aside class="lnb">
            <img src="/farmstory/img/sub_aside_cate5_tit.png" alt="커뮤니티">
            <ul>
                <li class="<%= (cate.equals("notice"))?"on":"off" %>"><a href="/farmstory/board/list.jsp?cate=notice&group=community">공지사항</a></li>
                <li class="<%= (cate.equals("menu"))?"on":"off" %>"><a href="/farmstory/board/list.jsp?cate=menu&group=community">오늘의식단</a></li>
                <li class="<%= (cate.equals("chef"))?"on":"off" %>"><a href="/farmstory/board/list.jsp?cate=chef&group=community">나도요리사</a></li>
                <li class="<%= (cate.equals("qna"))?"on":"off" %>"><a href="/farmstory/board/list.jsp?cate=qna&group=community">1:1고객문의</a></li>
                <li class="<%= (cate.equals("faq"))?"on":"off" %>"><a href="/farmstory/board/list.jsp?cate=faq&group=community">자주묻는질문</a></li>
            </ul>
        </aside>
        <article class="content">
            <nav>
                <img src="/farmstory/img/sub_nav_tit_cate5_tit_<%=cate %>.png" alt="농작물이야기">
                <p>
                    HOME > 농작물이야기 >
                    <% if(cate.equals("notice")) { %> 
                    	<span>공지사항</span>
                    <% }else if(cate.equals("menu")){ %>
                    	<span>오늘의식단</span>
                    <% }else if(cate.equals("chef")){ %>
                    	<span>나도요리사</span>
                    <% }else if(cate.equals("qna")){ %>
                    	<span>1:1고객문의</span>
                    <% }else if(cate.equals("faq")){ %>
                    	<span>자주묻는질문</span>
                    <% } %>
                </p>
            </nav>

            <!-- 컨텐츠 내용 시작 -->


