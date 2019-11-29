<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cate = request.getParameter("cate");
	String group = request.getParameter("group");
	String asideView = "./_aside_"+group+".jsp";
%>
<%@ include file="../_header.jsp" %>
<jsp:include page="<%= asideView%>">
	<jsp:param value="<%=cate%>" name="cate"/>
</jsp:include>
			<div id="board">
				<h3>글쓰기</h3>
				<div class="write">
					<form action="/farmstory/proc/writeProc.jsp" method="post" enctype="multipart/form-data">
					<input type="hidden" name="cate" value=<%=cate %>>
					<input type="hidden" name="group" value=<%=group %>>
						<table>
							<tr>
								<td>제목</td>
								<td><input type="text" name="subject" placeholder="제목을 입력하세요." required /></td>
							</tr>				
							<tr>
								<td>내용</td>
								<td>
									<textarea name="content" rows="20" required></textarea>
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
							<a href="/farmstory/board/list.jsp?cate=<%=cate %>&group=<%=group %>" class="cancel">취소</a>
							<input type="submit" class="submit" value="작성완료" />
						</div>
					</form>
				</div>
			</div>
			<!-- 컨텐츠 내용 끝 -->
        </article>
    </div>

</section>
<%@ include file="../_footer.jsp" %>


