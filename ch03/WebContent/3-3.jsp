<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3-3</title>
</head>
<body>
	<h3>3.회원가입 파라미터 수신</h3>
	<%
		//POST전송요청을 받을때는 반드시 문자셋 설정
		request.setCharacterEncoding("UTF-8");
	
		String name		= request.getParameter("name");
		String gender	= request.getParameter("gender");
		String[] hobbyies	= request.getParameterValues("hobby");
		String addr		= request.getParameter("addr");
	
	
	
	%>
	
	<p>
		이름 : <%=name %><br>
		성별 : <%=gender %><br>
		취미 :
		<%
			for(String hobby : hobbyies){
				out.println(hobby+", ");
			}
		%><br>
		주소 : <%=addr %><br>
	</p>
	
	<a href="./3-1.jsp">되돌아가기</a>
</body>
</html>