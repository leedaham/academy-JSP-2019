<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String result = request.getParameter("result");
%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>login</title>
	<script>
		var result = "<%=result%>";
		
		if(result == "fail"){
			alert("로그인이 실패했습니다. \n다시 확인 하시기 바랍니다.");
		}
	
	</script>
</head>
<body>
	<h3>로그인</h3>
	<form action="./loginProc.jsp" method="post">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid" placeholder="아이디를 입력하세요."/></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass" placeholder="비밀번호를 입력하세요."/></td>
			</tr>
			<tr>
				<td colspan="2" align="right">
				<input type="submit" value="login"/>
				</td>
			</tr>
		</table>
	</form>
</body>
</html>