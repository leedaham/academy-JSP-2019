<%@page import="java.sql.Statement"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kr.co.farmstory.bean.BoardArticleBean"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="kr.co.farmstory.config.SQL"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="kr.co.farmstory.config.DBConfig"%>
<%@page import="kr.co.farmstory.bean.BoardMemberBean"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
/*
	BoardMemberBean bmb = (BoardMemberBean) session.getAttribute("member");
	
	if(bmb == null){
		response.sendRedirect("/farmstory/user/login.jsp");
		return;
	}	//여기까지면 프로그램 실행
*/	
	request.setCharacterEncoding("UTF-8");
	
	String group  = request.getParameter("group");
	String cate  = request.getParameter("cate");
	String pg	 = request.getParameter("pg");
	
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
	psmt.setString(1, cate);
	psmt.setInt(2, limitBegin);
	
	PreparedStatement psmtTotal = conn.prepareStatement(SQL.SELECT_ARTICLE_TOTAL);
	psmtTotal.setString(1, cate);
	
	
	// 4 단계
	ResultSet rs = psmt.executeQuery();
	ResultSet rsTotal=psmtTotal.executeQuery();
	
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
	
	String asideView = "./_aside_"+group+".jsp";
	
%>
<%@ include file="../_header.jsp" %>
<jsp:include page="<%= asideView%>">
	<jsp:param value="<%=cate%>" name="cate"/>
</jsp:include>
    
			<div id="board">
				<h3>글목록</h3>
				<!-- 리스트 -->
				<div class="list">
					
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
							<td><a href="./view.jsp?seq=<%=bab.getSeq()%>&pg=<%=pg%>&cate=<%=cate%>&group=<%=group%>"><%=bab.getTitle() %></a>&nbsp;[<%=bab.getComment() %>]</td>
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
					<a href="./list.jsp?pg=<%=groupStart - 10 %>&group=<%=group%>&cate=<%=cate%>" class="prev">이전</a>
					<% } %>
					
					<% for(int p = groupStart; p <= groupEnd; p++) { %>
					<a href="./list.jsp?pg=<%=p %>&group=<%=group%>&cate=<%=cate%>" class="num <%= (currentPg == p)? "current":""%>"><%=p %></a>
					<% } %>
					
					<% if(groupEnd < lastPage) { %>
					<a href="./list.jsp?pg=<%=groupEnd + 1 %>&group=<%=group%>&cate=<%=cate%>" class="next">다음</a>
					<% } %>
					
					</span>
				</nav>
				<a href="/farmstory/board/write.jsp?cate=<%=cate %>&group=<%=group %>" class="btnWrite">글쓰기</a>
			</div>

			<!-- 컨텐츠 내용 끝 -->
        </article>
    </div>

</section>
<%@ include file="../_footer.jsp" %>