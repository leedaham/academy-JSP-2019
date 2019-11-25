<%@page import="org.json.simple.JSONObject"%>
<%@page import="kr.co.board1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.board1.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String seq = request.getParameter("seq");
	String parent = request.getParameter("parent");
	String pg = request.getParameter("pg");
	
	Connection conn = DBConfig.getConnection();
	
	PreparedStatement psmt = conn.prepareStatement(SQL.DELETE_ARTICLE);
	psmt.setString(1, seq);
	
	PreparedStatement psmtCount = conn.prepareStatement(SQL.UPDATE_COMMENT_COUNT2);
	psmtCount.setString(1, parent);
	
	psmt.executeUpdate();
	psmtCount.executeUpdate();
	
	psmt.close();
	psmtCount.close();
	conn.close();
	
	// list 페이지 이동
	response.sendRedirect("../view.jsp?seq="+parent+"&pg="+pg);
	

%>