<%@page import="kr.co.board1.config.SQL"%>
<%@page import="kr.co.board1.config.DBConfig"%>
<%@page import="kr.co.board1.bean.BoardMemberBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	
	String uid	= request.getParameter("uid");	
	String pw	= request.getParameter("pass");	


	// 1, 2단계
	Connection conn = DBConfig.getConnection();
	
	// 3단계
	PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_LOGIN);
	psmt.setString(1, uid);
	psmt.setString(2, pw);
	
	// 4단계
	ResultSet rs = psmt.executeQuery();
	
	// 5단계
	if(rs.next()){
				
		// 회원이 있으면 (비밀번호에 해당하는 회원이 있으면)
		BoardMemberBean bmb = new BoardMemberBean();
		bmb.setUid(rs.getString(1));
		bmb.setPass(rs.getString(2));
		bmb.setName(rs.getString(3));
		bmb.setNick(rs.getString(4));
		bmb.setEmail(rs.getString(5));
		bmb.setHp(rs.getString(6));
		bmb.setGrade(rs.getInt(7));
		bmb.setZip(rs.getString(8));
		bmb.setAddr1(rs.getString(9));
		bmb.setAddr2(rs.getString(10));
		bmb.setRegip(rs.getString(11));
		bmb.setRdate(rs.getString(12));
		
		// 세션에 사용자정보객체(bmb) 저장
		session.setAttribute("member", bmb);
		
		// 리스트페이지 이동
		response.sendRedirect("../list.jsp");
	}else{
		// 회원이 없으면 (비밀번호에 해당하는 회원이 없으면)
		
		// 로그인페이지 이동
		response.sendRedirect("./login.jsp?code=101");
	}
		
	
	// 6단계
	rs.close();
	psmt.close();
	conn.close();
%>