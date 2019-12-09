<%@ page contentType="text/html;charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>12-1</title>
</head>
<body>
	<h3>1.JSTL(Java Standards Tag Library)</h3>
	<%
		String str = "Hello";
		out.print("<p>"+str+"</p>");
		
		int num1 = 1;
		int num2 = 2;
		int num3 = 3;
		
		if(num1 < num2){
			out.print("<p>num1이 num2보다 작다.</p>");
		}
		if(num1 > num2){
			out.print("<p>num1이 num2보다 크다.</p>");
		}else{
			out.print("<p>num1이 num2보다 작다.</p>");
		}
		
		if(num1 > num2){
			out.print("<p>num1이 num2보다 크다.</p>");
		}else if(num2 > num3){
			out.print("<p>num2이 num3보다 크다.</p>");
		}else {
			out.print("<p>num3이 가장 크다.</p>");
		}
		
		for(int i=1; i<=5; i++){
			out.print("<p>HELLO JSTL!!!</p>");
		}
		
		int total = 0;
		for(int k=1; k<=10; k++){
			total += k;
		}
		
		out.print("<p>1부터 10까지 합 : "+total+"</p>");
		
	%>
	
	<h4>JSTL</h4>
	<c:set var="str" value="Hello" />
	<p>${ str }</p>
	
	<c:set var="num1" value="1" />
	<c:set var="num2" value="2" />
	<c:set var="num3" value="3" />
	
	<c:if test="${num1 < num2 }" >
		<p>num1이 num2보다 작다.</p>
	</c:if>
	
	<c:choose>
		<c:when test="${num1 gt num2}">
			<p>num1이 num2보다 크다.</p>
		</c:when>
		<c:otherwise>
			<p>num1이 num2보다 작다.</p>
		</c:otherwise>
	</c:choose>
	<c:choose>
		<c:when test="${num1 gt num2}">
			<p>num1이 num2보다 크다.</p>
		</c:when>
		<c:when test="${num2 gt num3}">
			<p>num2이 num3보다 크다.</p>
		</c:when>
		<c:otherwise>
			<p>num3이 가장 크다.</p>
		</c:otherwise>
	</c:choose>
	
	<c:forEach var="i" begin="1" end="5">
		<p>Hello JSTL!!!</p>
	</c:forEach>
	
	<c:set var="total" value="0" />
	<c:forEach var="k" begin="1" end="10">
		<c:set var="total" value="${total + k}"/>
	</c:forEach>
	<p>1부터 10까지 합 : ${total}</p>
</body>
</html>