<%@page import="java.io.File"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.farmstory.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String seq = request.getParameter("seq");
	String cate = request.getParameter("cate");
	String group = request.getParameter("group");
	
	Connection conn = DBConfig.getConnection();
	
	PreparedStatement psmt = conn.prepareStatement(SQL.DELETE_ARTICLE);
	psmt.setString(1, seq);
	
	PreparedStatement psmtSelect = conn.prepareStatement(SQL.SELECT_FILE);
	psmtSelect.setString(1, seq);
	
	PreparedStatement psmtFile = conn.prepareStatement(SQL.DELETE_FILE);
	psmtFile.setString(1, seq);

	psmt.executeUpdate();
	ResultSet rs = psmtSelect.executeQuery();
	
	
	
	String newName = null;
	
	if(rs.next()){
		newName = rs.getString(4);
		psmtFile.executeUpdate();
		
		// 파일 스트림 연결해서 저장된 파일 삭제
		String path = request.getServletContext().getRealPath("/data");
		File file = new File(path+"/"+newName);
		file.delete();
	}
	
	rs.close();
	psmtFile.close();
	psmtSelect.close();
	psmt.close();
	conn.close();
	
	// list 페이지 이동
	response.sendRedirect("/farmstory/board/list.jsp?cate="+cate+"&group="+group);

%>