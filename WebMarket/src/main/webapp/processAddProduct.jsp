<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="com.oreilly.servlet.*" %>
<%@ page import="com.oreilly.servlet.multipart.*" %>
<%@ page import="java.util.*" %>
<%@ page import="java.sql.*" %>
<%@ include file="dbconn.jsp" %>
<%-- 
<%@ page import="dto.Product" %>
<%@ page import="dao.ProductRepository" %>
--%>
<% 
	String filename="";
	String realFolder = "C:\\upload";
	int maxSize = 5 * 1024 * 1024;
	String encType = "utf-8";
	
	MultipartRequest multi = new MultipartRequest(request, realFolder, maxSize, encType, new DefaultFileRenamePolicy());
	
	/* String productId = multi.getParameter("p_id)");
	String pname = multi.getParameter("p_name");
	String unitPrice = multi.getParameter("p_unitPrice");
	String description = multi.getParameter("p_description");
	String manufacturer = multi.getParameter("p_manufacturer");
	String category = multi.getParameter("p_category");
	String unitsInStock = multi.getParameter("p_unitsInStock");
	String condition = multi.getParameter("p_condition");  */
	

	String productId = multi.getParameter("productId");
	String name = multi.getParameter("name");
	String unitPrice = multi.getParameter("unitPrice");
	String description = multi.getParameter("description");
	String manufacturer = multi.getParameter("manufacturer");
	String category = multi.getParameter("category");
	String unitsInStock = multi.getParameter("unitsInStock");
	String condition = multi.getParameter("condition"); 

	
	Integer price;
	
	if(unitPrice.isEmpty())
		price = 0;
	else
		price = Integer.valueOf(unitPrice);
	
	long stock;
	
	if(unitsInStock.isEmpty())
		stock = 0;
	else
		stock = Long.valueOf(unitsInStock);
	
	Enumeration files = multi.getFileNames();
	String fname = (String) files.nextElement();
	String fileName = multi.getFilesystemName(fname);
	
	PreparedStatement pstmt = null;
	
	String sql = "insert into product values(?,?,?,?,?,?,?,?,?)";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, productId);
	pstmt.setString(2, name);
	pstmt.setInt(3, price);
	pstmt.setString(4, description);
	pstmt.setString(5, category);
	pstmt.setString(6, manufacturer);
	pstmt.setLong(7, stock);
	pstmt.setString(8, condition);
	pstmt.setString(9, fileName);
	
	/*
	pstmt.setString(1, p_id);
	pstmt.setString(2, p_name);
	pstmt.setInt(3, p_unitPrice);
	pstmt.setString(4, p_description);
	pstmt.setString(5, p_category);
	pstmt.setString(6, p_manufacturer);
	pstmt.setLong(7, p_unitsInStock);
	pstmt.setString(8, p_condition);
	pstmt.setString(9, p_fileName);
	*/
	
	pstmt.executeUpdate();
	
	if(pstmt != null)
		pstmt.close();
	if(conn != null)
		conn.close();
	
	response.sendRedirect("products.jsp");

%>