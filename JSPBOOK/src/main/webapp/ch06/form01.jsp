<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Form Processing</title>
</head>
<body>
	<h3>회원가입</h3>
	<form action="#" name="member" method="post">
		<p>아이디 : <input type="text" name="id"><input type="button" value="아이디 중복 검사"></p>
		<p>비밀번호 : <input type="password" name="passwd"></p>
		<p>이름 : <input type="text" name="name"></p>
		<p>연락처 : <input type="text" name="phone1" maxlenght="4" size="4">
			- <input type="text" name="phone2" maxlenght="4" size="4"> -
			<input type="text" name="phone3" maxlenght="4" size="4">
		</p>
		<p>성별 : <input type="radio" name="sex" value="남성" checked>남성 <input type="radio" name="sex" value="여성">여성</p>
		<p>취미 : 독서<input type="checkbox" name="hobby1" checked> 
				운동<input type="checkbox" name="hobby2"> 
				영화<input type="checkbox" name="hobby3">
		</p>
		<p><input type="submit" value="가입하기"> <input type="reset" value="다시 쓰기"></p>

	</form>
</body>
</html>