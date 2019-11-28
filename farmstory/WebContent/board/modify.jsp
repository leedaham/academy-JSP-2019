<%@page import="java.sql.PreparedStatement"%>
<%@page import="kr.co.farmstory.bean.BoardArticleBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.farmstory.config.SQL"%>
<%@page import="kr.co.farmstory.config.DBConfig"%>
<%@page import="java.sql.Connection"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");

	String seq = request.getParameter("seq");
	String pg = request.getParameter("pg");
	String cate = request.getParameter("cate");
	
	// 1, 2단계
	Connection conn = DBConfig.getConnection();
	
	// 3단계
	PreparedStatement psmtModify = conn.prepareStatement(SQL.SELECT_ARTICLE_VIEW);
	psmtModify.setString(1, seq);
	
	ResultSet rs = psmtModify.executeQuery();
	
	BoardArticleBean bab = new BoardArticleBean();
	
	if(rs.next()){
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
	}
	
	rs.close();
	psmtModify.close();
	conn.close();
%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8" />
		<title>글 수정</title> 
		<link rel="stylesheet" href="/Board1/css/style.css" />
	</head>
	<body>
		<div id="board">
			<h3>글쓰기</h3>
			<div class="write">
				<form action="/farmstory/proc/modifyProc.jsp?pg=<%=pg %>&cate=<%=cate%>" method="post">
				<input type="hidden" name="seq" value="<%=seq %>"/>
					<table>
						<tr>
							<td>제목</td>
							<td><input type="text" name="subject" value="<%=bab.getTitle() %>" placeholder="제목을 입력하세요." required /></td>
						</tr>				
						<tr>
							<td>내용</td>
							<td>
								<textarea name="content" rows="20" required><%=bab.getContent() %></textarea>
							</td>
						</tr>
						<tr>
							<td>첨부</td>
							<td>
								<input type="file" name="file" />
							</td>
						</tr>
					</table>
					<div class="btns">
						<a href="./view.jsp?seq=<%= seq %>&pg=<%=pg%>&cate=<%=cate%>" class="cancel">취소</a>
						<input type="submit" class="submit" value="수정완료" />
					</div>
				</form>
			</div>
		</div>
	</body>
</html>


