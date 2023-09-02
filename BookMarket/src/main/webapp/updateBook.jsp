<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<script type="text/javascript" src="./resources/js/validation.js"></script>
<title>상품 수정</title>
</head>
<body>
	<fmt:setLocale value='<%= request.getParameter("language") %>'/>
	<fmt:bundle basename="bundle.message">
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">상품 수정</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp" %>
		<%
			String bookId = request.getParameter("id");
		
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql = "select * from book where b_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, bookId);
			rs = pstmt.executeQuery();
			if(rs.next()){
		%>
		<div class="container">
			<div class="row">
				<div class="col-md-5">
					<img src="/upload/<%=rs.getString("b_filename") %>" alt="Image" style="width: 100%" />
				</div>
				<!-- 상품 폼 -->
				<div class="col-md-7">
					<form action="./processUpdateBook.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
						<div class="form-group row">
							<label class="col-sm-2"><fmt:message key="bookId"/></label><!-- 상품코드 -->
							<div class="col-sm-3">
								<input type="text" id="bookId" name="bookId" class="form-control" value="<%=rs.getString("b_id") %>">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2"><fmt:message key="pname"/></label><!-- 상품명 -->
							<div class="col-sm-3">
								<input type="text" id="name" name="name" class="form-control" value="<%=rs.getString("b_name") %>">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2"><fmt:message key="unitPrice"/></label><!-- 가격 -->
							<div class="col-sm-3">
								<input type="text" id="unitPrice" name="unitPrice" class="form-control" value="<%=rs.getInt("b_unitPrice") %>">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2"><fmt:message key="description"/></label><!-- 상세설명 -->
							<div class="col-sm-3">
								<textarea name="description" cols="50" rows="2" class="form-control">
									<%=rs.getString("b_description") %>
								</textarea>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2"><fmt:message key="manufacturer"/></label><!-- 제조사 -->
							<div class="col-sm-3">
								<input type="text" name="manufacturer" class="form-control" value="<%=rs.getString("b_manufacturer") %>">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2"><fmt:message key="category"/></label><!-- 분류 -->
							<div class="col-sm-3">
								<input type="text" name="category" class="form-control" value="<%=rs.getString("b_category") %>">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2"><fmt:message key="unitsInStock"/></label><!-- 재고 수 -->
							<div class="col-sm-3">
								<input type="text" id="unitsInStock" name="unitsInStock" class="form-control" value="<%=rs.getLong("b_unitsInStock") %>">
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2"><fmt:message key="condition"/></label><!-- 상태 -->
							<div class="col-sm-3">
								<input type="radio" name="condition" value="New">
								<fmt:message key="condition_New"/>
								<input type="radio" name="condition" value="Old">
								<fmt:message key="condition_Old"/>
								<input type="radio" name="condition" value="Refurbished">
								<fmt:message key="condition_Refurbished"/>
							</div>
						</div>
						<div class="form-group row">
							<label class="col-sm-2"><fmt:message key="bookImage"/></label><!-- 이미지 -->
							<div class="col-sm-5">
								<input type="file" name="bookImage" class="form-control">
							</div>
						</div>
						<div class="form-group row">
							<div class="col-sm-offset-2 col-sm-10">
								<input type="submit" value="등록" class="btn-primary">
							</div>
						</div>
						
					</form>
				</div>
				<!-- //상품 폼 -->
				
			</div>
		</div>
		<%
			}
			if(rs != null)
				rs.close();
			if(pstmt != null)
				pstmt.close();
			if(conn != null)
				conn.close();
		%>
	
	</fmt:bundle>
	<jsp:include page="footer.jsp"/>
</body>
</html>