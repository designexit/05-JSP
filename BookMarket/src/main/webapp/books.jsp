<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%-- <%@ page import="java.util.ArrayList"%>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository"%> --%>
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
	<div class="container">
		<div align="center">
			<%@ include file="dbconn.jsp" %>
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				String sql = "select * from book";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				while(rs.next()){
			%>
			<div class="row mb-3">
				<div class="col-4">
					<%-- <img src="/upload/<%=book.getFilename() %>" style="width:40%" /> --%>
					<%-- <img src="/Users/minkyoungkim/upload/<%=rs.getString("b_fileName") %>" style="width:40%" /> --%>
					<img src="/Users/minkyoungkim/upload/ISBN1234.jpg" style="width=40%">
				</div>
				<div class="col-8 text-left ">
					<h3><span><%=rs.getString("b_category") %></span> <span><%=rs.getString("b_name") %></span></h3>
					<div class="row justify-content-between">
						<p class="col-10 mt-4"><%=rs.getString("b_description") %></p>
						<p class="col-2 align-self-center">
							<a href="./book.jsp?id=<%=rs.getString("b_id") %>"
								class="btn btn-secondary" role="button">상세 정보 &raquo;</a>
						</p>
					</div>
	
					<div class="text-secondary">
						<span><%=rs.getString("b_author") %> <i> | </i></span> <span><%=rs.getString("b_publisher") %><i>
								| </i></span> <span><%=rs.getString("b_unitPrice") %>원</span>
					</div>
				</div>
			</div>
			<hr>
			<%
				}
				
				if(rs != null)
					rs.close();
				if(pstmt != null)
					pstmt.close();
				if(conn != null)
					conn.close();
			%>
		</div>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>