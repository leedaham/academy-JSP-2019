<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>회원 목록</title>
</head>
<body>
	MEMBER 테이블의 내용
	<table widdth="100%" border="1">
	<tr>
		<td>이름</td><td>아이디</td><td>이메일</td>
	</tr>
	<%
		// 1. JDBC 드라이버 로딩
		Class.forName("com.mysql.jdbc.Driver");
	
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try{
			String jdbcDriver = "jdbc:mysql://localhost:8080/ch14?"+"useUnicode=true&charcaterEncoding=utf8";
			String dbUser="jspexam";
			String dbPass="jsppw";
			String query = "select * from MEMBER order by MEMBERID";
		}
	%>
	</table>
</body>
</html>