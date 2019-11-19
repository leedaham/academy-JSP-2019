<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String code = request.getParameter("code");

%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>로그인</title>
		<link rel="stylesheet" href="/Board1/css/style.css" />
		<script>
			var code = "<%= code%>";
			
			if(code =='101'){
				alert('회원정보가 잘못 되었습니다. \n다시 확인하시기 바랍니다.')
			}
		</script>
	</head>
	<body>
		<div id="member">
			<section class="login">		
				<form action="/Board1/user/loginProc.jsp" method="post">
					<table>
						<tr>
							<td><img src="/Board1/img/login_ico_id.png" alt="아이디" /></td>
							<td><input type="text" name="uid" required placeholder="아이디 입력" autocomplete="off" /></td>
						</tr>
						<tr>
							<td><img src="/Board1/img/login_ico_pw.png" alt="비밀번호" /></td>
							<td><input type="password" name="pass" required placeholder="비밀번호 입력" /></td>
						</tr>
					</table>
					<input type="submit" class="btnLogin" value="로그인" />
				</form>			
				
				<div class="info">
					<h3>회원로그인 안내</h3>
					<p>아직 회원이 아니시면 회원으로 가입하세요.</p>
					<div><a href="/Board1/user/terms.jsp">회원가입</a></div>
				</div>			
			</section>
		</div>
	
	</body>
</html>