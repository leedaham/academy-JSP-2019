<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
%>
<jsp:useBean id="member" scope="request" class="../Java Resources/src/member.p194" />
<jsp:setProperty name="p194" property="*"/>
<jsp:setProperty name="p194" property="password" value="<%=p194.getId()  %>"/>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>가입</title>
</head>
<body>
<table width="400" border="1" cellpadding="0" cellspacing="0">
<tr>
	<td>아이디</td>
	<td><jsp:getProperty property="id" name="p194"/></td>
	<td>암호</td>
	<td><jsp:getProperty property="pass" name="p194"/></td>
</tr>	
<tr>
	<td>이름</td>
	<td><jsp:getProperty property="name" name="p194"/></td>
	<td>이메일</td>
	<td><jsp:getProperty property="email" name="p194"/></td>
</tr>	
</table>
</body>
</html>