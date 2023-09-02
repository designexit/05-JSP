<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
<%-- <%@ page import="dao.BookRepository" %> --%>
<%-- <jsp:useBean id="bookDAO" class="dao.BookRepository" scope="session" /> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css">
<title>도서 상세 정보</title>
<script type="text/javascript">
	function addToCart() {
		if (confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		} else {
			document.addForm.reset();
		}
	}
</script>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 정보</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp" %>
	<%
		String bookId = request.getParameter("id");	
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = "SELECT * FROM book WHERE b_id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,productId);
		rs = pstmt.executeQuery();
		if(rs.next()){
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<!-- <img src="/upload/<%-- <%=book.getFilename()%> --%>" style="width:100%"> -->
				<img src="/Users/minkyoungkim/upload/<%=book.getFilename()%>" style="width:70%">
			</div>
			<%@ include file="dbconn.jsp" %>
			<div class="col-md-6">
				<h3><%=book.getCategory()%> <%=book.getName()%></h3>
				<p><%=book.getDescription()%></p>
				<p><b>도서 코드 : </b><span class="badge badge-danger"><%=book.getBookId()%></span></p>
				<p><b>출판사 : </b><%=book.getPublisher()%></p>
				<p><b>저자 : </b><%=book.getAuthor()%></p>
				<p><b>재고수 : </b><%=book.getUnitInStock()%></p>
				<p><b>총페이지 수 : </b><%=book.getTotalPages()%></p>
				<p><b>출판일 : </b><%=book.getReleaseDate()%></p>
				<h4><%=book.getUnitPrice()%>원</h4>
				<div class="row">
					<p>
						form name="addForm" action="./addCart.jsp?id=<%=rs.getString("b_id") %>" method="post">
							<a href="#" class="btn btn-info" onclick="addToCart()">상품 주문&raquo;</a>
							<a href="./cart.jsp" class="btn btn-warning">장바구니&raquo;</a>
							<a href="./books.jsp?" class="btn btn-secondary">상품 목록 &raquo;</a>
						</form>
					</p>
				</div>

			</div>
		</div>
		<hr>
	</div>

	<jsp:include page="footer.jsp" />
</body>
</html>