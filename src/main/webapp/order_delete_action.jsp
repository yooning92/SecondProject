<%@page import="com.itwill.shop.service.ReviewService"%>
<%@page import="com.itwill.shop.dto.Order"%>
<%@page import="com.itwill.shop.service.OrderService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="login_check.jspf" %>       
<%
       	if(request.getMethod().equalsIgnoreCase("GET")){
       		response.sendRedirect("order_list.jsp");
       		return;
       	}
       	String o_noStr=request.getParameter("cancel_order_no");
       	OrderService orderService=new OrderService();
       	
       	Order order = new Order(Integer.parseInt(o_noStr),null,null,0,null,null);
       	orderService.hideOrder(order);
       	//o_no와 연관된 review 모두 delete
       	/* 
       	ReviewService reviewService = new ReviewService();
       	reviewService.deleteByReviewNo(review);
       	 */
       	response.sendRedirect("order_list.jsp");
%>