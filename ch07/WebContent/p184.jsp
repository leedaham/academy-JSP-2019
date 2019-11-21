<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%
	String code = request.getParameter("code");
	String viewPageURI = null;
	
	if(code.equals("A")){
		viewPageURI = "./p185.jsp";
	}else if(code.contains("B")){
		viewPageURI = "./p185.jsp";
	}else if(code.contains("C")){
		viewPageURI = "./p185.jsp";
	}

%>
<jsp:forward page="<%=viewPageURI %>"/>