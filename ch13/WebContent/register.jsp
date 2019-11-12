<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원정보</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
		String name	 = (String) request.getParameter("name");
		String hp	 = (String) request.getParameter("hp");
		String pos	 = (String) request.getParameter("pos");
		String rdate = (String) request.getParameter("rdate");
	%>
	<p>
		이   름 : <%=name %><br>
		휴대폰 : <%=hp %><br>
		직   급 : <%=pos %><br>
		입사일 : <%=rdate %><br>
	</p>
</body>
</html>