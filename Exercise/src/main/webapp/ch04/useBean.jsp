<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<jsp:useBean id="gugudan" class="ch04.com.dao.GuGuDan"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>구구단 출력하기</h3>
	<%
		out.println(gugudan.process(5));
	%>
	
	<h3>구구단 출력하기2</h3>
	<%
		for(int i=1; i<=9; i++){
			out.println(5+"*"+i+"="+gugudan.process(5,i)+"<br>");	
		}
		
	%>
</body>
</html>