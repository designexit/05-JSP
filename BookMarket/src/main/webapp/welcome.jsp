<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
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
					<li class="nav-item"><a href="./books.jsp" class="nav-link">상품 목록</a></li>
					<li class="nav-item"><a href="./addBook.jsp" class="nav-link">상품 등록</a></li>
					<li class="nav-item"><a href="./editBook.jsp?edit=update" class="nav-link">상품 수정</a></li>
					<li class="nav-item"><a href="./editBook.jsp?edit=delete" class="nav-link">상품 삭제</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<%! String greeting= "Book Market Mall";
	String tagline = "Welcome to Book Market!";
	%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<%= greeting %>
			</h1>
		</div>
	</div>
	<div class="container">
		<div class="text-center">
			<h3>
				<%= tagline %>
			</h3>
		</div>
	</div>
	<!--  
	<footer class="container">
		<p>&copy; WebMarket</p>
	</footer>
	-->
	
</body>
</html>