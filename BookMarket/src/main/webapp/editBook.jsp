<%@page import="javax.swing.tree.DefaultTreeCellEditor.EditorContainer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="./resources/css/bootstrap.min.css">
<title>도서 편집</title>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 상품을 삭제합니다.") == true){
			location.href = "./deleteBook.jsp?id=" + id;
		} else {
			return;
		}		
	}
</script>
</head>
<%
	String edit = request.getParameter("edit");
%>
<body>
	<jsp:include page="menu.jsp"/>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">도서 편집</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
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
					<img src="/upload/<%=rs.getString("b_fileName") %>" style="width:40%" />
				</div>
				<div class="col-8 text-left ">
					<h3><span>[<%=rs.getString("b_category") %>]</span> <span><%=rs.getString("b_name") %></span></h3>
					<div class="row justify-content-between">
						<p class="col-10 mt-4"><%=rs.getString("b_description") %></p>
						<p class="col-2 align-self-center">
							<%
						if(edit.equals("update")){
						%>
							<a href="./updateBook.jsp?id=<%=rs.getString("b_id") %>" class="btn btn-success" role="button">수정&raquo;</a>
						<%
							} else if (edit.equals("delete")){
						%>
						<a href="#" onclick="deleteConfirm('<%=rs.getString("b_id") %>')" class="btn btn-danger" role="button">삭제&raquo;</a>
						<%
							}
						%>
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
		<hr>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>