<%@page import="java.sql.Statement"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.board1.bean.BoardArticleBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.board1.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.board1.config.DBConfig"%>
<%@page import="kr.co.board1.bean.BoardMemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%

	BoardMemberBean bmb = (BoardMemberBean) session.getAttribute("member");
	
	if(bmb == null){
		response.sendRedirect("./user/login.jsp");
		return;
	}	//여기까지면 프로그램 실행
	
	request.setCharacterEncoding("UTF-8");
	
	String pg = request.getParameter("pg");
	
	if(pg == null){
		pg = "1";
	}
	
	// 페이지 관련 
	int total		= 0;
	int lastPage	= 0;
	int listCount	= 0;
	int currentPg	= Integer.parseInt(pg);
	int limitBegin	= (currentPg - 1) * 10;
	int groupCurrent = (int)Math.ceil(currentPg / 10.0);
	int groupStart 	 = (groupCurrent - 1) * 10 + 1;
	int groupEnd	 = groupCurrent * 10;
	
	
	// 1, 2단계
	Connection conn = DBConfig.getConnection();
	
	// 3 단계
	PreparedStatement psmt = conn.prepareStatement(SQL.SELECT_ARTICLE_LIST);
	psmt.setInt(1, limitBegin);
	
	Statement stmt = conn.createStatement();
	
	// 4 단계
	ResultSet rs = psmt.executeQuery();
	ResultSet rsTotal=stmt.executeQuery(SQL.SELECT_ARTICLE_TOTAL);
	
	// 5 단계
	if(rsTotal.next()){
		total = rsTotal.getInt(1);
		
		if(total % 10 == 0){
			lastPage = total / 10;
		}else{
			lastPage = total / 10 + 1;
		}
		
		if(groupEnd > lastPage){
			groupEnd = lastPage;
		}else{
			
		}
		
		listCount = total - limitBegin;
		
	}
	
	List<BoardArticleBean> articleList = new ArrayList();
	
	while(rs.next()){
		
		BoardArticleBean bab = new BoardArticleBean();
		
		bab.setSeq(rs.getInt(1));
		bab.setParent(rs.getInt(2));
		bab.setComment(rs.getInt(3));
		bab.setCate(rs.getString(4));
		bab.setTitle(rs.getString(5));
		bab.setContent(rs.getString(6));
		bab.setFile(rs.getInt(7));
		bab.setHit(rs.getInt(8));
		bab.setUid(rs.getString(9));
		bab.setRegip(rs.getString(10));
		bab.setRdate(rs.getString(11));
		bab.setNick(rs.getString(12));
		
		articleList.add(bab);
	}
	
	// 6 단계
	rs.close();
	psmt.close();
	conn.close();
	// 6 단계
	
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>글목록</title> 
		<link rel="stylesheet" href="/Board1/css/style.css" />
	</head>
	<body>
		<div id="board">
			<h3>글목록</h3>
			<!-- 리스트 -->
			<div class="list">
				<p class="logout"><%= bmb.getNick() %>님! 반갑습니다. <a href="/Board1/user/logout.jsp">[로그아웃]</a><p>
				<table>
					<tr>
						<td>번호</td>
						<td>제목</td>
						<td>글쓴이</td>
						<td>날짜</td>
						<td>조회</td>
					</tr>
					
					<%for(BoardArticleBean bab : articleList){ %>
					<tr>
						<td><%=listCount-- %></td>
						<td><a href="./view.jsp?seq=<%=bab.getSeq()%>&pg=<%=pg%>"><%=bab.getTitle() %></a>&nbsp;[<%=bab.getComment() %>]</td>
						<td><%=bab.getNick() %></td>
						<td><%=bab.getRdate().substring(2, 10) %></td>
						<td><%=bab.getHit() %></td>
					</tr>
					<% } %>
				</table>
			</div>
			<!-- 페이징 -->
			<nav class="paging">
				<span> 
				<% if(groupStart > 1) {%>
				<a href="./list.jsp?pg=<%=groupStart - 10 %>" class="prev">이전</a>
				<% } %>
				
				<% for(int p = groupStart; p <= groupEnd; p++) { %>
				<a href="./list.jsp?pg=<%=p %>" class="num <%= (currentPg == p)? "current":""%>"><%=p %></a>
				<% } %>
				
				<% if(groupEnd < lastPage) { %>
				<a href="./list.jsp?pg=<%=groupEnd + 1 %>" class="next">다음</a>
				<% } %>
				
				</span>
			</nav>
			<a href="/Board1/write.jsp?pg=<%=pg %>" class="btnWrite">글쓰기</a>
		</div>
	</body>

</html>










