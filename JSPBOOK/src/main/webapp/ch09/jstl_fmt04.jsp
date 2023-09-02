<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Internationalization</title>
</head>
<body>
	<p><jsp:useBean id="now" class="java.util.Date"/></p>
	<p>한국 : <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/></p>
	<p><fmt:timeZone value="America/New_York">
	뉴욕 : <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/></p>
	</fmt:timeZone>
	<p><fmt:timeZone value="Europe/London">
	런던 : <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/></p>
	</fmt:timeZone>
	<p><fmt:timeZone value="Europe/Barcelona">
	바르셀로나 : <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/></p>
	</fmt:timeZone>
	<p><fmt:timeZone value="Europe/Paris">
	파리 : <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/></p>
	</fmt:timeZone>
	<p><fmt:timeZone value="South_America/Rio_de_janeiro">
	리우데자네이로 : <fmt:formatDate value="${now}" type="both" dateStyle="full" timeStyle="full"/></p>
	</fmt:timeZone>
	
</body>
</html>