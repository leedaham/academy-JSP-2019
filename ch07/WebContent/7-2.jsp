<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>7-2</title>
</head>
<body>
	<h3>2.include 액션 태그</h3>
	<jsp:include page="./inc/config.jsp"></jsp:include>
	<!-- 
		include 지시자
		 - 공통의 전역파일을 삽입하는 include, 뷰컴포넌트도 삽입가능
		 - 정적타임에 삽입된다.
	 -->
	<%@ include file="./inc/header.jsp" %>
		
	<main>
		<h4>메인 컨텐츠 영역</h4>
	</main>
	
	<%--
		include 태그
		 - 뷰 컴포넌트를 모듈화해서 삽입하는 include (사용자 눈에 보이는 태그)
		 - 런타임(실행)에 삽입된다.
	 --%>
	<jsp:include page="./inc/footer.jsp"></jsp:include>
	
</body>
</html>