<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Validation</title>
</head>
<script type="text/javascript">
	function checkLogin(){
		var form = document.loginForm;
		if(form.id.value == ""){
			alert("아이디를 입력해 주세요.");
			form.id.focus();
			return false;
		} else if(form.passwd.value == ""){
			alert("비밀번호를 입력해 주세요.");
			form.passwd.focus();
			return false;
		}
		
		
		//var str = document.loginForm.passwd.value;
		// var regExp = document.loginForm.id.value;
		if(!regExp.test(id)){
			alert("비밀번호는 ID를 포함할 수 없습니다.");
			form.passwd.focus();
			return false;
		}
		
		
		form.submit();
	}
</script>
<body>
	<form name="loginForm" action="validation_process.jsp" method="post">
		<p>아이디 : <input type="text" name="id"></p>
		<p>비밀번호 : <input type="password" name="passwd"></p>
		<p><input type="button" value="전송" onclick="checkLogin()"></p>
	</form>
</body>
</html>