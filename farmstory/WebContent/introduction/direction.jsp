<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String group = request.getParameter("group");
%>
<%@ include file = "../_header.jsp" %>

        <section class="sub cate1">
            <div>
                <img src="/farmstory/img/sub_top_tit1.png" alt="INTRODUCTION">
            </div>
            <div>
                <aside class="lnb">
                    <img src="/farmstory/img/sub_aside_cate1_tit.png" alt="팜스토리소개">
                    <ul>
                        <li><a href="/farmstory/introduction/hello.jsp?group=<%=group%>">인사말</a></li>
                        <li class="on"><a href="/farmstory/introduction/direction.jsp?group=<%=group%>">찾아오시는길</a></li>
                    </ul>
                </aside>
                <article class="content">
                    <nav>
                        <img src="/farmstory/img/sub_nav_tit_cate1_tit2.png" alt="찾아오시는길">
                        <p>
                            HOME > 팜스토리소개 > <span>찾아오시는길</span>
                        </p>
                    </nav>

                    <!-- 컨텐츠 내용 시작 -->
                                        
                    <!-- * 카카오맵 - 지도퍼가기 -->
                    <!-- 1. 지도 노드 -->
                    <div id="daumRoughmapContainer1571897896780" class="root_daum_roughmap root_daum_roughmap_landing"></div>

                    <!--
                        2. 설치 스크립트
                        * 지도 퍼가기 서비스를 2개 이상 넣을 경우, 설치 스크립트는 하나만 삽입합니다.
                    -->
                    <script charset="UTF-8" class="daum_roughmap_loader_script" src="https://ssl.daumcdn.net/dmaps/map_js_init/roughmapLoader.js"></script>

                    <!-- 3. 실행 스크립트 -->
                    <script charset="UTF-8">
                        new daum.roughmap.Lander({
                            "timestamp" : "1571897896780",
                            "key" : "vjru",
                            "mapWidth" : "800",
                            "mapHeight" : "400"
                        }).render();
                    </script>

                    <!-- 컨텐츠 내용 끝 -->
                </article>
            </div>

        </section>
<%@ include file = "../_footer.jsp" %>