<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="com.itwill.shop.dto.Category"%>
<%@page import="com.itwill.shop.dto.CartItem"%>
<%@page import="com.itwill.shop.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%
if(request.getMethod().equalsIgnoreCase("GET")){
	response.sendRedirect("product_list.jsp");
	return;
}
String cart_noStr=request.getParameter("c_no");
String cart_qtyStr=request.getParameter("c_qty");
//String p_noStr = request.getParameter("p_no");

CartService cartService=new CartService();

CartItem cartItem = new CartItem(Integer.parseInt(cart_noStr),
								Integer.parseInt(cart_qtyStr),
								sUserId,
								new Product(0,"",0,"","",0,
											new Category(0,"")));
if(cart_qtyStr.equals("0")){
	cartService.deleteCartOne(Integer.parseInt(cart_noStr));
}else{
	cartService.updateCart(cartItem);
}
response.sendRedirect("cart_view.jsp");

%>


