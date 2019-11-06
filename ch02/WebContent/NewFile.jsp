<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>3.반복문</title>
</head>
<body>
	<h3>3.반복문</h3>
	<h4>for문</h4>
	<%
		for(int i=1; i<=3; i++){
			out.println("<p>"+i+". 안녕하세요.</p>");
		}
	%>
	
	<h4>while문</h4>
	<%
		int k = 1;
		
		while(k <=3){
	%>
		<p><%= k %>.안녕하세요.</p>
	<%
		k++;
		}
	%>	
	
	<h4>구구단</h4>
	<table border="1">
		<tr>
		<% for(int i=2; i<=9; i++){	%>
			<td><%= i %>단</td>
		<% } %>
		</tr>
		<% for(int a=1; a<=9; a++){ %>
			<tr>
			<%
				for(int b=2;b<=9; b++){
				int c = b * a;			
			%>
				<td><%= b %> x <%= a %> = <%= c %></td>
			<% } %>
			</tr>
		<% } %>
	</table>
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>