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
	
		String[] fruits = request.getParameterValues("fruits");
	%>
	
	<h4>선택한 과일</h4>
	<p>
		<%
			if(fruits != null){
				for(int i=0; i<fruits.length; i++){
					out.println(fruits[i]);
				}
			}
		%>
	</p>
</body>
</html>