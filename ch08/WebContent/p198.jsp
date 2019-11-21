<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="member" scope="request" class="../Java Resources/src/member.p194" />
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>인사말</title>
</head>
<body>

<%=member.getName() %> (<%=member.fetID() %>)회원님
안녕하세요.
	
</body>
</html>