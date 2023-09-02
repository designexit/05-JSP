<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="dto.Book"%>
<%@page import="java.util.ArrayList"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
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
		pstmt.setString(1,bookId);
		rs = pstmt.executeQuery();
		if(rs.next()){
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-5">
				<!-- <img src="/upload/<%-- <%=book.getFilename()%> --%>" style="width:100%"> -->
				<img src="/Users/minkyoungkim/upload/<%=rs.getString("b_fileName")%>" style="width:70%">
			</div>
			<%@ include file="dbconn.jsp" %>
			<div class="col-md-6">
				<h3><%=rs.getString("b_category")%> <%=rs.getString("b_name")%></h3>
				<p><%=rs.getString("b_description")%></p>
				<p><b>도서 코드 : </b><span class="badge badge-danger"><%=rs.getString("b_id")%></span></p>
				<p><b>출판사 : </b><%=rs.getString("b_publisher")%></p>
				<p><b>저자 : </b><%=rs.getString("b_author")%></p>
				<p><b>재고수 : </b><%=rs.getString("b_unitInStock")%></p>
				<p><b>총페이지 수 : </b><%=rs.getString("b_totalPages")%></p>
				<p><b>출판일 : </b><%=rs.getString("b_releaseDate")%></p>
				<h4><%=rs.getString("b_unitPrice")%>원</h4>
				<div class="row">
					<p>
						<form name="addForm" action="./addCart.jsp>id=<%=rs.getString("b_id") %>" method="post">
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