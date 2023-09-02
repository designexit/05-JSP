<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%>
<!-- <jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" /> -->
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>도서 목록</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 목록</h1>
		</div>
	</div>
	<%
	BookRepository dao = BookRepository.getInstance();
	ArrayList<Book> listOfBooks = dao.getAllBooks();
	%>
	<div class="container">
		<div align="center">
			<%
			for (int i = 0; i < listOfBooks.size(); i++) {
				Book book = listOfBooks.get(i);
			%>
			<div class="row mb-3">
				<div class="col-4">
					<%-- <img src="/upload/<%=book.getFilename() %>" style="width:40%" /> --%>
					<img src="/Users/minkyoungkim/upload/<%=book.getFilename() %>" style="width:40%" />
				</div>
				<div class="col-8 text-left ">
					<h3><span><%=book.getCategory() %></span> <span><%=book.getName()%></span></h3>
					<div class="row justify-content-between">
						<p class="col-10 mt-4"><%=book.getDescription()%></p>
						<p class="col-2 align-self-center">
							<a href="./book.jsp?id=<%=book.getBookId()%>"
								class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
						</p>
	
					</div>
	
					<div class="text-secondary">
						<span><%=book.getAuthor()%><i> | </i></span> <span><%=book.getPublisher()%><i>
								| </i></span> <span><%=book.getUnitPrice()%>원</span>
					</div>
				</div>
			</div>
			<hr>
			<%
			}
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>