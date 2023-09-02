<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Calendar"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Objects</title>
</head>
<body>
	<% 
		response.setIntHeader("Refresh", 5) ;
		//Calendar calendar = Calendar.getInstance(new Locale("ko"));
		//String str = 
				//calendar.get(Calendar.);
	
		Date day = new java.util.Date();
		String am_pm;
		int hour = day.getHours();
		int minute = day.getMinutes();
		int second = day.getSeconds();
		if(hour / 12 == 0){
			am_pm = "AM";
		} else {
			am_pm = "PM";
			// hour = hour - 12;
		}
		String Time = hour + " : " + minute + " : " + second + " " + am_pm;
		out.println("현재 시간은 " + Time);
		
	%>
	<p><a href="response_data.jsp">Google 홈페이지로 이동하기</a></p>
</body>
</html>