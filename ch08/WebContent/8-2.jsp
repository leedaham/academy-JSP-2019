<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	//전송파라미터 수신
	/*
	request.setCharacterEncoding("UTF-8");

	String name		= request.getParameter("name");
	String gender	= request.getParameter("gender");
	String hobbies[]	= request.getParameterValues("hobby");
	String addr		= request.getParameter("addr");
	*/
%>
<!-- ↓↓↓ UserBean user = new UserBean() 하는 느낌. 실패한 모델. 안 씀. -->
<jsp:useBean id="user" class="sub1.UserBean">
	<jsp:setProperty name="user" property="name"/>
	<jsp:setProperty name="user" property="gender"/>
	<jsp:setProperty name="user" property="hobby"/>
	<jsp:setProperty name="user" property="addr"/>
</jsp:useBean>



<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>8-2</title>
</head>
<body>
	<h3>파라미터 출력</h3>
	<p>
		이름: <%= user.getName() %><br>
		성별: <%= (user.getGender()==1) ? "남자" : "여자"  %><br>
		취미:
		<%
			for(String hobby : user.getHobby()){
				out.print(hobby+", ");
			}
		%><br>
		이름: <%= user.getAddr() %><br>
	</p>
</body>
</html>