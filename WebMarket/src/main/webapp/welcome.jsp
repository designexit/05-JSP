<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ page import="java.util.Date"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link rel="stylesheet" href="bootstrap-4.0.0/bootstrap-4.0.0/dist/css/bootstrap.min.css">
<!-- <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"> -->
<title>Welcome</title>
</head>
<body>
	<nav class="navbar navbar-expand navbar-dark bg-dark">
		<div class="container">
			<div class="navbar-header">
				<a class="navbar-brand" href="">Home</a>
			</div>
			<div>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item"><a href="./products.jsp" class="nav-link">상품 목록</a></li>
				<li class="nav-item"><a href="./addProduct.jsp" class="nav-link">상품 등록</a></li>
				<li class="nav-item"><a href="./editProduct.jsp?edit=update" class="nav-link">상품 수정</a></li>
				<li class="nav-item"><a href="./editProduct.jsp?edit=delete" class="nav-link">상품 삭제</a></li>
			</ul>
		</div>
		</div>
		
	</nav>
	<%!String greeting = "웹 쇼핑몰에 오신 것을 환영합니다.";
	String tagline = "Welcome to Web Market!";%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%=greeting%>
			</h1>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3>
				<%=tagline%>
			</h3>
			<%
			response.setIntHeader("Refresh", 5);
			Date day = new java.util.Date();
			String am_pm;
			int hour = day.getHours();
			int minute = day.getMinutes();
			int second = day.getSeconds();
			if (hour / 12 == 0) {
				am_pm = "AM";
			} else {
				am_pm = "PM";
				hour = hour - 12;
			}
			String CT = hour + ":" + minute + ":" + second + " " + am_pm;
			out.println("현재 접속 시각: " + CT + "\n");
			%>
		
		</div>
	</div>
	<footer class="container">
		<p>&copy; WebMarket</p>
	</footer>

</body>
</html>