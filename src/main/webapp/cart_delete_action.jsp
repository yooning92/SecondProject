<%@page import="com.itwill.shop.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
request.setCharacterEncoding("UTF-8");

if(sUserId==null || sUserId.equals("")) {
	 response.sendRedirect("cart_view.jsp");
	 return;
}

CartService cartService = new CartService();
cartService.deleteCartAll(sUserId);

response.sendRedirect("product_list.jsp");
%>

