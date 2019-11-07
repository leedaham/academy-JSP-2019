<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3-1</title>
</head>
<body>
	<h3>1.request 내장객체</h3>
	
	<h4>로그인</h4>
	<!-- HTML 주석 -->
	<%--
		JSP 주석 
		전송방식 GET과 POST 교재 p.80
		GET
		- 서버로 페이지나 데이터를 요청하는 방식(OOO 주세요~)(일반우편:데이터 넘기고 끝)
		- 파라미터 데이터가 주소창에 노출
		
		POST
		- 서버로 데이터를 전달하면서 처리를 요청하는 방식(OOO 해주세요~)(등기우편:받았는지 안받았는지 확인해야함) 	
		- 파라미터 데이터가 주소창에 노출되지 않음, Request header에 삽입되어 전송
	--%>
	
	<form action="./3-2.jsp">
		<table border="1">
			<tr>
				<td>아이디</td>
				<td><input type="text" name="uid"></td>
			</tr>
			<tr>
				<td>비밀번호</td>
				<td><input type="password" name="pass"></td>
			</tr>
			<tr>
				<td colspan="2"><input type="submit" value="로그인"></td>
			</tr>
		</table>
	</form>
	
	<h4>회원가입</h4>
	<form action="./3-3.jsp" method="post">
		<table border="1">
			<tr>
				<td>이름</td>
				<td><input type="text" name="name"></td>
			</tr>
			<tr>
				<td>성별</td>
				<td>
					<label><input type="radio" name="gender" value="남" />남</label>
					<label><input type="radio" name="gender" value="여" />여</label>
				</td>
			</tr>
			<tr>
				<td>취미</td>
				<td>
					<label><input type="checkbox" name="hobby" value="등산" />등산</label>
					<label><input type="checkbox" name="hobby" value="여행" />여행</label>
					<label><input type="checkbox" name="hobby" value="독서" />독서</label>
					<label><input type="checkbox" name="hobby" value="운동" />운동</label>
					<label><input type="checkbox" name="hobby" value="영화" />영화</label>
				</td>
			</tr>
			<tr>
				<td>주소</td>
				<td>
					<select name="addr">
						<option>서울</option>
						<option>대전</option>
						<option>대구</option>
						<option>부산</option>
						<option>광주</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>
					<input type="submit" value="가입하기">
				</td>
			</tr>			
		</table>
	</form>
	
	
	
</body>
</html>