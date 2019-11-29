<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String cate = request.getParameter("cate");
%>

<section class="sub cate3">
    <div>
        <img src="/farmstory/img/sub_top_tit3.png" alt="CROP TALK">
    </div>
    <div>
        <aside class="lnb">
            <img src="/farmstory/img/sub_aside_cate3_tit.png" alt="농작물이야기">
            <ul>
                <li class="<%= (cate.equals("story"))?"on":"off" %>"><a href="/farmstory/board/list.jsp?cate=story&group=croptalk">농작물이야기</a></li>
                <li class="<%= (cate.equals("grow"))?"on":"off" %>"><a href="/farmstory/board/list.jsp?cate=grow&group=croptalk">텃밭가꾸기</a></li>
                <li class="<%= (cate.equals("school"))?"on":"off" %>"><a href="/farmstory/board/list.jsp?cate=school&group=croptalk">귀농학교</a></li>
            </ul>
        </aside>
        <article class="content">
            <nav>
                <img src="/farmstory/img/sub_nav_tit_cate3_tit_<%=cate %>.png" alt="농작물이야기">
                <p>
                    HOME > 농작물이야기 >
                    <% if(cate.equals("story")) { %> 
                    	<span>농작물이야기</span>
                    <% }else if(cate.equals("grow")){ %>
                    	<span>텃밭가꾸기</span>
                    <% }else if(cate.equals("school")){ %>
                    	<span>귀농학교</span>
                    <% } %>
                </p>
            </nav>

            <!-- 컨텐츠 내용 시작 -->


