<%@page import="java.net.URLEncoder"%>
<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
	String value = "자바";
	String encodedValue = URLEncoder.encode(value, "UTF-8");
	response.sendRedirect("./endex.jsp?name="+encodedValue);
%>
