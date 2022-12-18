<%@page import="com.itwill.shop.dto.Category"%>
<%@page import="com.itwill.shop.dto.Product"%>
<%@page import="com.itwill.shop.dto.CartItem"%>
<%@page import="com.itwill.shop.service.CartService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="login_check.jspf" %>
<%

request.setCharacterEncoding("UTF-8");

if(request.getMethod().equalsIgnoreCase("GET")){
		response.sendRedirect("product_list.jsp");
		return;
	}


	String cart_qtyStr = request.getParameter("cart_qty");
	String p_noStr=request.getParameter("p_no");
	
	//Integer.parseInt(cart_qtyStr)
	//Integer.parseInt(p_noStr)
	
	CartService cartService=new CartService();
	CartItem cartItem = new CartItem(0,Integer.parseInt(cart_qtyStr),sUserId,new Product(Integer.parseInt(p_noStr), "", 0, "","", 0,new Category(0,null)));
	cartService.addCart(cartItem);
	
	response.sendRedirect("cart_view.jsp");

%>

