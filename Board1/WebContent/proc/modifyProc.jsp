<%@page import="kr.co.board1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.board1.config.DBConfig"%>
<%@page import="kr.co.board1.bean.BoardMemberBean"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String title	=request.getParameter("subject");
	String content	=request.getParameter("content");
	
	String seq = request.getParameter("seq");
	String pg = request.getParameter("pg");
	
	BoardMemberBean bmb = (BoardMemberBean)session.getAttribute("member");
	String uid = bmb.getUid();
	
	// 1, 2단계
	Connection conn = DBConfig.getConnection();
	
	// 3단계
	PreparedStatement psmt = conn.prepareStatement(SQL.UPDATE_MODIFY_ARTICLE);
	psmt.setString(1, title);	//title
	psmt.setString(2, content);	//content
	psmt.setString(3, seq);	//content
	
	// 4단계	   
	psmt.executeUpdate();
	// 5단계
	// 6단계
	psmt.close();
	conn.close();
	
	// list 페이지 이동
	response.sendRedirect("../view.jsp?seq="+seq+"&pg="+pg);
%>