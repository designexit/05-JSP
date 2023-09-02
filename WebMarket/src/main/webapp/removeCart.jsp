<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>    
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>  

<%
	String id = request.getParameter("id");
	if(id == null || id.trim().equals("")) {
		response.sendRedirect("products.jsp");
		return;
	}
	
	ProductRepository dao = ProductRepository.getInstance();
	
	Product product = dao.getProductById(id);
	if(product == null){
		response.sendRedirect("exceptionNoProductId.jsp");
	}
	
	
	ArrayList<Product> castList = (ArrayList<Product>) session.getAttribute("cartlist");
	Product goodsQnt = new Product();
	for(int i=0; i<castList.size(); i++) {
		goodsQnt = castList.get(i);
		if(goodsQnt.getProductId().equals(id)){
			castList.remove(goodsQnt);
		}
	}
	
	
	response.sendRedirect("cart.jsp");
	
%>
