<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>Action Tag</title>
</head>
<body>
	<jsp:useBean id="person" class="ch04.com.dao.Person" scope="request"/>
	<p>아이디 : <jsp:getProperty property="id" name="person"/></p>
	<p>이름 : <jsp:getProperty property="name" name="person"/></p>
</body>
</html>