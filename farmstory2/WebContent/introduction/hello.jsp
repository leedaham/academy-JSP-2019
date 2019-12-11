<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<%@ include file = "../_header.jsp" %>
		<section class="sub">
			<div class="bg">
				<img src="${path}/img/sub_top_tit1.png" alt="INTRODUCTION" />
			</div>
			<div>
				<aside>
					<img src="${path}/img/sub_aside_cate1_tit.png" alt="팜스토리소개" />

					<ul class="pg1">
						<li class="on">
							<a href="${path}/introduction/hello.do?group=introduction&cate=hello"><strong>인사말</strong></a>
						</li>
						<li>
							<a href="${path}/introduction/direction.do?group=introduction&cate=direction"><strong>찾아오시는길</strong></a>
						</li>
					</ul>

				</aside>

				<article>
					<nav>
						<img src="${path}/img/sub_nav_tit_cate1_hello.png" alt="인사말" />
						<span>HOME > 팜스토리소개 > <strong>인사말</strong></span>
					</nav>

					<!-- 컨텐츠 영역 -->
					<div class="content content1">
						<p>
							안녕하세요. 팜스토리입니다...
						</p>
					</div>

				</article>
			</div>
		</section>
		<!-- 푸터영역 -->
<%@ include file = "../_footer.jsp" %>
