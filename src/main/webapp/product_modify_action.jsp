<%@page import="com.itwill.shop.dto.Category"%>
<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="com.itwill.shop.service.ProductService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%

request.setCharacterEncoding("UTF-8");

String noStr = request.getParameter("p_no");
String nameStr = request.getParameter("p_name");
String priceStr = request.getParameter("p_price");
String imageStr = request.getParameter("p_image");
String descStr = request.getParameter("p_desc");
String categoryStr = request.getParameter("category");

ProductService productService = new ProductService();
Product updateProduct = new Product(Integer.parseInt(noStr),nameStr,Integer.parseInt(priceStr),imageStr,descStr,0,new Category(Integer.parseInt(categoryStr),null)); 
productService.updateProduct(updateProduct);

response.sendRedirect("product_detail.jsp?p_no="+noStr+"&cg_no="+categoryStr);
 
%>