<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>    
<%@ page import="dto.Book"%>
<%@ page import="dao.BookRepository" %>

<%
	String id = request.getParameter("id");
	if(id == null || id.trim().equals("")) {
		response.sendRedirect("books.jsp");
		return;
	}
	
	BookRepository dao = BookRepository.getInstance();
	
	Book book = dao.getBookById(id);
	if(book == null){
		//response.sendRedirect("exceptionNoBookId.jsp");
		response.sendRedirect("books.jsp");
	}
		
	ArrayList<Book> castList = (ArrayList<Book>) session.getAttribute("cartlist");
	Book goodsQnt = new Book();
	for(int i=0; i<castList.size(); i++) {
		goodsQnt = castList.get(i);
		if(goodsQnt.getBookId().equals(id)){
			castList.remove(goodsQnt);
		}
	}
	
	
	response.sendRedirect("cart.jsp");
	
%>
