<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.io.*, java.util.*" %>
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
	
		Enumeration paramName = request.getParameterNames();
		while (paramName.hasMoreElements()){
			String name = (String) paramName.nextElement();
			String Value = request.getParameter(name);
			str.append("<p>" + name + " : " + request.getParameter(name) + "</p>");
		}
			
	%>
	<%= str%>
	
</body>
</html>