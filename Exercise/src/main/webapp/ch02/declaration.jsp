<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Scripting Tag</title>
</head>

<body>
	<%! String st(String data){
		return data;
	}  %>
	
	<%
		out.println(st("Hello, Java Server Pages"));
	%>
	
	
	
</body>
</html>