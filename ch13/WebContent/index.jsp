<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>시작페이지</title>
</head>
<body>
	<form action="./register.jsp" method="post">
		이   름 : <input type="text" name="name"/><br>
		휴대폰 : <input type="text" name="hp"/><br>
		직   급 : <input type="text" name="pos"/><br>
		입사일 : <input type="date" name="rdate"/><br>
		<input type="submit" value="등록"/>
	</form>
	
</body>
</html>