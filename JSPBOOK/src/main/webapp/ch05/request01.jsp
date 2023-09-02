<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Implicit Objects</title>
</head>
<body>
	<form action="request01_process.jsp" method="post"> <!--  method : get, post - get은 주소창에 정보 노출, post는 정보노출 안됨 보안성높음 -->
		<p>아이디 : <input type="text" name="id"></p>
		<p>비밀번호 : <input type="text" name="passwd"></p>
		<p><input type="submit" value="전송"></p>
	</form>
</body>
</html>