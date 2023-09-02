<%@page import="ch18.com.model.LoginBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>MVC</title>
</head>
<body>
	<p>로그인에 성공했습니다.</p> 
	<p>
		<%
			LoginBean bean = (LoginBean) request.getAttribute("bean");
		out.print("아이디 : " + bean.getId());
		%>
	</p> 
</body>
</html>