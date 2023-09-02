<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form Processing</title>
</head>
<body>
	<%
		request.setCharacterEncoding("UTF-8");
	
		StringBuffer str = new StringBuffer();
		str.append("<p>이름 :" + request.getParameter("name") + "</p>");
		str.append("<p>주소 :" + request.getParameter("address") + "</p>");
		str.append("<p>이메일 :" + request.getParameter("email") + "</p>");	
		
	%>
	
	
</body>
</html>