<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Action Tag</title>
</head>
<body>
	<jsp:useBean id="bean" class="ch04.com.dao.Calculator"/>
	<%
		int m = bean.process(5);
	out.print("5의 3제곱 : " + m);
	%>
</body>
</html>