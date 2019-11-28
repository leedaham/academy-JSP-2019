<%@page import="kr.co.farmstory.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory.config.DBConfig"%>
<%@page import="org.json.simple.JSONObject"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="application/json;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String hp = request.getParameter("hp");	

	// 1, 2단계
	Connection conn = DBConfig.getConnection();
		
	// 3단계
	PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_CHECK_HP);
	psmt.setString(1, hp);
	// 4단계
	ResultSet rs = psmt.executeQuery();
	
	// 5단계
	JSONObject json = new JSONObject();
	if(rs.next()){
		json.put("result", rs.getInt(1));
	}
	
	// 6단계
	rs.close();
	psmt.close();
	conn.close();
	
	// json 출력
	out.print(json);
	
	


%>