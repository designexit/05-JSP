<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository" %>

<%
	String id = request.getParameter("id");
	if(id == null || id.trim().equals("")) {
		response.sendRedirect("books.jsp");
		return;
	}
	
	PreparedStatement pstmt = null;
	ResultSet rs = null;
	
	String sql = "select * from book WHERE b_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1,id);
	rs = pstmt.executeQuery();
	
	if(!rs.next()){
		response.sendRedirect("exceptionNoBookId.jsp");
	}
	
	sql = "select * from book";
	pstmt = conn.prepareStatement(sql);
	rs = pstmt.executeQuery();
	
	ArrayList<Book> goodsList = new ArrayList<Book>();
	
	while(rs.next()){
		Book book = new Book();
		
		book.setBookId(rs.getString("b_id"));
		book.setName(rs.getNString("b_name"));
		book.setUnitPrice(rs.getInt("b_unitPrice"));
		book.setAuthor(rs.getString("b_author"));
		book.setPublisher(rs.getString("b_publisher"));
		book.setDescription(rs.getString("b_description"));
		book.setCategory(rs.getString("b_category"));
		book.setUnitInStock(rs.getLong("b_unitsInStock"));
		book.setTotalPages(rs.getLong("b_totalPage"));
		book.setCondition(rs.getString("b_condition"));
		book.setFilename(rs.getString("b_filename"));
		goodsList.add(book);
	}
	
	Book goods = new Book();
	for (int i=0; i<goodsList.size(); i++) {
		goods = goodsList.get(i);
		if(goods.getBookId().equals(id)){
			break;
		}
	}
	
	ArrayList<Book> list = (ArrayList<Book>) session.getAttribute("cartlist");
	if(list == null) {
		list = new ArrayList<Book>();
		session.setAttribute("cartlist", list);
	}
	
	int cnt = 0;
	Book goodsQnt = new Book();
	for(int i=0; i<list.size(); i++) {
		goodsQnt = list.get(i);
		if(goodsQnt.getBookId().equals(id)) {
			cnt++;
			int orderQuantity = goodsQnt.getQuantity() + 1;
			goodsQnt.setQuantity(orderQuantity);
		}
	}
	
	if(cnt == 0){
		goods.setQuantity(1);
		list.add(goods);
	}
	
	response.sendRedirect("book.jsp?id=" + id);	
%>

