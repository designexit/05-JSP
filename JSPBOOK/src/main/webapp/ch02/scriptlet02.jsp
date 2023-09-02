<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Script Tag</title>
</head>
<% 
int count = 0;
%>
<body>

	<%
	for (int i = 0; i <= 10; i++) {
		if (i % 2 == 0)
			out.println(i + "<br>");
	}
	out.println("ass");
	%>
	<%= "ass" %>
	
	Page count is
	<%= ++count %>
</body>
</html>