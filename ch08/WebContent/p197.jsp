<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<jsp:useBean id="member" scope="request" class="../Java Resources/src/member.p194" />
<%
	member.setId("madvirus"); 
	member.setName("최범균"); 
%>
<jsp:forward page="./p198.jsp" />