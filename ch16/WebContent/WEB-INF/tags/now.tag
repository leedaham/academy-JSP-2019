<%@tag import="java.util.Calendar"%>
<%@ tag language="java" pageEncoding="UTF-8"%>
<%
	Calendar c = Calendar.getInstance();

	int year = c.get(Calendar.YEAR);
	int month = c.get(Calendar.MONTH);
	int date = c.get(Calendar.DATE);
	int hour = c.get(Calendar.HOUR);
	int min = c.get(Calendar.MINUTE);
	int sec = c.get(Calendar.SECOND);
	
	request.setAttribute("year", year);
	request.setAttribute("month", month);
	request.setAttribute("date", date);
%>
<p>
	현재날짜 : ${year}년${month}월${date}일 <br>
	현재시간 : <%=hour%>시<%=min%>분<%=sec%>초
</p>