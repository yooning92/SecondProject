<%@page import="com.itwill.shop.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
request.setCharacterEncoding("UTF-8");
String noStr = request.getParameter("c_no");

if(noStr==null || noStr.equals("")) {
	 response.sendRedirect("product_list.jsp");
	 return;
}

CartService cartService = new CartService();
cartService.deleteCartOne(Integer.parseInt(noStr));

response.sendRedirect("cart_view.jsp");

%>




