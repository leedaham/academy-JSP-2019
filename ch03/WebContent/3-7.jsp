<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3-7</title>
</head>
<body>
	<h3>7.포워딩 페이지</h3>
	
	<h1>3-7. JSP 페이지입니다.</h1>
	
	<%
		pageContext.forward("./3-1.jsp");
	%>
</body>
</html>